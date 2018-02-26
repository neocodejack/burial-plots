using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class PaymentMethodsController : Controller
    {
        // GET: Admin/PaymentMethods
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
                return View();
        }

        [HttpPost]
        public string SavePaymentMethod(string id, string name, string instId, string active)
        {
            if (string.IsNullOrEmpty(id))
            {
                var list = new PaymentMethodsRepository().GetAll();
                if (active == "true")
                {
                    foreach (var item in list)
                    {
                        item.Active = false;
                        new PaymentMethodsRepository().Update(item);
                    }
                }
                var obj = new PaymentMethod();
                obj.Active = Convert.ToBoolean(active);
                obj.InstallationId = instId;
                obj.Name = name;
                var f = new PaymentMethodsRepository().Add(obj);
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
                var obj = new PaymentMethodsRepository().GetById(Convert.ToDecimal(id));
                obj.Active = Convert.ToBoolean(active);
                obj.InstallationId = instId;
                obj.Name = name;
                var f = new PaymentMethodsRepository().Update(obj);
                if (f)
                {
                    if (active == "false")
                    {
                        var act = new PaymentMethodsRepository().FirstOrDefault(c=>c.Active == true);
                        if (act == null)
                        {
                            var act2 = new PaymentMethodsRepository().FirstOrDefault();
                            if (act2 != null)
                            {
                                act2.Active = true;
                                new PaymentMethodsRepository().Update(act2);
                            }
                        }
                    }
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
        }

        [HttpPost]
        public PartialViewResult LoadPaymentMethods()
        {
            var list = new PaymentMethodsRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/PaymentMethods/_LoadPaymentMethods.cshtml", list);
        }

        [HttpPost]
        public string DeletePaymentMethod(string id)
        {
            var f = new PaymentMethodsRepository().DeleteRecord(Convert.ToDecimal(id));
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
}