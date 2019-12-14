using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcShopping.Models;
using System.Drawing;
namespace MvcShopping.Controllers
{
    public class HomeController : Controller
    {
        MvcShoppingContext db = new MvcShoppingContext();
        //
        // GET: /Home/

        public ActionResult Index()
        {

            var data = db.ProdcutCategories.ToList();
            //插入演示数据
            if (data.Count==0)
            {
                db.ProdcutCategories.Add(          
                     new ProductCategory(){Id=1,Name="文具"}
                );
                 db.ProdcutCategories.Add(  
                     new ProductCategory(){Id=2,Name="礼品"}
                     );
                 db.ProdcutCategories.Add(
                     new ProductCategory(){Id=3,Name="书籍"}
                     );
                 db.ProdcutCategories.Add(
                     new ProductCategory() {Id = 4, Name = "美劳用品" }
                     );
                 db.SaveChanges();
                 data = db.ProdcutCategories.ToList();
            }
            return View(data);
        }
        /// <summary>
        /// 商品列表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ProductList(int id)
        {
            var productCategory = db.ProdcutCategories.Find(id);
            if (productCategory != null)
            {
                var data = productCategory.Products.ToList();
                if (data.Count == 0)
                {
                    productCategory.Products.Add(
                      new Product()
                      {
                          productCategory = productCategory,
                          Name = "原子笔",
                          Description = "N/A",
                          Color ="黑色",
                          Price = 100,
                          PublishOn = DateTime.Now
                          
                      });
                    productCategory.Products.Add(
                       new Product()
                       {
                           productCategory = productCategory,
                           Name = "铅笔",
                           Description = "N/A",
                           Color = "黑色",
                           Price =150,
                           PublishOn = DateTime.Now
                          
                       });

                    db.SaveChanges();
                    data = productCategory.Products.ToList();
                }
                return View(data);
            }
            else
            {
                return HttpNotFound();
            }
            
        }

        /// <summary>
        /// 商品明细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ProductDetail(int id)
        {
            var data = db.Products.Find(id);

            return View(data);
        }


    }
}
