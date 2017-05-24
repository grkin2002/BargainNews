using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HaoPianYiMvc2.Models;

namespace HaoPianYiMvc2.ViewModels
{
    public class MerchantViewModel
    {

        public string letter { get; set; }
        public List<Merchant> merchants { get; set; }
    }
}