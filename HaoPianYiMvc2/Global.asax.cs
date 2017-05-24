using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using HaoPianYiMvc2.Helpers;

namespace HaoPianYiMvc2
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "PagedListReview",
                "PagedListReview/",
                new { controller = "Home", action = "PagedListReview", pageIndex = UrlParameter.Optional }

            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );


        }

        protected void Application_Start()
        {


            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }

        protected void Session_Start()
        {
            //这个不能删，因为上传图片Create或Edit里面Photoupload.ascx文件第11行需要一个Session，
            //如果发现取不出会报错。所以这里统一每个Session进来就产生一个SessionId。
            string dumpSession = Session.SessionID;
        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            Context.Items["BeginRequestTickCount"] = Performance.GetTickCount();

        }
    }
}