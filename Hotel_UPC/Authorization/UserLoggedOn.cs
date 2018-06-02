using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Hotel_UPC.Authorization
{
    public class UserLoggedOn : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            HttpContext context = httpContext.ApplicationInstance.Context;
            if (httpContext.Session["User"]==null)
            {
                return false;
            }
            else
            {
                return base.AuthorizeCore(httpContext);
            }
          
        }
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            
            base.OnAuthorization(filterContext);
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.HttpContext.Response.Redirect("/Users/Login");
            base.HandleUnauthorizedRequest(filterContext);
        }
    }
}