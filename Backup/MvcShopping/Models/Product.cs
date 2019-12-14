using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Drawing;
namespace MvcShopping.Models
{
    [DisplayName("商品信息")]
    [DisplayColumn("Name")]
    public class Product
    {
        [Key]
        public int Id { get; set; }

        [DisplayName("商品类别")]
        [Required]
        public virtual ProductCategory productCategory { get; set; }
        
        [DisplayName("商品名称")]
        [Required(ErrorMessage="请输入商品名称")]
        [MaxLength(60,ErrorMessage="商品名称不可超过60个字")]
        public string Name { get; set; }
        
        [DisplayName("商品简介")]
        [Required(ErrorMessage = "请输入商品简介")]
        [MaxLength(250, ErrorMessage = "商品名称不可超过250个字")]
        public string Description { get; set; }
        
        [DisplayName("商品颜色")]
        [Required(ErrorMessage = "请输入商品颜色")]       
        public string Color { get; set; }

        [DisplayName("商品价格")]
        [Required(ErrorMessage = "请输入商品价格")]
        [Range(99,10000, ErrorMessage = "商品价格必须介于99-10000之间")]
        public int Price { get; set; }

        [DisplayName("上架时间")]
        [Description("如果不设置上架时间，代表此商品永不上架")]
        public DateTime PublishOn { get; set; }

        [DisplayName("商品地址")]
        public string Url { get; set; }
    }
}