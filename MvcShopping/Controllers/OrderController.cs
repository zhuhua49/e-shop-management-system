using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcShopping.Models;
namespace MvcShopping.Controllers
{
    //必须登陆会员才能使用订单结帐功能
    [Authorize]
    public class OrderController : Controller
    {
        MvcShoppingContext db = new MvcShoppingContext();
        List<Cart> Carts
        {
            get
            {
                if (Session["Carts"] == null)
                {
                    Session["Carts"] = new List<Cart>();
                }
                return (Session["Carts"] as List<Cart>);
            }
            set
            {
                Session["Carts"] = value;
            }
        }
        public ActionResult Complete()
        {
            return View();
        }

        //将订单信息与购物车信息写入数据库
        [HttpPost]
        public ActionResult Complete(OrderHeader form)
        {
            var member = db.Members.Where(p => p.Email == User.Identity.Name).FirstOrDefault();
            if (member == null)
            {
                return RedirectToAction("Index", "Home");
            }
            if (this.Carts.Count == 0)
                return RedirectToAction("Index", "Cart");
            //将订单信息与购物车信息写入数据库
            OrderHeader oh = new OrderHeader()
            {
                member=member,
                ContactName=form.ContactName,
                ContactAddress=form.ContactAddress,
                ContractPhoneNo=form.ContractPhoneNo,
                BuyOn=DateTime.Now,
                Memo=form.Memo,
                OrderDetailItems=new List<OrderDetail>()
            };
            int total_price = 0;
            foreach (var item in this.Carts)
            {
                var product = db.Products.Find(item.product.Id);
                if (product == null) return RedirectToAction("Index", "Home");
                total_price += item.product.Price * item.Amount;
                oh.OrderDetailItems.Add(new OrderDetail()
                {
                    product = product,
                    Price = product.Price,
                    Amount = item.Amount
                });
            }
            oh.TotalPrice = total_price;
            db.Orders.Add(oh);
            db.SaveChanges();
            //清空购物车
            this.Carts.Clear();
            //订单完成之后回到首页
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Order/

        public ActionResult Index()
        {
            return View();
        }

    }
}
