using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class SliderController : Controller
    {
        // GET: Admin/Slider
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var obj = new AddSliderRepository().FirstOrDefault();
            return View(obj);
        }
        [HttpPost]
        public PartialViewResult LoadSliderList()
        {
            var list = new AddSlidesRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Slider/_LoadSliderList.cshtml", list);
        }
        public ActionResult UploadImage()
        {
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
                        var existPath = Server.MapPath("/images/Slider/");
                        if (!System.IO.Directory.Exists(existPath))
                        {
                            System.IO.Directory.CreateDirectory(existPath);
                        }
                        path = Path.Combine(Server.MapPath("/images/Slider/"), fileName);
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
        public string SaveSlider(string name, string image)
        {
            var obj = new AddSliderRepository().FirstOrDefault();
            if (obj != null)
            {
                obj.Name = name;
                if (!string.IsNullOrEmpty(image))
                {
                    var path = Server.MapPath("~/images/Slider/" + obj.SlideImages);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    obj.SlideImages = image;
                }
                var f = new AddSliderRepository().Update(obj);
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
                var nobj = new Slider();
                nobj.Name = name;
                nobj.SlideImages = image;
                var f = new AddSliderRepository().Add(nobj);
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
        public string SaveCaption(string id, string english, string urdu, string arabic, string hindi, string chinese, string italian,
            string turkish, string bengali, string hebrew)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Slide();
                obj.Caption = english;
                obj.CaptionArabic = arabic;
                obj.CaptionBengali = bengali;
                obj.CaptionChinese = chinese;
                obj.CaptionHebrew = hebrew;
                obj.CaptionHindi = hindi;
                obj.CaptionItalian = italian;
                obj.CaptionTurkish = turkish;
                obj.CaptionUrdu = urdu;
                var f = new AddSlidesRepository().Add(obj);
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
                var obj = new AddSlidesRepository().GetById(Convert.ToDecimal(id));
                obj.Caption = english;
                obj.CaptionArabic = arabic;
                obj.CaptionBengali = bengali;
                obj.CaptionChinese = chinese;
                obj.CaptionHebrew = hebrew;
                obj.CaptionHindi = hindi;
                obj.CaptionItalian = italian;
                obj.CaptionTurkish = turkish;
                obj.CaptionUrdu = urdu;
                var f = new AddSlidesRepository().Update(obj);
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
        public string DeleteCaption(string id)
        {
            var f = new AddSlidesRepository().DeleteRecord(Convert.ToDecimal(id));
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
        public string EditCaption(string id)
        {
            var obj = new AddSlidesRepository().GetById(Convert.ToDecimal(id));
            var temp = new CaptionModel();
            temp.Id = obj.Id + "";
            temp.CaptionArabic = obj.CaptionArabic;
            temp.CaptionBengali = obj.CaptionBengali;
            temp.CaptionChinese = obj.CaptionChinese;
            temp.CaptionEnglish = obj.Caption;
            temp.CaptionHebrew = obj.CaptionHebrew;
            temp.CaptionHindi = obj.CaptionHindi;
            temp.CaptionItalian = obj.CaptionItalian;
            temp.CaptionTurkish = obj.CaptionTurkish;
            temp.CaptionUrdu = obj.CaptionUrdu;
            var aa = new JavaScriptSerializer();
            return aa.Serialize(temp);
        }













        //public ActionResult SaveSlider(FormCollection form)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        bool IsSlideImage = false;
        //        string SliderName = form["SLiderName"]; 
        //        bool slideImages = Convert.ToBoolean(form["slideImages"]);
        //        string SliderId = form["hIdSliderId"]; 
        //        if (slideImages)
        //        {
        //            IsSlideImage = true;
        //        }
        //        if (string.IsNullOrEmpty(SliderId))
        //        {
        //            Slider slider = new Slider();
        //            slider.Name = SliderName;
        //            slider.SlideImages = IsSlideImage;
        //            var res = new AddSliderRepository().Add(slider);
        //        }
        //        else
        //        {
        //            Decimal SId = Convert.ToDecimal(SliderId);
        //            var slider = new AddSliderRepository().GetById(SId);
        //            slider.Name = SliderName;
        //            slider.SlideImages = IsSlideImage;
        //            new AddSliderRepository().Update(slider);

        //        }

        //        return RedirectToAction("Slider", "Settings");
        //    }
        //    return View(form);

        //}
    }
}