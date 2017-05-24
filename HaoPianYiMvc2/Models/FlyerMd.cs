using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace HaoPianYiMvc2.Models
{
    [MetadataType(typeof(FlyerMD))]
    public partial class Flyer
    {
    }

    public class FlyerMD
    {
        [Bindable(false)]
        public long flyerId { get; set; }
        [DisplayName("优惠折扣类型")]
        public short Type { get; set; }
        [DisplayName("促销活动")]
        public int PromoteId { get; set; }
        [DisplayName("商家")]
        public int MerchantId { get; set; }
        [DisplayName("标题")]
        public string Title { get; set; }
        [DisplayName("以往促销Id")]
        public long HistoryId { get; set; }
        [DisplayName("发布日期")]
        public global::System.DateTime CreateDate { get; set; }
        [DisplayName("发布人")]
        public global::System.Guid PostedBy { get; set; }
        [DisplayName("过期日")]
        public global::System.DateTime ExpireDate { get; set; }
        [DisplayName("价格")]
        public global::System.Nullable<decimal> Price { get; set; }
        [DisplayName("折扣")]
        public global::System.Nullable<short> Discount { get; set; }
        [DisplayName("描述")]
        public string Description { get; set; }
        [DisplayName("分类")]
        public int CategoryId { get; set; }
        [DisplayName("发送网站")]
        public string SendUrl { get; set; }
        [DisplayName("点击数")]
        [Bindable(false)]
        public int ClickCount { get; set; }
        [DisplayName("评论数")]
        [Bindable(false)]
        public int ViewCount { get; set; }
        [DisplayName("状态")]
        public short Status { get; set; }
        [DisplayName("图像")]        
        public string ImgUrl { get; set; }
        [DisplayName("有效")]
        public bool Valid { get; set; }
    }
}