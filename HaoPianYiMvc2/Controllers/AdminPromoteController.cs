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
    public class AdminPromoteController : Controller
    {

          HaoPianYiEntitiesContainer db;
        public AdminPromoteController()
        {
            if (db == null)
            {
                db = new HaoPianYiEntitiesContainer();
            }
        }
        //
        // GET: /AdminPromote/

        public ActionResult Index(int? id)
        {
            var promotes = from p in db.PromoteSet
                           orderby p.PromoteCode descending
                           select p;
            return View( promotes.ToPagedList(id??0,10));
        }

    
        //
        // GET: /AdminPromote/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /AdminPromote/Create

        [HttpPost]
        public ActionResult Create( Promote promote)
        {
            if(ModelState.IsValid)
            {
                db.AddToPromoteSet(promote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(promote);
       
        }
        
        //
        // GET: /AdminPromote/Edit/5
 
        public ActionResult Edit(int id)
        {
            Promote promote = db.PromoteSet.FirstOrDefault(p => p.PromoteId == id);

            return View(promote);
        }

        //
        // POST: /AdminPromote/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Promote promote = db.PromoteSet.FirstOrDefault(p => p.PromoteId == id);

            if(ModelState.IsValid)
            {
                UpdateModel(promote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(promote);
        }

        //
        // GET: /AdminPromote/Delete/5
 

        public ActionResult Delete(int id, FormCollection collection)
        {
            Promote promote = db.PromoteSet.FirstOrDefault(p => p.PromoteId == id);
            try
            {
                db.DeleteObject(promote);
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
