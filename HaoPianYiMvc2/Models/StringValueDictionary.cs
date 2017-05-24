using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HaoPianYiMvc2.Models
{
    public class StringValueDictionary
    {
        //促销类型的字符串数组
        public static string[] TypeStr = new string[] { "Deal", "Coupon", "Free", "Rebate" };

        //状态的字符串数组
        public static string[] StatusStr = new string[] { "OnSale", "Expire", "Soldout" };
    }
}