using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HaoPianYiMvc2.Models;
using System.Web.Security;

namespace HaoPianYiMvc2.Helpers
{
    public static class HtmlExtensions
    {
        public static string getMemberUserNamebyUserId(this HtmlHelper html, Guid userId)
        {
            return Membership.GetUser(userId)==null ? "" : Membership.GetUser(userId).UserName;
        }

        public static string getGuidOfCurrentUser(this HtmlHelper html)
        {
            return Membership.GetUser().ProviderUserKey.ToString();
        }

        public static string getUserNameOfCurrentUser(this HtmlHelper html)
        {
            return Membership.GetUser() == null ? "" : Membership.GetUser().UserName;
        }
    }
}