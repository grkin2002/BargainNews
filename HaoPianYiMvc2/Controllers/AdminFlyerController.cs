using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HaoPianYiMvc2.Models;
using Webdiyer.WebControls.Mvc;

namespace HaoPianYiMvc2.Controllers
{
    [Authorize(Users = "grkin2008")]
    public class AdminFlyerController : Controller
    {
        //
        // GET: /AdminFlyer/
        HaoPianYiEntitiesContainer db;
        public AdminFlyerController()
        {
            if (db == null)
            {
                db = new HaoPianYiEntitiesContainer();
                
            }
        }
        public ActionResult Index(int? id)
        {

            var flyers = from f in db.FlyerSet.Include("Promote").Include("Category").Include("Merchant")
                         orderby f.flyerId descending
                         select f;
            return View(flyers.ToPagedList(id??0,10));
        }



        //
        // GET: /AdminFlyer/Create

        public ActionResult Create()
        {
           

            ViewData["Promote"] = db.PromoteSet.ToList();
            ViewData["Merchant"] = db.MerchantSet.ToList();
            ViewData["Category"] = db.CategorySet.ToList();
            return View();
        }

        //
        // POST: /AdminFlyer/Create

        [HttpPost]
        public ActionResult Create(Flyer flyer)
        {
            if (ModelState.IsValid)
            {
                
                flyer.Promote = db.PromoteSet.FirstOrDefault(p => p.PromoteId == flyer.PromoteId);
                flyer.Merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == flyer.MerchantId);
                flyer.Category = db.CategorySet.FirstOrDefault(c => c.CategoryId == flyer.CategoryId);

              
                db.AddToFlyerSet(flyer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["Promote"] = db.PromoteSet.ToList();
            ViewData["Merchant"] = db.MerchantSet.ToList();
            ViewData["Category"] = db.CategorySet.ToList();
            return View(flyer);
        }

        //
        // GET: /AdminFlyer/Edit/5

        public ActionResult Edit(int id)
        {
            Flyer flyer = db.FlyerSet.First(f => f.flyerId == id);
            ViewData["Promote"] = db.PromoteSet.ToList();
            ViewData["Merchant"] = db.MerchantSet.ToList();
            ViewData["Category"] = db.CategorySet.ToList();
            return View(flyer);
        }

        //
        // POST: /AdminFlyer/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Flyer flyer = db.FlyerSet.FirstOrDefault(f => f.flyerId == id);
            flyer.Promote = db.PromoteSet.FirstOrDefault(p => p.PromoteId == flyer.PromoteId);
            flyer.Merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == flyer.MerchantId);
            flyer.Category = db.CategorySet.FirstOrDefault(c => c.CategoryId == flyer.CategoryId);
            if (ModelState.IsValid)
            {
                UpdateModel(flyer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["Promote"] = db.PromoteSet.ToList();
            ViewData["Merchant"] = db.MerchantSet.ToList();
            ViewData["Category"] = db.CategorySet.ToList();
            return View(flyer);
        }

        //
        // GET: /AdminFlyer/Delete/5
        public ActionResult Delete(int id, FormCollection collection)
        {
            Flyer flyer = db.FlyerSet.FirstOrDefault(f => f.flyerId == id);
            try
            {
                db.DeleteObject(flyer);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View("Error");
            }
        }
    }
}
