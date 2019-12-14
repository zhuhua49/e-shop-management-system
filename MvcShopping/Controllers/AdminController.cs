using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcShopping.Models;
using System.Data;
using System.Data.Entity;

namespace MvcShopping.Controllers
{
    public class AdminController : Controller
    {

        MvcShoppingContext db = new MvcShoppingContext();
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.productCategory);
            return View(products.ToList());
        }

        //添加商品
        public ActionResult Add()
        {
            ViewBag.productCategory = new SelectList(db.ProdcutCategories, "Id", "Name");
            return View();
        }

        [HttpPost]
        public ActionResult Add([Bind(Exclude="PublishOn")]Product product)
        {
            var chk_product = db.Products.Where(p => p.Name
                == product.Name).FirstOrDefault();
            if (chk_product != null)
            {
                ModelState.AddModelError("Email",
                    "你输入的Email已经存在");
            }
            if (ModelState.IsValid)
            {
                product.PublishOn = DateTime.Now;
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (!ModelState.IsValid)
            {
                List<string> sb = new List<string>();
                //获取所有错误的Key
                List<string> Keys = ModelState.Keys.ToList();
                //获取每一个key对应的ModelStateDictionary
                foreach (var key in Keys)
                {
                    var errors = ModelState[key].Errors.ToList();
                    //将错误描述添加到sb中
                    foreach (var error in errors)
                    {
                        sb.Add(error.ErrorMessage);
                    }
                }
                return Json(sb);
            }
            ViewBag.Id = new SelectList(db.ProdcutCategories, "Id", "Name", product.productCategory);
            return View(product);
        }

        //修改商品信息
        public ActionResult Edit(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id = new SelectList(db.ProdcutCategories, "Id", "Name", product.productCategory);
            return View(product);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (!ModelState.IsValid)
            {
                List<string> sb = new List<string>();
                //获取所有错误的Key
                List<string> Keys = ModelState.Keys.ToList();
                //获取每一个key对应的ModelStateDictionary
                foreach (var key in Keys)
                {
                    var errors = ModelState[key].Errors.ToList();
                    //将错误描述添加到sb中
                    foreach (var error in errors)
                    {
                        sb.Add(error.ErrorMessage);
                    }
                }
                return Json(sb);
            }
            ViewBag.Id = new SelectList(db.ProdcutCategories, "Id", "Name", product.productCategory);
            return View(product);
        }

        //删除商品
        public ActionResult Delete(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        [HttpPost,ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
