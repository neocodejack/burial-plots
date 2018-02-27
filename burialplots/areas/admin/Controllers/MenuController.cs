using BurialPlots.DAL;
using BurialPlots.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class MenuController : Controller
    {
        // GET: Admin/Menu
        [GZipOrDeflate]
        public ActionResult Index()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var pagurl = new PageRepository().GetAll();
                var mainmenu = new MenuRepository().GetAll();
                var submenu = new Submenurepo().GetAll();
                ViewBag.submenu = submenu;
                ViewBag.mainmenu = mainmenu;
                ViewBag.pageurl = pagurl;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public string MenuAdded(string name, string url)
        {
            var m = new Menu();
            m.Category = name;
            m.Pageurl = url;
            var add = new MenuRepository().Add(m);
            return "true";
        }

        public string SubmenuAdd(string name, string url, string mainmenu)
        {

            var m = new submenu();
            m.pagetitle = name;
            m.pageurl = "/Admin/Page/PageView/" + url;
            m.menuId = Convert.ToInt32(mainmenu);
            var add = new Submenurepo().Add(m);
            return "true";
        }

        public string SubmenuChildAdd(string name, string url, string submenu)
        {
            var chlid = new SubChlidMenu();
            chlid.MenuId = Convert.ToInt32(submenu);
            chlid.PageTitle = name;
            chlid.PageUrl = url;
            var add = new SubChlidMenuRepository().Add(chlid);

            return "true";
        }

        [HttpPost]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        [GZipOrDeflate]
        public ActionResult LoadMenu()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var data = new MenuRepository().GetAll().ToList();
                return View("~/Areas/Admin/Views/Menu/_LoadMenu.cshtml", data);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [GZipOrDeflate]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        public ActionResult LoadMenus()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var pagurl = new PageRepository().GetAll();
                var p = new MenuRepository().GetAll();
                ViewBag.Category = p;
                ViewBag.pageurl = pagurl;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public string DeleteMenu(string id)
        {
            var Id = Convert.ToInt32(id);
            var del = new MenuRepository().GetById(Id);
            var res = new MenuRepository().DeleteRecord(Id);
            if (res)
            {
                return "True";
            }
            else
            {
                return "false";
            }

        }

        [HttpPost]
        public string Edit(string id, string a, string b)
        {
            var Id = Convert.ToInt32(id);
            //var c = new MenuRepository().GetById(Id);
            Menu c = new Menu();
            c.Id = Id;
            c.Pageurl = a;
            c.Category = b;


            var res = new MenuRepository().Update(c);
            if (res)
            {
                return "True";

            }
            else
            {
                return "false";
            }
        }
        [HttpPost]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        [GZipOrDeflate]
        public ActionResult LoadSubMenu(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var Id = Convert.ToDecimal(id);
                var data = new Submenurepo().GetAll(c => c.menuId == Id).ToList();
                return View("~/Areas/Admin/Views/Menu/_LoadSubMenu.cshtml", data);
            }
            
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        [GZipOrDeflate]
        public ActionResult LoadSubChildMenu(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var Id = Convert.ToDecimal(id);
                var data = new SubChlidMenuRepository().GetAll(c => c.MenuId == Id).ToList();
                return View("~/Areas/Admin/Views/Menu/_LoadSubChildMenu.cshtml", data);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [GZipOrDeflate]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        public ActionResult LoadSubMenus(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                ViewBag.id = id;
                var obj = new MenuRepository().GetById(Convert.ToDecimal(id));
                if (obj != null)
                {
                    ViewBag.name = "(" + obj.Category + ")";
                }
                else
                {
                    ViewBag.name = "";
                }
                var pagurl = new PageRepository().GetAll();
                ViewBag.pageurl = pagurl;
                return View();
            }

            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [GZipOrDeflate]
        [OutputCache(Duration = 10, VaryByParam = "none")]
        public ActionResult LoadSubChildMenus(string id, string subId)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                ViewBag.subId = subId;
                ViewBag.id = id;
                var obj = new Submenurepo().GetById(Convert.ToDecimal(id));
                if (obj != null)
                {
                    ViewBag.name = "(" + obj.pagetitle + ")";
                }
                else
                {
                    ViewBag.name = "";
                }
                var pagurl = new PageRepository().GetAll();
                ViewBag.pageurl = pagurl;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public string DeleteSubMenu(string id)
        {
            var Id = Convert.ToInt32(id);
            var c = new Submenurepo().GetById(Id);
            var del = new Submenurepo().DeleteRecord(Id);
            if (del)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }

        public string DeleteSubChildMenu(string id)
        {
            var Id = Convert.ToInt32(id);

            var del = new SubChlidMenuRepository().DeleteRecord(Id);
            if (del)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }

        public string EditSubMenu(string id, string b, string c)
        {

            var sub = new Submenurepo().GetById(Convert.ToDecimal(id));
            sub.pagetitle = b;
            sub.pageurl = c;
            var up = new Submenurepo().Update(sub);
            if (up)
            {
                return "True";
            }
            else
            {
                return "false";
            }

        }

        public string Subchildedit(string id, string b, string c)
        {

            var sub = new SubChlidMenuRepository().GetById(Convert.ToInt32(id));
            sub.PageTitle = b;
            sub.PageUrl = c;
            var up = new SubChlidMenuRepository().Update(sub);
            if (up)
            {
                return "True";
            }
            else
            {
                return "false";
            }

        }
    }
}