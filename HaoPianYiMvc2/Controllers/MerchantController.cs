using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HaoPianYiMvc2.Models;
using HaoPianYiMvc2.ViewModels;

namespace HaoPianYiMvc2.Controllers
{
    public class MerchantController : Controller
    {
        //
        // GET: /Merchant/
        private HaoPianYiEntitiesContainer db;
        public MerchantController()
        {
            if (db == null)
                db = new HaoPianYiEntitiesContainer();
        }


        public ActionResult Index()
        {

            var query = from m in db.MerchantSet
                            group m by m.MerchantEnglish.Substring(0, 1).ToUpper() into groups
                            select new
                            {
                                letter = groups.Key,
                                 mlist = groups.AsEnumerable()

                            };

            List<MerchantViewModel> merchantViewModelList = new List<MerchantViewModel>();
            foreach( var p in query)
            {
                 merchantViewModelList.Add( new MerchantViewModel{ letter = p.letter, merchants=p.mlist.ToList() });
            }

            return View(merchantViewModelList );
        }

        public ActionResult ListFlyersOfThisMerchant(int id)
        {
            var merchant = db.MerchantSet.FirstOrDefault(m => m.MerchantId == id);
            ViewData["MerchantName"]=merchant.MerchantName;

            var query = from f in db.FlyerSet.Include("Promote").Include("Category").Include("Merchant").Where(f => f.MerchantId == id).ToList()
                        orderby f.flyerId descending
                        select f;
           
            return View(query);
                        
        }

    }
}
