using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class ItemController : Controller
    {
        // GET: Admin/Item
        public ActionResult Index()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var catelist = new CategoryRepository().GetAll().Where(c => c.Active == true);
            ViewBag.list = catelist;
            return View();
        }

        public string ItemAdd(string code, string name, string qty, string rprict,string cprice,string cateid,string image,string status,string feature,string description)
        {
            try
            {
                Item i = new Item();
                i.CateId = Convert.ToInt32(cateid);
                i.ItemCprice = Convert.ToDecimal(cprice);
                i.ItemImage = image;
                i.ItemName = name;
                i.ItemNo = code;
                i.ItemDescription = description;
                i.ItemQty =Convert.ToInt32(qty);
                i.ItemRprice = Convert.ToDecimal(cprice);
                 if(feature=="yes")
                {
                    i.ItemFeature = true;
                }
                else
                {
                    i.ItemFeature = false;
                }
               if(status=="yes")
                {
                    i.ItemActive = true;
                }
                else
                {
                    i.ItemActive = false;
                }
                var additem = new ItemRepository().Add(i);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }

        }
        public ActionResult _LoadItem()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var data = new ItemRepository().GetAll().ToList();
            return View("~/Areas/Admin/Views/Item/_LoadItem.cshtml", data);
        }
        public ActionResult LoadItem()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        public string DeleteItem(string id)
        {
            var Id = Convert.ToInt32(id);
            var c = new ItemRepository().GetById(Id);
            var del = new ItemRepository().DeleteRecord(Id);
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
        public string EditItem(string id, string iname, string ino, string icprice, string irprice, string iqty, string img)
        {
            var Id = Convert.ToInt32(id);
            var c = new ItemRepository().GetById(Id);
            c.ItemName = iname;
            c.ItemNo = ino;
            c.ItemCprice = Convert.ToDecimal(icprice);
            c.ItemRprice = Convert.ToDecimal(irprice);
            c.ItemQty = Convert.ToInt32(iqty);


            c.ItemImage = img;


            var up = new ItemRepository().Update(c);
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