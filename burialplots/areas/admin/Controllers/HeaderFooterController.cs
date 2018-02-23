using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class HeaderFooterController : Controller
    {
        // GET: Admin/FooterPage
        public ActionResult Index()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public ActionResult FooterPage()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [ValidateInput(false)]
        [HttpPost]
        public string SaveFooterSetting(string copyRight, string branding)
        {
            var obj = new FooterRepository().FirstOrDefault();
            if (obj == null)
            {
                var obj2 = new Footer();
                obj2.CopyRight = copyRight;
                obj2.Branding = branding;
                obj2.PubDate = DateTime.Now.Date;
                var f = new FooterRepository().Add(obj2);
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
                obj.CopyRight = copyRight;
                obj.Branding = branding;
                obj.PubDate = DateTime.Now.Date;
                var f = new FooterRepository().Update(obj);
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
        public string LoadFooterSetting()
        {
            var list = new FooterRepository().FirstOrDefault();
            var aa = new JavaScriptSerializer();
            return aa.Serialize(list);
        }
    }
}