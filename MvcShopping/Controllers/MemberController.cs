using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using MvcShopping.Models;
namespace MvcShopping.Controllers
{
    public class MemberController : Controller
    {
        private string pwSalt = "abcdefg1234567890";
        MvcShoppingContext db = new MvcShoppingContext();
        //
        // GET: /Member/
        /// <summary>
        /// 会员注册页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Register()
        {
            return View();
        }

        /// <summary>
        /// 写入会员信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Register([Bind(Exclude="RegisterOn,AuthCode")]Member member )
        {
            var chk_member = db.Members.Where(p => p.Email 
                ==member.Email).FirstOrDefault();
            if (chk_member != null)
            {
                ModelState.AddModelError("Email", 
                    "你输入的Email已经存在");
            }
            if (ModelState.IsValid)
            {
                //将密码加“盐值”（Salt）之后进行哈希运算
                member.Password = FormsAuthentication.
                    HashPasswordForStoringInConfigFile(
                    pwSalt + member.Password, "SHA1");
                //会员注册时间
                member.RegisterOn = DateTime.Now;
                //会员验证码，采用GuID当成验证码属性
                member.AuthCode = Guid.NewGuid().ToString();
                db.Members.Add(member);
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
        }
        /// <summary>
        /// 显示会员登陆页面
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        /// <summary>
        /// 运行会员登录
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(string email, string password,
            string returnUrl)
        {
            if (ValidateUser(email, password))
            {
                FormsAuthentication.SetAuthCookie(email, false);
                if (string.IsNullOrEmpty(returnUrl))
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return RedirectToAction(returnUrl);
                }
            }
            ModelState.AddModelError("", "你输入的帐号或密码错误");
            return View();
        }
        private bool ValidateUser(string email, string password)
        {
            var hash_pw = FormsAuthentication.
                HashPasswordForStoringInConfigFile(
                pwSalt + password, "SHA1");
            var member = (from p in db.Members
                          where p.Email == email &&
                          p.Password == hash_pw
                          select p).FirstOrDefault();
            return member != null;
        }

        /// <summary>
        /// 运行会员注销
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            //清除窗体验证的cookie
            FormsAuthentication.SignOut();

            //清除所有曾经写入过的Session
            Session.Clear();

            return RedirectToAction("Index", "Home");
        }

    }
}
