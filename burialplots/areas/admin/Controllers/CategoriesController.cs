using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        // GET: Admin/Categories
        public ActionResult Index()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

    
        public string CategoryAdd(string code, string name, string status,string image)
        {
            try
            {
                Category cate = new Category();
                cate.Code = code;
                cate.CateName = name;
                cate.CatPic = image;
                if(status=="yes")
                {
                    cate.Active = true;
                }
                else
                {
                    cate.Active = false;
                }
                var add = new CategoryRepository().Add(cate);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }

        }
        public ActionResult LoadCategry()
        {
            var data = new CategoryRepository().GetAll().ToList();
            return View("/Areas/Admin/Views/Categories/_ViewCAtegory.cshtml", data);
        }
        public ActionResult LoadCategories()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        [HttpPost]
        public string Delete(string id)
        {
            var Id = Convert.ToInt32(id);
            var c = new CategoryRepository().GetById(Id);
            var del = new CategoryRepository().DeleteRecord(Id);
            if (del)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }
        [HttpPost]
        public string EditCat(string id, string code, string catname, string catpic)
        {
            var Id = Convert.ToInt32(id);
            var c = new Category();
            c.Id = Id;
            c.Code = code;
            c.CateName = catname;
            if (catpic != null)
            {
                c.CatPic = catpic;
            }
            else
            {
                c.CatPic = c.CatPic;
            }
            var up = new CategoryRepository().Update(c);
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