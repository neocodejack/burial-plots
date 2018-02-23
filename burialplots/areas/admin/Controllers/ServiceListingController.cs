using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using System.IO;
using BurialPlots.Models;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class ServiceListingController : Controller
    {
        // GET: Admin/ServiceListing
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadServiceListing()
        {
            var list = new ServiceListingRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/ServiceListing/_LoadServiceListing.cshtml", list);
        }
        [HttpPost]
        public PartialViewResult LoadNewServiceListing(string businessId, string partnerId)
        {
            var list = new ServiceListingRepository().GetAll();
            if (!string.IsNullOrEmpty(businessId))
            {
                var bId = Convert.ToDecimal(businessId);
                list = list.Where(c => c.FuneralServiceId == bId).ToList();
            }
            if (!string.IsNullOrEmpty(partnerId))
            {
                var pid = Convert.ToDecimal(partnerId);
                list = list.Where(c => c.PartnerId == pid).ToList();
            }
            return PartialView("~/Areas/Admin/Views/ServiceListing/_LoadNewServiceListing.cshtml", list);
        }
        [HttpPost]
        public string ApprovedServiceListing(Decimal id)
        {
            
            var DbService = new ServiceListingRepository().GetById(id);
            try
            {
                     if(DbService.IsApproved==true)
                {
                    DbService.IsApproved = false;
                }
                else
                {
                    DbService.IsApproved = true;
                }
                  
               new ServiceListingRepository().Update(DbService);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            };
        }
        [HttpPost]
        public string DisApprovedServiceListing(Decimal id)
        {

            var DbService = new ServiceListingRepository().GetById(id);
            try
            {
                if (DbService.IsApproved == false)
                {
                    DbService.IsApproved = true;
                }
                else
                {
                    DbService.IsApproved = false;
                }

                new ServiceListingRepository().Update(DbService);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            };
        }

        [HttpPost]
        public string DeleteServiceListing(string id)
        {
            try
            {
                new ServiceListingRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
        }

        public ActionResult ShowDetails(string id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var obj = new ServiceListingRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }
        public ActionResult Mylisting(string partnerId)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            string pId = "";
            if (!string.IsNullOrEmpty(partnerId))
            {
                pId = partnerId;
            }
            ViewBag.PartnerId = pId;
            return View();
        }
        // Active/ Disable Services Partners
        [HttpPost]
        public string Suspend(string id)
        {
            string resss = "";
            var Id = Convert.ToDecimal(id);
            var check = new PartnerRepository().FirstOrDefault(x => x.Id == Id);
            if (check.Active == false)
            {
                check.Active = true;

                var res = new PartnerRepository().Update(check);
                resss = "True";
            }
            else
            {
                check.Active = false;

                var res = new PartnerRepository().Update(check);
                resss = "false";
            }
            return resss;

        }
        //Delete Services Partners
        [HttpPost]
        public string DeletePartner(string id)
        {

            var a = new PartnerRepository().DeleteRecord(Convert.ToDecimal(id));
            if (a)
            {
                return "True";
            }
            else
            {
                return "false";

            }

        }
        public ActionResult EditServiceList(int Id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var serviceId = new ServiceListingRepository().GetById(Convert.ToDecimal(Id));

            if (serviceId != null)
            {
                return View(serviceId);
            }
            else
            {
                return RedirectToAction("Mylisting");
            }
        }
        [HttpPost]
        public string EditServiceListing(SeviceListing serviceListing)
        {
            var serviceInDb = new ServiceListingRepository().GetById(serviceListing.Id);
            if (ModelState.IsValid)
            {
                serviceInDb.BusinessName = serviceListing.BusinessName;
                serviceInDb.BusinessClassification = serviceListing.BusinessClassification;
                serviceInDb.Address = serviceListing.Address;
                serviceInDb.PostCode = serviceListing.PostCode;
                serviceInDb.Website = serviceListing.Website;
                serviceInDb.PhoneNo = serviceListing.PhoneNo;
                serviceInDb.Picture = serviceListing.Picture;
                serviceInDb.ServicesAndProducts = serviceListing.ServicesAndProducts;
                serviceInDb.BusinessDescription = serviceListing.BusinessDescription;
            }

            var res = new ServiceListingRepository().Update(serviceInDb);
            if (res)
            {
                return "true";
            }
            else
            {
                return "false";
            }

        }
        public ActionResult DetailServiceListing(int Id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }

            var services = new ServiceListingRepository().FirstOrDefault(m => m.Id == Id);
            return View(services);
        }
        public ActionResult Upload()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            string path = string.Empty;
            List<string> filePath = new List<string>();
            if (Request.Files != null)
                try
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        var file = Request.Files[i];

                        var fileName = Path.GetFileName(file.FileName);
                        var name = fileName.Split('.')[0];
                        var extension = fileName.Split('.')[1];
                        Random rand = new Random();
                        var r = rand.Next(1, 99999);


                        name = name + r;
                        fileName = name + "." + extension;
                        path = Path.Combine(Server.MapPath("/images/Users/"), fileName);
                        filePath.Add(fileName);
                        file.SaveAs(path);

                    }
                }
                catch (Exception)
                {

                }
            else
            {
                return Json("false");
            }
            return Json(filePath);

        }
        [HttpPost]
        public string patneradd(string FirstName, string LastName, string Email, string Password, string cell)
        {
            var encEmail = new DataEncryptor().Encrypt(Email);
            var c = new Partner();
            c.Fname = FirstName;
            c.Lname = LastName;
            c.Email = encEmail;
            c.Password = Password;

            c.CellNo = new DataEncryptor().Encrypt(cell); ;
            c.Active = true;
            var chk = new PartnerRepository().FirstOrDefault(x => x.Email == encEmail);
            if (chk == null)
            {
                var d = new PartnerRepository().Add(c);
                if (d)
                {
                    return "True";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                return "exist";
            }
        }

        [HttpPost]
        public PartialViewResult LoadServicePartners()
        {
            var list = new PartnerRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/ServiceListing/_LoadServicePartners.cshtml", list);
        }

    }
}