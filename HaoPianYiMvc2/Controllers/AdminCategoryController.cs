using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using HaoPianYiMvc2.Models;
using System.Data;
using Webdiyer.WebControls.Mvc;

namespace HaoPianYiMvc2.Controllers
{
    [Authorize(Users="grkin2008")]
    public class AdminCategoryController : Controller
    {
        //
        // GET: /AdminCategory/
        HaoPianYiEntitiesContainer db;
        public AdminCategoryController()
        {
            if (db == null)
            {
                db = new HaoPianYiEntitiesContainer();
            }
        }

        public ActionResult Index(int? id)
        {
            var categories = from c in db.CategorySet
                             orderby c.CategoryId descending
                             select c;

            return View(categories.ToPagedList(id?? 0 , 10));
        }

        //
        // GET: /AdminCategory/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AdminCategory/Create
        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                db.AddToCategorySet(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        //
        // GET: /AdminCategory/Edit/5

        public ActionResult Edit(int id)
        {
            Category category = db.CategorySet.First(c => c.CategoryId == id);
            return View(category);
        }

        //
        // POST: /AdminCategory/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Category category = db.CategorySet.First(p => p.CategoryId == id);
            if (ModelState.IsValid)
            {
                UpdateModel(category);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(category);
        }

        //
        // GET: /AdminCategory/Delete/5
        public ActionResult Delete(int id)
        {
            Category category = db.CategorySet.ToList().Find(c => c.CategoryId == id);
            try
            {
                db.DeleteObject(category);
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
