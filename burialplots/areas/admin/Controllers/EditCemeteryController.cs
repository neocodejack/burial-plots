using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class EditCemeteryController : Controller
    {
        // GET: Admin/EditCemetery
        public ActionResult Index(string id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.Origins = new OriginRepository().GetAll();
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }

        [HttpPost]
        public string LoadCemeteryDetails(string id)
        {
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            var tempObj = new tempCemetery();
            tempObj.Code = obj.Code;
            tempObj.Id = obj.Id + "";
            tempObj.Name = obj.Name;
            tempObj.OriginalCode = obj.OriginalCode;
            tempObj.ImagesList = new List<CemeteryImagesModel>();
            foreach (var item in obj.CemeteryImages)
            {
                var img = new CemeteryImagesModel();
                img.Id = item.Id + "";
                img.fileName = item.Image;
                img.originalName = item.OriginalImage;
                tempObj.ImagesList.Add(img);
            }
            var aa = new JavaScriptSerializer();
            return aa.Serialize(tempObj);
        }
        [ValidateInput(false)]
        [HttpPost]
        public string EditCemeteryReturn(string id, string name, string code, string originalCode, string regionId,string IsFeatured,
            string description, string keyInfo, string whyChoose, string CemeteryImages, string locationDescription, string searchLocation)
        {
            var CemeteryImagesList = new JavaScriptSerializer().Deserialize<List<CemeteryImagesModel>>(CemeteryImages);
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            obj.Code = code;
            obj.Name = name;
            obj.RegionId = Convert.ToDecimal(regionId);
            obj.OriginalCode = originalCode;
            obj.IsFeatured = Convert.ToBoolean(IsFeatured);
            obj.Description = description;
            obj.KeyInformation = keyInfo;
            obj.WhyChoose = whyChoose;
            obj.LocationDescription = locationDescription;
            obj.MapLocation = searchLocation;
            var f = new CemeteryRepository().Update(obj);
            if (f)
            {
                foreach (var item in obj.CemeteryImages)
                {
                    new CemeteryImagesRepository().DeleteRecord(item.Id);
                }
                foreach (var item in CemeteryImagesList)
                {
                    var img = new CemeteryImage();
                    img.CemeteryId = obj.Id;
                    img.Image = item.fileName;
                    img.OriginalImage = item.originalName;
                    new CemeteryImagesRepository().Add(img);
                }
                return "true";
            }
            else
            {
                return "false";
            }
        }

        public ActionResult EditSection(string id, string spot)
        {
            string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
            ViewBag.RequestUrl = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.Religions = new RelgionRepostiory().GetAll();
            ViewBag.Spot = spot;
            var obj = new MainSectionRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }

        [HttpPost]
        public string LoadSectionDetails(string id)
        {
            var obj = new MainSectionRepository().GetById(Convert.ToDecimal(id));
            var tempObj = new tempCemetery();
            tempObj.Code = obj.Code;
            tempObj.Id = obj.Id + "";
            tempObj.Name = obj.Name;
            tempObj.OriginalCode = obj.OriginalCode;
            var aa = new JavaScriptSerializer();
            return aa.Serialize(tempObj);
        }

        [HttpPost]
        public string EditSectionReturn(string id, string name, string code
            )
        {
            var obj = new MainSectionRepository().GetById(Convert.ToDecimal(id));
            if (obj != null)
            {
                obj.Code = code;
                obj.Name = name;
                obj.OriginalCode = code;
                //obj.ReligionId = Convert.ToDecimal(religionId);
                //obj.SectId = Convert.ToDecimal(sectId);
                var f = new MainSectionRepository().Update(obj);
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
                return "false";
            }
        }

        public ActionResult EditMappingSection(string id)
        {
            string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
            ViewBag.RequestUrl = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            
            var obj = new GravesRepository().GetById(Convert.ToDecimal(id));
            ViewBag.GraveId = id;
            if (obj.Relgion != null)
            {
                if (!string.IsNullOrEmpty(obj.Relgion.Picture))
                {
                    ViewBag.ReligionPin = obj.Relgion.Picture;
                }
                else
                {
                    ViewBag.ReligionPin = "";
                }
            }
            else
            {
                ViewBag.ReligionPin = "";
            }
            return View(obj.MainSection);
        }

        [HttpPost]
        public string EditMappingSectionReturn(string id, string name, string code, string newSpotId, string graveId)
        {
            var obj = new MainSectionRepository().GetById(Convert.ToDecimal(id));
            if (obj != null)
            {
                obj.Code = code;
                obj.Name = name;
                obj.OriginalCode = code;
                //obj.ReligionId = Convert.ToDecimal(religionId);
                //obj.SectId = Convert.ToDecimal(sectId);
                var f = new MainSectionRepository().Update(obj);
                if (f)
                {
                    var grave = new GravesRepository().GetById(Convert.ToDecimal(graveId));
                    grave.SpotId = newSpotId;
                    grave.IsEnabled = true;
                    new GravesRepository().Update(grave);
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                return "false";
            }
        }
    }
}