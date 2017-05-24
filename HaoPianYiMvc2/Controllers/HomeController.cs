using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HaoPianYiMvc2.Models;
using HaoPianYiMvc2.Helpers;
using System.Web.Security;
using Webdiyer.WebControls.Mvc; 



namespace HaoPianYiMvc2.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        HaoPianYiEntitiesContainer db;
        int PageSize;
        public HomeController()
        {
            if (db == null)
            {
                db = new HaoPianYiEntitiesContainer();
                PageSize = 5;
            }
        }

        public ActionResult Index( int? pageIndex )
        {
            var  flyers = from f in db.FlyerSet.Include("Promote").Include("Category").Include("Merchant").Include("Reviews")
                         orderby f.flyerId descending
                         select f;
            if (Request.IsAjaxRequest())
            {
                return PartialView("IndexFlyerListUserControl", flyers.ToPagedList(pageIndex ?? 0, PageSize));
            }
            return View(flyers.ToPagedList(pageIndex?? 0, PageSize ));
        }

        public ActionResult Detail(int id)
        {
            var flyer = db.FlyerSet.Include("Promote").Include("Category").Include("Merchant").Include("Reviews").FirstOrDefault(f=>f.flyerId==id);
            ViewData["FlyerId"] = flyer.flyerId;
            return View(flyer);
        }

        //追加评论后返回评论列表，而且要更改评论数count
        
        public PartialViewResult PostReview(Review review)
        {
            if (!string.IsNullOrEmpty(review.Content) && Request.IsAjaxRequest() && Request.IsAuthenticated)
            {
                review.ReviewDate = DateTime.Now;
                review.UserID = (Guid)Membership.GetUser().ProviderUserKey;
                review.Flyer = db.FlyerSet.FirstOrDefault(f => f.flyerId == review.FlyerId);
                ViewData["FlyerId"] = review.Flyer.flyerId;
                db.AddToReviewSet(review);
                db.SaveChanges();
            }
            PagedList<Review> reviews = db.ReviewSet.Where(r => r.FlyerId == review.FlyerId).OrderByDescending(p => p.ReviewDate).ToPagedList(0, 10);
            return PartialView("ReviewMessage", reviews);
        }


        public PartialViewResult PagedListReview(int? pageIndex, int FlyerId)
        {
            PagedList<Review> pageReviews = db.ReviewSet.Where(r => r.FlyerId == FlyerId).OrderByDescending(p => p.ReviewDate).ToPagedList(pageIndex ?? 0, 10);
            ViewData["FlyerId"] = FlyerId;
            return PartialView("ReviewPageListUserControl", pageReviews);
        }


        public ActionResult Direct(int id, string sendUrl)
        {
            if (!string.IsNullOrEmpty(sendUrl))
            {
                //这里统计每个flyer被点击的次数
                var flyer = db.FlyerSet.FirstOrDefault(f => f.flyerId == id);
                flyer.ClickCount=flyer.ClickCount+1;
                db.SaveChanges();
                return Redirect(sendUrl);
            }
            return View("Error");
        }

        [Authorize(Users="grkin2008")]
        public ActionResult AdminEntrance()
        {
            return View();
        }



        public ActionResult About()
        {
            return View();
        }








    }
}
