using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcShopping.Models;

namespace MvcShopping.Controllers
{
    public class CartController : Controller
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
        //添加商品到购物车，如果没有传入Amout参数则默认购买1
        [HttpPost]
        //因为知道要通过Ajax调用此Action，所以标示为HttpPost
        public ActionResult AddToCart(int productId,
            int Amount = 1)
        {
            var product = db.Products.Find(productId);
            //验证产品是否存在
            if (product == null)
            {
                return HttpNotFound();
            }
            var existCart = this.Carts.FirstOrDefault(
                p => p.product.Id == productId);
            if (existCart != null)
            {
                existCart.Amount += 1;
            }
            else
            {
                this.Carts.Add(new Cart()
                {
                    product = product,
                    Amount = Amount
                });
            }
            return new HttpStatusCodeResult(
                System.Net.HttpStatusCode.Created);
        }

        //移除购物车中的商品
        [HttpPost]
        public ActionResult Remove(int productId)
        {
            var existCart = this.Carts.FirstOrDefault(
                p => p.product.Id == productId);
            if (existCart != null)
            {
                this.Carts.Remove(existCart);
            }
            return new HttpStatusCodeResult(
                System.Net.HttpStatusCode.OK);
        }

        //更新购物车中特定商品的购买数量
        [HttpPost]
        public ActionResult UpdateAmount(List<Cart> Carts )
        {
            foreach (var item in Carts)
            {
                var existCart = this.Carts.FirstOrDefault(
                    p => p.product.Id == item.product.Id);
                if (existCart != null)
                {
                    existCart.Amount = item.Amount;
                }
            }
            return RedirectToAction("Index", "Cart");
        }
        //
        // GET: /Cart/

        public ActionResult Index()
        {
            return View(this.Carts);
        }

    }
}
