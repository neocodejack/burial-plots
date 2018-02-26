using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Customer.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Customer/Dashboard
        public ActionResult Index()
        {
            if (Session["cmemId"] == null)
            {
                return Redirect(Url.Content("~/Home/LoginSignup"));
            }
            return View();
        }
    }
}