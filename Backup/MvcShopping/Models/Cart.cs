﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MvcShopping.Models
{
    public class Cart
    {
        [DisplayName("选购商品")]
        [Required]
        public Product product { get; set; }

        [DisplayName("选购数量")]
        [Required]
        public int Amount { get; set; }
    }
}