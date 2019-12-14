using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace MvcShopping.Models
{
    
    public class MemberLoginViewModel
    {
        [DisplayName("会员帐号")]
        [DataType(DataType.EmailAddress,ErrorMessage="请输入Email地址")]
        [Required(ErrorMessage="请输入{0}")]
        public string Email { get; set; }

        [DisplayName("会员密码")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "请输入{0}")]
        public string Password { get; set; }

    }
}