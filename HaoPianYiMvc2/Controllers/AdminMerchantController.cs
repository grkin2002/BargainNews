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
    public class AdminMerchantController : Controller
    {

          HaoPianYiEntitiesContainer db;
        public AdminMerchantController()
        {
            if (db == null)
            {
                db = new HaoPianYiEntitiesContainer();
            }
        }
        //
        // GET: /AdminMerchant/

        public ActionResult Index(int? id)
        {
            var merchant = from m in db.MerchantSet
                           orderby m.MerchantId descending
                           select m;
            return View(merchant.ToPagedList(id??0,10));
        }

        //
        // GET: /AdminMerchant/Create
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /AdminMerchant/Create

        [HttpPost]
        public ActionResult Create(Merchant merchant)
        {
            if(ModelState.IsValid)
            {
                db.AddToMerchantSet(merchant);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
     
                return View( merchant);
            
        }
        
        //
        // GET: /AdminMerchant/Edit/5
 
        public ActionResult Edit(int id)
        {
            Merchant merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == id);
            return View(merchant);
        }

        //
        // POST: /AdminMerchant/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Merchant merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == id);
            if(ModelState.IsValid)
            {
                UpdateModel(merchant);
                db.SaveChanges();
 
                return RedirectToAction("Index");
            }
       
                return View(merchant);
         
        }

        //
        // GET: /AdminMerchant/Delete/5
        public ActionResult Delete(int id, FormCollection collection)
        {

            Merchant merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == id);
            try
            {
                db.DeleteObject(merchant);
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
