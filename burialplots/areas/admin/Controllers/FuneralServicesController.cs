using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class FuneralServicesController : Controller
    {
        // GET: Admin/FuneralServices
        public ActionResult Index()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public PartialViewResult LoadFuneralServices()
        {
            var list = new FuneralServicesRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/FuneralServices/_LoadFuneralServices.cshtml", list);
        }

        [HttpPost]
        public string SaveFuneralServices(string id, string name, string description, string picture)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new FuneralService();
                obj.Date = DateTime.Now.Date;
                obj.Description = description;
                obj.Name = name;
                obj.Picture = picture;
                var f = new FuneralServicesRepository().Add(obj);
                if (f)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                var obj = new FuneralServicesRepository().GetById(Convert.ToDecimal(id));
                obj.Date = DateTime.Now.Date;
                obj.Description = description;
                obj.Name = name;
                obj.Picture = picture;
                var f = new FuneralServicesRepository().Update(obj);
                if (f)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
        }

        [HttpPost]
        public string DeleteFuneralServices(string id)
        {
            try
            {
                new FuneralServicesRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }
    }
}