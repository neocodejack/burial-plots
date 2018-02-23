using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Admin/Dashboard
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.userName =Session["adminUser"];
            string role = Convert.ToString(Session["adminRole"]);
            if(role == "SuperAdmin")
            {
                ViewBag.Title = "SuperAdmin";
            }
            else if (role == "Admin")
            {
                ViewBag.Title = "Cemetery Manager";
            }
            else
            {
                ViewBag.Title = "Partner";
            }
            var order = new OrderRepository().GetAll().AsQueryable();
            ViewBag.neworder = order.Where(x => x.Status == "pending").ToList().Count;
            ViewBag.confirmed = order.Where(x => x.Status == "delivered").ToList().Count;
            ViewBag.totla = order.ToList().Count;
            var service = new ServiceListingRepository().GetAll().AsQueryable();
            ViewBag.totalservic = service.ToList().Count;
            ViewBag.confrim = service.Where(x => x.IsApproved == true).ToList().Count;
            ViewBag.servicelistp = service.Where(x => x.IsApproved == false).ToList().Count;
            return View();
        }
    }
}