using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace MvcShopping.Models
{
    [DisplayName("订单主文件")]
    [DisplayColumn("DisplayName")]
    public class OrderHeader
    {
        [Key]
        public int Id { get; set; }

        [DisplayName("订购会员")]
        [Required]
        public virtual Member member { get; set; }

        [DisplayName("收件人姓名")]
        [Required(ErrorMessage = "请输入收件人姓名")]
        [MaxLength(40, ErrorMessage = "收件人姓名不能超过40个字")]
        [Description("订购的会员不一定就是收到商品的人")]
        public string ContactName { get; set; }

        [DisplayName("联系电话")]
        [Required(ErrorMessage = "请输入联系电话")]
        [MaxLength(25, ErrorMessage = "电话号码长度不过超过25个字")]
        [DataType(DataType.PhoneNumber)]
        public string ContractPhoneNo { get; set; }

        [DisplayName("邮递地址")]
        [Required(ErrorMessage = "请输入商品的邮寄地址")]
        public string ContactAddress { get; set; }

        [DisplayName("订单金额")]
        [Required]
        [DataType(DataType.Currency)]
        [Description("由于订单金额可能会受商品邮寄方式异动价格，因些必须保留购买当下计算出来的订单金额")]
        public int TotalPrice { get; set; }

        [DisplayName("订单备注")]
        [DataType(DataType.MultilineText)]
        public string Memo { get; set; }

        [DisplayName("订购时间")]
        public DateTime BuyOn { get; set; }

        [NotMapped]
        public string DisplayName
        {
            get
            {
                return this.member.Name + "于" + 
                    this.BuyOn+ "订购的商品";
            }
        }

        public virtual ICollection<OrderDetail> OrderDetailItems
        {
            get;
            set;
        }
    }
}