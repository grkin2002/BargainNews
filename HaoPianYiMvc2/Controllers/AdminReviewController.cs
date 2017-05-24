using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HaoPianYiMvc2.Models;
using Webdiyer.WebControls.Mvc;

namespace HaoPianYiMvc2.Controllers
{
    public class AdminReviewController : Controller
    {

        HaoPianYiEntitiesContainer db;
        public AdminReviewController()
        {
            if (db == null)
                db = new HaoPianYiEntitiesContainer();
        }
        
        //
        // GET: /AdminReview/

        public ActionResult Index(int? id)
        {
            var query = from p in db.ReviewSet
                        orderby p.ReviewDate descending
                        select p;
            return View(query.ToPagedList(id?? 0,10));
        }

 


       
        //
        // GET: /AdminReview/Edit/5
 
        public ActionResult Edit(int id)
        {
            var review = db.ReviewSet.FirstOrDefault(p => p.ReviewId == id);
            return View( review);
        }

        //
        // POST: /AdminReview/Edit/5

        [HttpPost]
        public ActionResult Edit(Review review)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    UpdateModel(review);
                    db.SaveChanges();
                }
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

 

        //
        // POST: /AdminReview/Delete/5

      
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                db.DeleteObject(db.ReviewSet.FirstOrDefault(p => p.ReviewId == id));
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
