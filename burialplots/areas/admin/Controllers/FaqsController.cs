using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class FaqsController : Controller
    {
        // GET: Admin/Faqs
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadFAQS()
        {
            var list = new FAQsRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Faqs/_LoadFAQs.cshtml", list);
        }

        [HttpPost]
        public string SaveFAQS(string id, string question, string answer)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new FAQ();
                obj.Question = question;
                obj.Answer = answer;
                obj.AddedDate = DateTime.Now;
                var f = new FAQsRepository().Add(obj);
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
                var obj = new FAQsRepository().GetById(Convert.ToDecimal(id));
                obj.Question = question;
                obj.Answer = answer;
                var f = new FAQsRepository().Update(obj);
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
        public string DeleteFAQS(string id)
        {
            var f = new FAQsRepository().DeleteRecord(Convert.ToDecimal(id));
            if (f)
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }

        [HttpPost]
        public string EditFAQS(string id)
        {
            var obj = new FAQsRepository().GetById(Convert.ToDecimal(id));
            var temp = new FAQsModel();
            temp.Id = obj.Id + "";
            temp.Question = obj.Question;
            temp.Answer = obj.Answer;
            var serial = new JavaScriptSerializer();
            return serial.Serialize(temp);
        }
    }
}