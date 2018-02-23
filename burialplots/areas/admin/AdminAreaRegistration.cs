using System.Web.Mvc;

namespace BurialPlots.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                name: "",
                url: "",
                defaults: new { controller = "Page", action = "PageView", id = "Index" },
                namespaces: new[] { "BurialPlots.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                name: "p2",
                url: "{id}",
                defaults: new { controller = "Page", action = "PageView", id = UrlParameter.Optional },
                namespaces: new[] { "BurialPlots.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}