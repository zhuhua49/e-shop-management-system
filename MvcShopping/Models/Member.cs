using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MvcShopping.Models
{
    [DisplayName("会员信息")]
    [DisplayColumn("Name")]
    public class Member
    {
        [Key]
        public int Id { get; set; }

        [DisplayName("会员帐号(Email)")]
        [Required(ErrorMessage = "请输入Email地址")]
        [Description("我们直接以Email当成会员的登录帐号")]
        [MaxLength(250, ErrorMessage = "Email的长度不能超过250个字符")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [DisplayName("会员密码")]
        [Required(ErrorMessage = "请输入密码")]
        [Description("密码将以SHA进行哈希运算，通过SHA1哈希运算后的结果转为Hex表示法的字符串长度皆为40个字符")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [DisplayName("中文姓名")]
        [Required(ErrorMessage = "请输入中文姓名")]
        [MaxLength(5,ErrorMessage="中文姓名不可超过5个字")]
        [Description("暂不考虑英文注册情况")]
        public string Name { get; set; }

        [DisplayName("网络昵称")]
        [Required(ErrorMessage = "请输入网络昵称")]
        [MaxLength(10, ErrorMessage = "网络昵称不可超过10个字")]
        public string Nickname { get; set; }

        [DisplayName("会员注册时间")]       
        public DateTime RegisterOn { get; set; }

        [DisplayName("会员启用认证吗")]       
        [MaxLength(36)]
        [Description("当AuthCode等于Null，则代表该会员已经通过Email有效性验证")]
        public string AuthCode { get; set; }

        public virtual ICollection<OrderHeader> Orders { get; set; }
    }
}