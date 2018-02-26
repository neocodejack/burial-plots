using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using BurialPlots.Models;
using System.Web.Script.Serialization;
using System.IO;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class SettingsController : Controller
    {
        // GET: Admin/Settings
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        // Approve Listing Services
        public ActionResult ApproveListServices()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var serviceStatus = new ServiceListingApprovalRepository().GetById(1);
            return View(serviceStatus);
        }
        [HttpPost]
        public string ToApproveListServices(string Status)
        {

            var DblistingApproval = new ServiceListingApprovalRepository().FirstOrDefault();
            if (DblistingApproval != null)
            {
                DblistingApproval.Status = Convert.ToBoolean(Status);
                var res = new ServiceListingApprovalRepository().Update(DblistingApproval);

                if (res)
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
                var obj = new ServicesListingApproval();
                obj.Status = Convert.ToBoolean(Status);
                var f = new ServiceListingApprovalRepository().Add(obj);
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
        public ActionResult Towns()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.Counties = new CountyRepository().GetAll();
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadTowns()
        {
            var list = new TownsRepositoy().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadTowns.cshtml", list);
        }

        [HttpPost]
        public string SaveTown(string id, string name, string description, Decimal county)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Town();
                obj.Description = description;
                obj.Name = name;
                obj.CountyId = county;
                var f = new TownsRepositoy().Add(obj);
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
                var obj = new TownsRepositoy().GetById(Convert.ToDecimal(id));
                obj.Description = description;
                obj.Name = name;
                obj.CountyId = county;
                var f = new TownsRepositoy().Update(obj);
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
        public string DeleteTown(string id)
        {
            try
            {
                new TownsRepositoy().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult PostCodes()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadPostCodes()
        {
            var list = new PostCodeRepository().GetAll().ToList();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadPostCodes.cshtml", list);
        }

        [HttpPost]
        public string SavePostCode(string id, string code, string description)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new PostCode();
                obj.Description = description;
                obj.Code = code;
                var f = new PostCodeRepository().Add(obj);
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
                var obj = new PostCodeRepository().GetById(Convert.ToDecimal(id));
                obj.Description = description;
                obj.Code = code;
                var f = new PostCodeRepository().Update(obj);
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
        public string DeletePostCode(string id)
        {
            try
            {
                new PostCodeRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult Countries()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadCountries()
        {
            var list = new CountryRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadCountries.cshtml", list);
        }

        [HttpPost]
        public string SaveCountry(string id, string name, string description)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Country();
                obj.Description = description;
                obj.Name = name;
                var f = new CountryRepository().Add(obj);
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
                var obj = new CountryRepository().GetById(Convert.ToDecimal(id));
                obj.Description = description;
                obj.Name = name;
                var f = new CountryRepository().Update(obj);
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
        public string DeleteCountry(string id)
        {
            try
            {
                new CountryRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult Counties()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadCounties()
        {
            var list = new CountyRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadCounties.cshtml", list);
        }

        [HttpPost]
        public string SaveCounty(string id, string name, string description, Decimal CountryId)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new County();
                obj.Description = description;
                obj.Name = name;
                obj.CountryId = CountryId;
                var f = new CountyRepository().Add(obj);
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
                var obj = new CountyRepository().GetById(Convert.ToDecimal(id));
                obj.Description = description;
                obj.Name = name;
                obj.CountryId = CountryId;
                var f = new CountyRepository().Update(obj);
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
        public string DeleteCounty(string id)
        {
            try
            {
                new CountyRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult Regions()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadOrigins()
        {
            var list = new OriginRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadOrigins.cshtml", list);
        }

        [HttpPost]
        public string SaveOrigin(string id, string name, string description)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Origin();
                obj.Description = description;
                obj.Name = name;
                var f = new OriginRepository().Add(obj);
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
                var obj = new OriginRepository().GetById(Convert.ToDecimal(id));
                obj.Description = description;
                obj.Name = name;
                var f = new OriginRepository().Update(obj);
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
        public string DeleteOrigin(string id)
        {
            try
            {
                new OriginRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }
        [HttpGet]
        public ActionResult plan()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        [HttpPost]
        public string SavePlan(string id, string Title, string Price, string Description, string position, string planPeriod, string freePeriod)
        {
            var plan = new PartnerPlan();
            if (string.IsNullOrEmpty(id))
            {
                var pos = 0;
                if (!string.IsNullOrEmpty(position))
                {
                    pos = Convert.ToInt32(position);
                }
                var chk = new PartnerPlanRepository().FirstOrDefault(c => c.Position == pos);
                if (chk == null)
                {
                    plan.Title = Title;
                    plan.Price = Convert.ToDouble(Price);
                    plan.Description = Description;
                    plan.FreeListingPeriod = Convert.ToInt32(freePeriod);
                    plan.PlanPeriods = Convert.ToInt32(planPeriod);
                    if (!string.IsNullOrEmpty(position))
                    {
                        plan.Position = Convert.ToInt32(position);
                    }
                    else
                    {
                        plan.Position = null;
                    }
                    try
                    {
                        var res = new PartnerPlanRepository().Add(plan);

                        return "true";

                    }
                    catch (Exception e)
                    {
                        return "false";
                    }
                }
                else
                {
                    return "exists";
                }
            }
            else
            {
                var pos = 0;
                if (!string.IsNullOrEmpty(position))
                {
                    pos = Convert.ToInt32(position);
                }
                var dbObj = new PartnerPlanRepository().GetById(Convert.ToDecimal(id));
                var chk = new PartnerPlanRepository().FirstOrDefault(c => c.Position == pos && c.Id != dbObj.Id);
                if (chk == null)
                {
                    try
                    {
                        dbObj.Title = Title;
                        dbObj.Price = Convert.ToDouble(Price);
                        dbObj.Description = Description;
                        dbObj.FreeListingPeriod = Convert.ToInt32(freePeriod);
                        dbObj.PlanPeriods = Convert.ToInt32(planPeriod);
                        if (!string.IsNullOrEmpty(position))
                        {
                            dbObj.Position = Convert.ToInt32(position);
                        }
                        else
                        {
                            dbObj.Position = null;
                        }
                        var res = new PartnerPlanRepository().Update(dbObj);
                        return "true";
                    }
                    catch (Exception e)
                    {
                        return "false";
                    }
                }
                else
                {
                    return "exists";
                }
            }
        }
        public PartialViewResult LoadPlanList()
        {
            var list = new PartnerPlanRepository().GetAll().OrderBy(c => c.Position);
            return PartialView("~/Areas/Admin/Views/Settings/LoadPlanList.cshtml", list);
        }

        [HttpPost]
        public string DeletePlan(string id)
        {
            try
            {
                new PartnerPlanRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
        }

        [HttpPost]
        public string EditPlan(string id)
        {
            var plan = new PartnerPlanRepository().GetById(Convert.ToDecimal(id));
            var obj = new PlanModel();
            obj.Id = plan.Id + "";
            if (plan.Position != null)
            {
                obj.Position = plan.Position + "";
            }
            else
            {
                obj.Position = "";
            }
            obj.Price = plan.Price + "";
            obj.Title = plan.Title;
            obj.Description = plan.Description;
            obj.PlanPeriod = plan.PlanPeriods + "";
            obj.FreePeriod = plan.FreeListingPeriod + "";
            var aa = new JavaScriptSerializer();
            return aa.Serialize(obj);
        }
        public ActionResult Slider()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });

        }
        [HttpGet]
        public ActionResult AddSlider(string id)
        {
            //string id=Request.QueryString["id"];
            if (!string.IsNullOrEmpty(id))
            {
                var Slider = new AddSliderRepository().GetById(Convert.ToDecimal(id));
                ViewBag.SliderName = Slider.Name;
                ViewBag.SliderId = Slider.Id;
                ViewBag.IsSlideImage = Slider.SlideImages;
                return View();
            }
            else
            {
                return View();
            }

        }
        //[HttpPost]
        //public string AddSlider(SliderViewModel Model, string id, string SliderId, bool slideImages)
        //{
        //    try
        //    {

        //        if (string.IsNullOrEmpty(id))
        //        {
        //            if (string.IsNullOrEmpty(SliderId))
        //            {
        //                Slider slider = new Slider();
        //                slider.Name = Model.SliderName;
        //                slider.SlideImages = slideImages;
        //                new AddSliderRepository().Add(slider);

        //                Slide slide = new Slide();
        //                slide.Name = Model.Name;
        //                slide.Caption = Model.Caption;
        //                slide.Image = Model.Image;
        //                slide.SliderId = slider.Id;
        //                new AddSlidesRepository().Add(slide);
        //                return "true";
        //            }
        //            else
        //            {
        //                Decimal sliderId = Convert.ToDecimal(SliderId);
        //                var slider = new AddSliderRepository().GetById(sliderId);
        //                slider.Name = Model.SliderName;
        //                slider.SlideImages = slideImages;
        //                new AddSliderRepository().Update(slider);
        //                Slide slide = new Slide();
        //                slide.Name = Model.Name;
        //                slide.Image = Model.Image;
        //                slide.Caption = Model.Caption;
        //                slide.SliderId = sliderId;
        //                new AddSlidesRepository().Add(slide);
        //                return "true";
        //            }

        //        }
        //        else
        //        {
        //            Decimal Slideid = Convert.ToDecimal(id);
        //            var slide = new AddSlidesRepository().GetById(Slideid);
        //            slide.Name = Model.Name;
        //            slide.Caption = Model.Caption;
        //            slide.Image = Model.Image;
        //            new AddSlidesRepository().Update(slide);
        //            return "true";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return "false";
        //    }
        //}
        public PartialViewResult LoadSlidesList(string sliderId)
        {
            List<Slide> list = new List<Slide>();
            if (!string.IsNullOrEmpty(sliderId))
            {
                Decimal id = Convert.ToDecimal(sliderId);
                list = new AddSlidesRepository().GetAll(x => x.SliderId == id);
            }
            else
            {
                list = new AddSlidesRepository().GetAll();
            }
            return PartialView("~/Areas/Admin/Views/Slider/_LoadSlides.cshtml", list);
        }

        [HttpPost]
        public string DeleteSlider(string id)
        {
            try
            {
                Decimal SliderId = Convert.ToDecimal(id);
                var list = new AddSlidesRepository().GetAll(x => x.SliderId == SliderId);
                if (list != null)
                {
                    foreach (var item in list)
                    {
                        new AddSlidesRepository().DeleteRecord(item.Id);
                    }
                }
                else
                {
                    return "Slider have no slide";
                }

                new AddSliderRepository().Delete(Convert.ToDecimal(SliderId));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        [HttpPost]
        public string DeleteSlide(string id)
        {
            try
            {
                new AddSlidesRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult Emails()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.Counties = new AddAdministrativeEmailRepository().GetAll();
            return View();
        }
        [HttpPost]
        public PartialViewResult LoadEmails()
        {
            var list = new AddAdministrativeEmailRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadEmails.cshtml", list);
        }

        [HttpPost]
        public string SaveEmail(string id, string Email)
        {

            bool f = false;
            var des = Email;
            string[] emails = des.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
            foreach (var item in emails)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    var obj = new AdministrativeEmail();
                    obj.Email = item;
                    f = new AddAdministrativeEmailRepository().Add(obj);
                }
            }

            if (f)
            {
                return "true";
            }
            else
            {
                return "false";
            }


        }
        [HttpGet]
        public ActionResult EditEmail(string id)
        {
            AdministrativeEmail email = new AdministrativeEmail();
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            if (!string.IsNullOrEmpty(id))
            {
                Decimal eId = Convert.ToDecimal(id);
                email = new AddAdministrativeEmailRepository().GetById(eId);
            }
            return View(email);
        }
        [HttpPost]
        public string EditEmail(string id, string email)
        {
            Decimal eId = 0;
            if (!string.IsNullOrEmpty(id))
            {
                eId = Convert.ToDecimal(id);
            }
            var obj = new AddAdministrativeEmailRepository().GetById(eId);
            obj.Email = email;
            var f = new AddAdministrativeEmailRepository().Update(obj);
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
        public string DeleteEmail(string id)
        {
            try
            {
                new AddAdministrativeEmailRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult Religions()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
        }

        [HttpPost]
        public PartialViewResult LoadReligions()
        {
            var list = new RelgionRepostiory().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadReligions.cshtml", list);
        }
        [HttpPost]
        public string LoadDrpReligions()
        {
            var list = new RelgionRepostiory().GetAll();
            var contnt = "<option value=''>--Select Sect--</option>";
            foreach (var item in list)
            {
                contnt += "<option value='" + item.Id + "'>" + item.RelgionName + "</option>";
            }
            return contnt;
        }
        [HttpPost]
        public string SaveReligion(string id, string name, string image)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Relgion();
                obj.RelgionName = name;
                obj.Picture = image;
                var f = new RelgionRepostiory().Add(obj);
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
                var obj = new RelgionRepostiory().GetById(Convert.ToDecimal(id));
                obj.RelgionName = name;
                if (!string.IsNullOrEmpty(image))
                {
                    var path = Server.MapPath("~/Images/Pins/"+obj.Picture);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    obj.Picture = image;
                }
                var f = new RelgionRepostiory().Update(obj);
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
        public string SaveSect(string id, string name, string religion)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new SubRelgion();
                obj.SubRelgionName = name;
                obj.RelgioId = Convert.ToDecimal(religion);
                var f = new SubRelgionRepository().Add(obj);
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
                var obj = new SubRelgionRepository().GetById(Convert.ToDecimal(id));
                obj.SubRelgionName = name;
                obj.RelgioId = Convert.ToDecimal(religion);
                var f = new SubRelgionRepository().Update(obj);
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
        public PartialViewResult LoadSects()
        {
            var list = new SubRelgionRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadSects.cshtml", list);
        }

        [HttpPost]
        public string DeleteReligion(string id)
        {
            var obj = new RelgionRepostiory().GetById(Convert.ToDecimal(id));
            var path = Server.MapPath("~/Images/Pins/" + obj.Picture);
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
            var f = new RelgionRepostiory().DeleteRecord(Convert.ToDecimal(id));
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
        public string DeleteSect(string id)
        {
            var f = new SubRelgionRepository().DeleteRecord(Convert.ToDecimal(id));
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
        public ActionResult UploadReligionImage()
        {
            string path = string.Empty;
            string filePath = "";
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
                        path = Path.Combine(Server.MapPath("/images/Pins/"), fileName);
                        filePath = fileName;
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

        public ActionResult PurchaseBox()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var obj = new PurchaseBoxImageRepository().FirstOrDefault();
                return View(obj);
            }
            else
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
        }

        [HttpPost]
        public ActionResult SavePurchaseBox()
        {
            string path = string.Empty;
            string filePath = "";
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
                        path = Path.Combine(Server.MapPath("/images/CemeteryPlots/"), fileName);
                        filePath = fileName;
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
            if (!string.IsNullOrEmpty(filePath))
            {
                var obj = new PurchaseBoxImageRepository().FirstOrDefault();
                if (obj == null)
                {
                    obj = new PurchaseBoxImage();
                    obj.Image = filePath;
                    var f = new PurchaseBoxImageRepository().Add(obj);
                    if (f)
                    {
                        return Json("true");
                    }
                    else
                    {
                        return Json("false");
                    }
                }
                else
                {
                    var del = Server.MapPath("~/images/CemeteryPlots/"+obj.Image);
                    if (System.IO.File.Exists(del))
                    {
                        System.IO.File.Delete(del);
                    }
                    obj.Image = filePath;
                    var f = new PurchaseBoxImageRepository().Update(obj);
                    if (f)
                    {
                        return Json("true");
                    }
                    else
                    {
                        return Json("false");
                    }
                }
            }
            else
            {
                return Json("false");
            }
        }

        public ActionResult Team()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var obj = new PurchaseBoxImageRepository().FirstOrDefault();
                return View(obj);
            }
            else
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
        }
        [HttpPost]
        public ActionResult UploadTeamImage()
        {
            string path = string.Empty;
            string filePath = "";
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
                        filePath = fileName;
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
        public string SaveTeam(string id, string name, string image, string description, string post)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Team();
                obj.Name = name;
                obj.Image = image;
                obj.Post = post;
                obj.Description = description;
                var f = new TeamsRepository().Add(obj);
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
                var obj = new TeamsRepository().GetById(Convert.ToDecimal(id));
                obj.Name = name;
                obj.Post = post;
                obj.Description = description;
                if (!string.IsNullOrEmpty(image))
                {
                    var path = Server.MapPath("~/Images/Users/" + obj.Image);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    obj.Image = image;
                }
                var f = new TeamsRepository().Update(obj);
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
        public PartialViewResult LoadTeam()
        {
            var list = new TeamsRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Settings/_LoadTeam.cshtml", list);
        }
        [HttpPost]
        public string DeleteTeam(string id)
        {
            var obj = new TeamsRepository().GetById(Convert.ToDecimal(id));
            var f = new TeamsRepository().DeleteRecord(Convert.ToDecimal(id));
            if (f)
            {
                var path = Server.MapPath("~/images/Users/" + obj.Image);
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                return "true";
            }
            else
            {
                return "false";
            }
        }

        [HttpPost]
        public string EditTeam(string id)
        {
            var obj = new TeamsRepository().GetById(Convert.ToDecimal(id));
            var tempObj = new TeamModel();
            tempObj.Id = obj.Id + "";
            tempObj.Description = obj.Description;
            tempObj.Image = obj.Image;
            tempObj.Name = obj.Name;
            tempObj.Post = obj.Post;
            var aa = new JavaScriptSerializer();
            return aa.Serialize(tempObj);
        }
    }
    public class SliderViewModel
    {
        public decimal Id { get; set; }
        public string SliderName { get; set; }
        public string Name { get; set; }
        public string Caption { get; set; }
        public string Image { get; set; }
        public Nullable<decimal> SliderId { get; set; }

        public virtual Slider Slider { get; set; }

    }
}