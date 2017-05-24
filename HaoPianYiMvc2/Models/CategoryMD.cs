using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HaoPianYiMvc2.Models
{
     [MetadataType(typeof(CategoryMD))]
    
    public partial class Category
    {
         
         public class CategoryMD
         {
             [ScaffoldColumn(false)]
             [Bindable(false)]
             public int CategoryId { get; set; }
             
             [DisplayName("分类")]
             public string CategoryName { get; set; }
             [DisplayName("描述")]
             public string Description { get; set; }
         }
    }
}