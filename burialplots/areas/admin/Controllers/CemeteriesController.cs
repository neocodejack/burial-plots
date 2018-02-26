using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using System.Web.Script.Serialization;
using System.IO;
using ImageProcessor.Imaging.Formats;
using ImageProcessor;
using BurialPlots.Utills;
using OfficeOpenXml;
using Newtonsoft.Json.Linq;
using BurialPlots.Models;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class CemeteriesController : Controller
    {
        [HttpPost]
        public string UploadCemeteryImage()
        {
            string res = "";
            string filename = "";
            try
            {

                if (Request.Files.Count > 0)
                {
                    string folder = Server.MapPath("~/Images/CemeteryPlots/");
                    bool folderexist = System.IO.Directory.Exists(folder);
                    if (!folderexist)
                    {
                        System.IO.Directory.CreateDirectory(folder);
                    }
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        Random rr = new Random();
                        string randomNumber = rr.Next(0, 999999999) + "";
                        HttpPostedFileBase file = files[i];
                        if (file != null)
                        {
                            filename = filename + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + ".jpg";
                            var fname = folder + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + ".jpg";
                            file.SaveAs(fname);
                        }
                    }
                }
                res = filename;
            }
            catch (Exception)
            {

            }
            return res;
        }
        // GET: Admin/Plot
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            if (Session["adminUser"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }


        /////////////new/////////////////
        public ActionResult AddCemetery()
        {
            var origins = new OriginRepository().GetAll();
            ViewBag.Origins = origins;
            string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
            ViewBag.RequestUrl = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public string CheckSectionMapping(string cemeteryId, string spotId)
        {
            var cemId = Convert.ToDecimal(cemeteryId);
            var obj = new MainSectionRepository().FirstOrDefault(c => c.CemeteryId == cemId && c.SpotId == spotId);
            if (obj != null)
            {
                return "exists";
            }
            else
            {
                return "true";
            }
        }

        [ValidateInput(false)]
        [HttpPost]
        public string SaveCemetery(string name, string code, string image, string originalCode, string regionId, string IsFeatured,
            string description, string keyInfo, string whyChoose, string CemeteryImages, string locationDescription, string searchLocation)
        {
            var CemeteryImagesList = new JavaScriptSerializer().Deserialize<List<CemeteryImagesModel>>(CemeteryImages);
            var obj = new Cemetery();
            obj.Code = code;
            obj.Name = name;
            obj.Image = image;
            obj.OriginalCode = originalCode;
            obj.AddedDate = DateTime.Now;
            obj.IsFeatured = Convert.ToBoolean(IsFeatured);
            obj.RegionId = Convert.ToDecimal(regionId);
            obj.Description = description;
            obj.KeyInformation = keyInfo;
            obj.WhyChoose = whyChoose;
            obj.LocationDescription = locationDescription;
            obj.MapLocation = searchLocation;
            var f = new CemeteryRepository().Add(obj);
            if (f)
            {
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

        public ActionResult ViewCemeteries()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }


        [HttpPost]
        public string DeleteCemetery(string id)
        {
            try
            {
                var ID = Convert.ToDecimal(id);
                var cemeterImages = new CemeteryImagesRepository().GetAll(c => c.CemeteryId == ID);
                foreach (var item in cemeterImages)
                {
                    var path = Server.MapPath("~/Images/CemeteryPlots/CemeteryImages/" + item.Image);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    var path2 = Server.MapPath("~/Images/CemeteryPlots/CemeteryImages/" + item.OriginalImage);
                    if (System.IO.File.Exists(path2))
                    {
                        System.IO.File.Delete(path2);
                    }
                }
                var obj = new CemeteryRepository().GetById(ID);
                var path3 = Server.MapPath("~/Images/CemeteryPlots/" + obj.Image);
                if (System.IO.File.Exists(path3))
                {
                    System.IO.File.Delete(path3);
                }
                foreach (var item in obj.MainSections)
                {
                    var path4 = Server.MapPath("~/Images/CemeteryPlots/" + item.Image);
                    if (System.IO.File.Exists(path4))
                    {
                        System.IO.File.Delete(path4);
                    }
                }
                var f = new CemeteryRepository().DeleteRecord(Convert.ToDecimal(id));
                if (f)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult DrawSection()
        {
            var list = new CemeteryRepository().GetAll();
            return View(list);
        }

        public ActionResult ShowCemeterySection(string id)
        {
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }
        [HttpPost]
        public string LoadCemetery(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return "false";
            }
            else
            {
                var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
                var temp = new tempCemetery();
                temp.Code = obj.Code;
                temp.Id = obj.Id + "";
                temp.Name = obj.Name;
                temp.OriginalCode = obj.OriginalCode;
                var aa = new JavaScriptSerializer();
                return aa.Serialize(temp);
            }

        }

        public ActionResult AddSection(string cemeteryId, string spotId)
        {
            string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
            ViewBag.RequestUrl = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            var religions = new RelgionRepostiory().GetAll();
            ViewBag.Religions = religions;
            ViewBag.cemeteryId = cemeteryId;
            var cemetery = new CemeteryRepository().GetById(Convert.ToDecimal(cemeteryId));
            if (cemetery != null)
            {
                ViewBag.CemeteryName = cemetery.Name;
            }
            ViewBag.spotId = spotId;
            return View();
        }

        [HttpPost]
        public string SaveSection(string name, string code, string spotId, string cemeteryId,
            string image, string cemeteryCode
            )
        {
            var obj = new MainSection();
            obj.Code = code;
            obj.Name = name;
            obj.CemeteryId = Convert.ToDecimal(cemeteryId);
            obj.Image = image;
            obj.SpotId = spotId;
            //obj.ReligionId = Convert.ToDecimal(religionId);
            //if (!string.IsNullOrEmpty(sectId))
            //{
            //    obj.SectId = Convert.ToDecimal(sectId);
            //}

            var f = new MainSectionRepository().Add(obj);
            if (f)
            {
                var cemetery = new CemeteryRepository().GetById(Convert.ToDecimal(cemeteryId));
                cemetery.Code = cemeteryCode;
                new CemeteryRepository().Update(cemetery);
                return "true";
            }
            else
            {
                return "false";
            }
        }


        public ActionResult ViewSection()
        {
            var cemeteries = new CemeteryRepository().GetAll();
            ViewBag.Cemeteries = cemeteries;
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadSectionsPartial(string cemeteryId)
        {
            var list = new MainSectionRepository().GetAll();
            if (string.IsNullOrEmpty(cemeteryId))
            {
                return PartialView("~/Areas/Admin/Views/Cemeteries/_LoadSectionsPartial.cshtml", list);
            }
            else
            {
                var cemId = Convert.ToDecimal(cemeteryId);
                list = list.Where(c => c.CemeteryId == cemId).ToList();
                return PartialView("~/Areas/Admin/Views/Cemeteries/_LoadSectionsPartial.cshtml", list);
            }
        }

        [HttpPost]
        public string DeleteSection(string id)
        {
            try
            {
                var obj = new MainSectionRepository().GetById(Convert.ToDecimal(id));
                var path4 = Server.MapPath("~/Images/CemeteryPlots/" + obj.Image);
                if (System.IO.File.Exists(path4))
                {
                    System.IO.File.Delete(path4);
                }
                var f = new MainSectionRepository().DeleteRecord(Convert.ToDecimal(id));
                if (f)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception ex)
            {
                return "false";
            }
        }
        public JsonResult LoadSubRelgion(string id)
        {
            var res = "";
            var drpsection = "";
            try
            {

                var sectionlist = new SubRelgionRepository().GetAll().Where(x => x.RelgioId == Convert.ToDecimal(id));
                if (sectionlist.Any())
                {
                    drpsection += "<option value=''>All Sub Religion</option>";
                    foreach (var item in sectionlist)
                    {
                        if (item != null)
                        {
                            drpsection += "<option value='" + item.Id + "'>" + item.SubRelgionName + "</option>";
                        }
                    }

                }
                else
                {
                    drpsection += "<option value=''></option>";
                }
                res = "true";
            }
            catch (Exception)
            {
                res = "false";
            }
            return Json(new { res = res, drpDoctor = drpsection });
        }

        [HttpPost]
        public string GetSection(string spotId, string cemeteryId)
        {
            if (string.IsNullOrEmpty(spotId))
            {
                return "";
            }
            else
            {
                var cemId = Convert.ToDecimal(cemeteryId);
                var obj = new MainSectionRepository().FirstOrDefault(c => c.CemeteryId == cemId && c.SpotId == spotId);
                var temp = new tempCemetery();
                temp.Code = obj.Code;
                temp.Id = obj.Id + "";
                temp.Name = obj.Name;
                var aa = new JavaScriptSerializer();
                return aa.Serialize(temp);
            }

        }

        [HttpPost]
        public PartialViewResult LoadGraveDetails(string spotId, string sectionId)
        {
            var sectId = Convert.ToDecimal(sectionId);
            var tiers = new TierRepository().GetAll();
            ViewBag.Tiers = tiers;
            var religions = new RelgionRepostiory().GetAll();
            ViewBag.Religions = religions;
            var obj = new GravesRepository().FirstOrDefault(c => c.SectionId == sectId && c.SpotId == spotId);
            return PartialView("~/Areas/Admin/Views/Cemeteries/_LoadGraveDetails.cshtml", obj);
        }

        [HttpPost]
        public string SaveGraveDetails(string id, string sku, string plotName, string plotNo, string plotType,
            string size, string location, string sDesc, string longDesc, string internment, string internmentFee,
            string lease, string maintenance, string address, string sectionId, string spotId, string tierId,
            string layers, string religionId, string sectId, string code, string isEnable, string Image
            )
        {
            var layerList = new JavaScriptSerializer().Deserialize<List<tempCemeteryLayer>>(layers);
            if (string.IsNullOrEmpty(id))
            {
                var obj = new Grave();
                obj.Address = address;
                obj.FullDescription = longDesc;
                obj.Internement = internment;
                obj.InternementFee = Convert.ToDecimal(internmentFee);
                obj.Lease = lease;
                obj.Location = location;
                obj.Maintenance = maintenance;
                obj.PlotName = plotName;
                obj.PlotNo = plotNo;
                obj.PlotType = plotType;
                obj.SectionId = Convert.ToDecimal(sectionId);
                obj.ShortDescription = sDesc;
                obj.Size = size;
                obj.SKU = sku;
                obj.SpotId = spotId;
                obj.Image = Image;
                obj.IsEnabled = Convert.ToBoolean(isEnable);
                if (!string.IsNullOrEmpty(tierId))
                {
                    obj.TierId = Convert.ToDecimal(tierId);
                }
                else
                {
                    obj.TierId = null;
                }
                if (!string.IsNullOrEmpty(religionId))
                {
                    obj.ReligionId = Convert.ToDecimal(religionId);
                }
                else
                {
                    obj.ReligionId = null;
                }
                if (!string.IsNullOrEmpty(sectId))
                {
                    obj.SectId = Convert.ToDecimal(sectId);
                }
                else
                {
                    obj.SectId = null;
                }
                var f = new GravesRepository().Add(obj);
                if (f)
                {

                    foreach (var item in layerList)
                    {
                        var layerObj = new CemeteryLayer();
                        layerObj.CemeteryId = obj.Id;
                        layerObj.IsBooking = false;
                        layerObj.Name = item.Name;
                        layerObj.Price = Convert.ToDecimal(item.Price);
                        new CemeteryLayerRepository().Add(layerObj);
                    }
                    if (!string.IsNullOrEmpty(code))
                    {
                        var section = new MainSectionRepository().GetById(Convert.ToDecimal(sectionId));
                        section.Code = code;
                        new MainSectionRepository().Update(section);
                    }
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                var obj = new GravesRepository().GetById(Convert.ToDecimal(id));
                var delLayers = new CemeteryLayerRepository().GetAll(c => c.CemeteryId == obj.Id);
                foreach (var item in delLayers)
                {
                    var del = layerList.FirstOrDefault(c => c.Id != null && c.Id == item.Id.ToString());
                    if (del == null)
                    {
                        new CemeteryLayerRepository().DeleteRecord(item.Id);
                    }
                }
                obj.Address = address;
                obj.FullDescription = longDesc;
                obj.Internement = internment;
                obj.InternementFee = Convert.ToDecimal(internmentFee);
                obj.Lease = lease;
                obj.Location = location;
                obj.Maintenance = maintenance;
                obj.PlotName = plotName;
                obj.PlotNo = plotNo;
                obj.PlotType = plotType;
                obj.SectionId = Convert.ToDecimal(sectionId);
                obj.ShortDescription = sDesc;
                obj.Size = size;
                obj.SKU = sku;
                obj.SpotId = spotId;
                if (!string.IsNullOrEmpty(Image))
                {
                    if (!string.IsNullOrEmpty(obj.Image))
                    {
                        var path = Path.Combine(Server.MapPath("/images/CemeteryPlots/"), obj.Image);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                        obj.Image = Image;
                    }
                    else
                    {
                        obj.Image = Image;
                    }
                }
                obj.IsEnabled = Convert.ToBoolean(isEnable);
                if (!string.IsNullOrEmpty(tierId))
                {
                    obj.TierId = Convert.ToDecimal(tierId);
                }
                else
                {
                    obj.TierId = null;
                }
                if (!string.IsNullOrEmpty(religionId))
                {
                    obj.ReligionId = Convert.ToDecimal(religionId);
                }
                else
                {
                    obj.ReligionId = null;
                }
                if (!string.IsNullOrEmpty(sectId))
                {
                    obj.SectId = Convert.ToDecimal(sectId);
                }
                else
                {
                    obj.SectId = null;
                }
                foreach (var item in layerList)
                {
                    if (string.IsNullOrEmpty(item.Id))
                    {
                        var layerObj = new CemeteryLayer();
                        layerObj.CemeteryId = obj.Id;
                        layerObj.IsBooking = false;
                        layerObj.Name = item.Name;
                        layerObj.Price = Convert.ToDecimal(item.Price);
                        new CemeteryLayerRepository().Add(layerObj);
                    }
                    else
                    {
                        var layerObj = new CemeteryLayerRepository().GetById(Convert.ToDecimal(item.Id));
                        layerObj.CemeteryId = obj.Id;
                        layerObj.Name = item.Name;
                        layerObj.Price = Convert.ToDecimal(item.Price);
                        new CemeteryLayerRepository().Update(layerObj);
                    }
                }
                var f = new GravesRepository().Update(obj);
                if (f)
                {
                    if (!string.IsNullOrEmpty(code))
                    {
                        var section = new MainSectionRepository().GetById(Convert.ToDecimal(sectionId));
                        section.Code = code;
                        new MainSectionRepository().Update(section);
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
        public string LoadSect(string religionId)
        {
            if (!string.IsNullOrEmpty(religionId))
            {
                var relgId = Convert.ToDecimal(religionId);
                var list = new SubRelgionRepository().GetAll(c => c.RelgioId == relgId);
                var opt = "<option value=''>--Select Sect--</option>";
                foreach (var item in list)
                {
                    opt += "<option value='" + item.Id + "'>" + item.SubRelgionName + "</option>";
                }
                return opt;
            }
            else
            {
                return "";
            }
        }

        [HttpPost]
        public PartialViewResult LoadCemeteriesPartial()
        {
            var list = new CemeteryRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Cemeteries/_LoadCemeteriesPartial.cshtml", list);
        }

        [HttpGet]
        public JObject LoadGravesPartial(string cemeteryId)
        {
            //var list = new GravesRepository().GetAll(c=>c.SpotId != null || c.SpotId != "");
            //if (!string.IsNullOrEmpty(cemeteryId))
            //{
            //    var cemId = Convert.ToDecimal(cemeteryId);
            //    list = list.Where(c => c.MainSection.CemeteryId == cemId).ToList();
            //}
            //return PartialView("~/Areas/Admin/Views/Cemeteries/_LoadGravesPartial.cshtml", list);
            try
            {
                var tempList = new List<GraveModel>();
                var draw = Request["draw"] + "";
                var search = Request["search[value]"] + "";
                var list = new GravesRepository().GetAll(c => c.SpotId != null || c.SpotId != "");
                if (!string.IsNullOrEmpty(cemeteryId))
                {
                    var cemId = Convert.ToDecimal(cemeteryId);
                    list = list.Where(c => c.MainSection.CemeteryId == cemId).ToList();
                }
                if (!string.IsNullOrEmpty(search))
                {
                    list = list.Where(x => x.Address.ToLower().Contains(search.ToLower())
                    || x.FullDescription.ToString().Contains(search) || x.Location.ToString().Contains(search)
                    || x.PlotName.ToString().Contains(search) || x.MainSection.Name.ToString().Contains(search)).ToList();
                }

                var totalCount = list.Count();
                foreach (var item in list)
                {
                    var tempObj = new GraveModel();
                    tempObj.CheckBoxes = "<input type='checkbox' id='chkDel_"+item.Id+"' class='chkDel' value='"+item.Id+"' onclick='checkOneClick()' />";
                    tempObj.PlotNo = item.PlotNo;
                    tempObj.PlotName = item.PlotName;
                    tempObj.SectionName = item.MainSection.Name;
                    tempObj.Size = item.Size;
                    tempObj.Address = item.Address;
                    tempObj.Location = item.Location;
                    tempObj.Internements = item.CemeteryLayers.Count() + "";
                    tempObj.Tiers = item.Tier.Name;
                    tempObj.Status = "";
                    if (!string.IsNullOrEmpty(item.SpotId))
                    {
                        if (item.IsEnabled == true)
                        {
                            tempObj.Status = "<a href='javascript:void(0)' title='Click here for make draft this plot' onclick='enableDisable(\""+item.Id+"\")' >Make Draft</a>";
                        }
                        else
                        {
                            tempObj.Status = "<a href='javascript:void(0)' title='Click here for publish this plot' onclick='enableDisable(\"" + item.Id + "\")' >Publish</a>";
                        }
                    }
                    tempObj.Action = "";
                    if (string.IsNullOrEmpty(item.SpotId))
                    {
                        tempObj.Action += "<a href='"+Url.Action("EditMappingSection", "EditCemetery", new { id = item.Id }) +"'>Map</a>";
                    }
                    else
                    {
                        tempObj.Action += "<a title='Edit Mapping' href='" + Url.Action("EditSection", "EditCemetery", new { id = item.SectionId, spot = item.SpotId }) + "'><span class='fa fa-map-marker'></span></a>";
                        tempObj.Action += "<span class='fa fa-edit' style='cursor:pointer' onclick='editGrave(\""+item.SpotId+"\", \""+ item.MainSection.Id + "\")'></span>";
                    }
                    tempObj.Action += "<span class='fa fa-trash-o' style='color:red; cursor:pointer' onclick='deleteGrave(\"" + item.Id + "\")'></span>";
                    tempList.Add(tempObj);
                }
                var result = JObject.FromObject(new
                {
                    draw = draw,
                    recordsFiltered = totalCount,
                    recordsTotal = totalCount,
                    data = tempList
                });
                return result;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [HttpPost]
        public string DeleteGrave(string id)
        {
            var f = new GravesRepository().DeleteRecord(Convert.ToDecimal(id));
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
        public ActionResult CemeteryAlbumUpload()
        {
            string res = "";
            var filename = "";
            var fname = "";
            var fnameLarge = "";
            Random rr = new Random();
            string randomNumber = rr.Next(0, 999999999) + "";
            try
            {
                if (Request.Files.Count > 0)
                {
                    var folder = Server.MapPath("~/Images/CemeteryPlots/CemeteryImages/");
                    var folderexist = System.IO.Directory.Exists(folder);
                    if (!folderexist)
                    {
                        System.IO.Directory.CreateDirectory(folder);
                    }
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFileBase file = files[i];
                        if (file != null)
                        {
                            filename = file.FileName + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + ".jpg";
                            fname = folder + filename;
                            //file.SaveAs(fname);

                            MemoryStream target = new MemoryStream();
                            file.InputStream.CopyTo(target);
                            byte[] tempBytes = target.ToArray();

                            // Read a file and resize it.
                            //byte[] photoBytes = System.IO.File.ReadAllBytes(fname);
                            ISupportedImageFormat format = new JpegFormat { Quality = 80 };
                            //Size size = new Size(150, 0);

                            using (MemoryStream inStream = new MemoryStream(tempBytes))
                            {
                                using (MemoryStream outStream = new MemoryStream())
                                {
                                    using (ImageFactory imageFactory = new ImageFactory())
                                    {
                                        // Load, resize, set the format and quality and save an image.
                                        imageFactory.Load(inStream)
                                                    //.Resize(size)
                                                    .Format(format)//.Quality(70)
                                                    .Save(outStream);
                                        imageFactory.Save(fname);
                                    }

                                    // Do something with the stream.
                                }
                            }
                            fnameLarge = file.FileName + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + "_thumbLarge.jpg";
                            var name = folder + fnameLarge;
                            new ImagesUtil().ImageResizeAndCrop(tempBytes, name, 579, 390);

                        }
                    }
                }
                res = "true";
            }
            catch (Exception)
            {
                res = "false";
            }
            return Json(new { Id = randomNumber, fileName = fnameLarge, originalName = filename });
        }

        [HttpPost]
        public string DeleteCemeteryImage(string removeName, string id)
        {
            var obj = new CemeteryImagesRepository().GetById(Convert.ToDecimal(id));
            if (obj != null)
            {
                new CemeteryImagesRepository().DeleteRecord(obj.Id);
            }
            var path = Server.MapPath("~/Images/CemeteryPlots/CemeteryImages/" + removeName);
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
            var arr = removeName.Split('_');
            var path2 = Server.MapPath("~/Images/CemeteryPlots/CemeteryImages/" + arr[0] + ".jpg");
            if (System.IO.File.Exists(path2))
            {
                System.IO.File.Delete(path2);
            }
            return "true";
        }
        public ActionResult ExportExcel_Report()
        {

            try
            {

                var Orderslist = new CemeteryRepository().GetAll();

                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Demo");
                    
                    ws.Cells[1, 1].Value = "Name ";
                    ws.Cells[1, 2].Value = "Image";
                    ws.Cells[1, 3].Value = "Origin Name";
         
                    ws.Cells[1, 4].Value = "Origin Cemetries";

                    ws.Cells[1, 5].Value = "Added Date";

                    int row = 2;
                    foreach (var order in Orderslist)
                    {

                        ws.Cells[row, 1].Value = order.Name;
                        ws.Cells[row, 2].Value = order.Image;
                        ws.Cells[row, 3].Value = order.Origin.Name;
                   
                        ws.Cells[row, 4].Value = order.Origin.Cemeteries;
                        ws.Cells[row, 5].Value = order.AddedDate;
                        row++;
                    }

                    //Write it back to the client
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=ExcelCemetery.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }


                //AffiliateOrdersDataSet ds = new AffiliateOrdersDataSet();
                //foreach (var order in Orderslist)
                //{


                //    ds.OrderDetial_DataTable.AddOrderDetial_DataTableRow(Convert.ToDateTime(order.OrderDate).ToShortDateString(), Convert.ToInt32(order.AgentId),
                //                                                         order.AgentName, order.Customer, Convert.ToInt32(order.RGUs), order.ProductSold, order.CallScenario,
                //                                                         order.Product, order.Status, order.Commission);
                //}
                //GenerateExcel(ds.OrderDetial_DataTable);
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message;
            }
            return View("ExportExcel_Report");





        }

        [HttpPost]
        public ActionResult GetSectionCode(string section, string religion)
        {
            var sectionCode = new MainSectionRepository().GetById(Convert.ToDecimal(section));
            var religionObj = new RelgionRepostiory().GetById(Convert.ToDecimal(religion));
            var pic = "";
            if (!string.IsNullOrEmpty(religionObj.Picture))
            {
                pic = religionObj.Picture;
            }
            return Json(new { code=sectionCode.Code, pic = pic });
        }

        [HttpPost]
        public string GetCemeteryCode(string id)
        {
            var cemetery = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            if (cemetery != null)
            {
                return cemetery.Code;
            }
            else
            {
                return "";
            }
        }
    }

    public class tempMainSection
    {
        public string CatName { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public List<tempSectionCoordinate> list { get; set; }
    }
    public class tempSectionCoordinate
    {
        public double lat { get; set; }
        public double lng { get; set; }
    }
    public class CemeteryImagesModel
    {
        public string Id { get; set; }
        public string fileName { get; set; }
        public string originalName { get; set; }
    }
}