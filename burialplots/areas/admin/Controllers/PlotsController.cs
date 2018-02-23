using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using Excel;
using System.Text.RegularExpressions;
using Microsoft.VisualBasic.FileIO;
using ImageProcessor.Imaging.Formats;
using ImageProcessor;
using BurialPlots.Utills;
using System.Web.Script.Serialization;
using OfficeOpenXml;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class PlotsController : Controller
    {
        // GET: Admin/Cemetery

        public string UploadCemeteryImage()
        {
            string res = "";
            string filename = "";
            try
            {

                if (Request.Files.Count > 0)
                {
                    string folder = Server.MapPath("~/Images/Cemetery/");
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
                            //MemoryStream target = new MemoryStream();
                            //file.InputStream.CopyTo(target);
                            //byte[] tempBytes = target.ToArray();

                            //// Read a file and resize it.
                            ////byte[] photoBytes = System.IO.File.ReadAllBytes(fname);
                            //ISupportedImageFormat format = new JpegFormat { Quality = 80 };
                            ////Size size = new Size(150, 0);

                            //using (MemoryStream inStream = new MemoryStream(tempBytes))
                            //{
                            //    using (MemoryStream outStream = new MemoryStream())
                            //    {
                            //        using (ImageFactory imageFactory = new ImageFactory())
                            //        {
                            //            // Load, resize, set the format and quality and save an image.
                            //            imageFactory.Load(inStream)
                            //                        //.Resize(size)
                            //                        .Format(format)//.Quality(70)
                            //                        .Save(outStream);
                            //            imageFactory.Save(fname);
                            //        }
                            //    }
                            //}
                            //var name = folder + "thumbLarge_" + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + ".jpg";
                            //new ImagesUtil().ImageResizeAndCrop(tempBytes, name, 260, 200);
                            //var name2 = folder + "thumbSmall_" + randomNumber + "img" + DateTime.Now.Date.ToString("yy-MM-dd").Replace("-", "") + ".jpg";
                            //new ImagesUtil().ImageResizeAndCrop(tempBytes, name2, 200, 150);
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


        public ActionResult EditPlot(string id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }


        ///////////////////////////////////// Save product Data to database  /////////////////////////////////////////////////

        public JsonResult LoadMainCate(string id)
        {
            var res = "";
            var drpsection = "";
            try
            {

                var sectionlist = new MainSectionRepository().GetAll();
                if (sectionlist.Any())
                {
                    drpsection += "<option value=''>All Cemetery</option>";
                    foreach (var item in sectionlist)
                    {
                        if (item != null)
                        {
                            drpsection += "<option value='" + item.Id + "'>" + item.Name + "</option>";
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

        //[HttpPost]
        //public string DeleteSelectedGraves(string subSectionId, string plotId, string sectionId, string chkAll, string chkIds)
        //{
        //    try
        //    {
        //        if (chkAll == "true")
        //        {
        //            decimal sectId = 0;
        //            decimal subSectId = 0;
        //            decimal ploId = 0;
        //            var db = new BurialPlotsEntities();
        //            if (!string.IsNullOrEmpty(sectionId))
        //            {
        //                sectId = Convert.ToDecimal(sectionId);
        //            }
        //            if (!string.IsNullOrEmpty(subSectionId))
        //            {
        //                subSectId = Convert.ToDecimal(subSectionId);
        //            }
        //            if (!string.IsNullOrEmpty(plotId))
        //            {
        //                ploId = Convert.ToDecimal(plotId);
        //            }
        //            db.Sp_DeleteAllGraves(sectId, ploId, subSectId);
        //            return "true";
        //        }
        //        else
        //        {
        //            var ids = new JavaScriptSerializer().Deserialize<List<string>>(chkIds);
        //            foreach (var item in ids)
        //            {
        //                new CemeteryRepository().DeleteRecord(Convert.ToDecimal(item));
        //            }
        //            return "true";
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        return "false";
        //    }
        //}

        public ActionResult ViewPlots()
        {
            var list = new CemeteryRepository().GetAll();
            string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
            ViewBag.RequestUrl = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            return View(list);
        }
        public ActionResult ExportExcel_Report()
        {

            try
            {

                var Orderslist = new GravesRepository().GetAll();

                using (ExcelPackage pck = new ExcelPackage())
                {
                    //Create the worksheet
                    ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Grave");
                    ws.Cells[1, 1].Value = "SKU";
                    ws.Cells[1, 2].Value = "Plot Name";
                    ws.Cells[1, 3].Value = "Plot No ";
                    ws.Cells[1, 4].Value = "Type of Plot";
                    ws.Cells[1, 5].Value = "Size";
                    ws.Cells[1, 6].Value = "Adress";
                    ws.Cells[1, 7].Value = "Location";
                    ws.Cells[1, 8].Value = "Religious";
                    ws.Cells[1, 9].Value = "Sect";
                    ws.Cells[1, 10].Value = "Short Description";
                    ws.Cells[1, 11].Value = "Full Description";
                    ws.Cells[1, 12].Value = "Write of Internement";
                    ws.Cells[1, 13].Value = "Internement Fee";
                    ws.Cells[1, 14].Value = "Lease";
                    ws.Cells[1, 15].Value = "Maintenance";
                    ws.Cells[1, 16].Value = "Tiers";
                    ws.Cells[1, 17].Value = "Internement Prices";
                    int row = 2;
                    foreach (var order in Orderslist)
                    {
                        ws.Cells[row, 1].Value = order.SKU;
                        ws.Cells[row, 2].Value = order.PlotName;
                        ws.Cells[row, 3].Value = order.PlotNo;
                        ws.Cells[row, 4].Value = order.PlotType;
                        ws.Cells[row, 5].Value = order.Size;
                        ws.Cells[row, 6].Value = order.Address;
                        ws.Cells[row, 7].Value = order.Location;
                        if (order.Relgion != null)
                        {
                            ws.Cells[row, 8].Value = order.Relgion.RelgionName;
                        }
                        if (order.SubRelgion != null)
                        {
                            ws.Cells[row, 9].Value = order.SubRelgion.SubRelgionName;
                        }
                        else
                        {
                            ws.Cells[row, 9].Value = "";
                        }
                        ws.Cells[row, 10].Value = order.ShortDescription;
                        ws.Cells[row, 11].Value = order.FullDescription;
                        ws.Cells[row, 12].Value = order.Internement;
                        ws.Cells[row, 13].Value = order.InternementFee;
                        ws.Cells[row, 14].Value = order.Lease;
                        ws.Cells[row, 15].Value = order.Maintenance;
                        ws.Cells[row, 16].Value = order.Tier.Name;
                        var layer = "";
                        var c = 1;
                        foreach (var item in order.CemeteryLayers)
                        {
                            if (c == order.CemeteryLayers.Count())
                            {
                                layer += item.Name + "|" + item.Price;
                            }
                            else
                            {
                                layer += item.Name + "|" + item.Price + ";";
                            }
                            c++;
                        }
                        ws.Cells[row, 17].Value = layer;
                        row++;
                    }

                    //Write it back to the client
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=ExcelGrave.xlsx");
                    Response.BinaryWrite(pck.GetAsByteArray());
                }
                return View("ExportExcel_Report");
            }
            catch (Exception ex)
            {
                ViewBag.Result = ex.Message;
                return RedirectToAction("ViewPlots");
            }
        }

        public ActionResult ImportPlots()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var cemeteries = new CemeteryRepository().GetAll();
            return View(cemeteries);
        }

        [HttpPost]
        public string LoadSections(string id)
        {
            var contnt = "<option value=''>-- Select Section --</option>";
            if (!string.IsNullOrEmpty(id))
            {
                var cemeteryId = Convert.ToDecimal(id);
                var list = new MainSectionRepository().GetAll(c => c.CemeteryId == cemeteryId);
                foreach (var item in list)
                {
                    contnt += "<option value='" + item.Id + "'>" + item.Name + "</option>";
                }
            }
            return contnt;
        }

        [HttpPost]
        public ActionResult UploadCSVFile(string sectionId)
        {

            string res = "";
            string filename = "";
            string f = "0";
            try
            {

                if (Request.Files.Count > 0)
                {
                    string folder = Server.MapPath("~/Files/UserSheet/");
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
                            f = SaveExcelData(fname, "csv", sectionId);
                        }
                    }
                }
                return Json(new { msg = "true", count = f });
            }
            catch (Exception)
            {
                return Json(new { msg = "false", count = f });
            }
        }

        ///////////////////////////////////// Save product Data to database  /////////////////////////////////////////////////
        public string SaveExcelData(string path, string ext, string sectionId)
        {
            var res = "";
            try
            {
                int total = 0;
                int count = 0;
                //string path = HostingEnvironment.MapPath("/UserSheet/" + filename);
                if (ext.ToLower() == "xls" || ext.ToLower() == "xlsx")
                {
                    string filePath = path;
                    FileStream stream = System.IO.File.Open(path, FileMode.Open, FileAccess.Read);
                    using (IExcelDataReader reader = ExcelReaderFactory.CreateOpenXmlReader(stream))
                    {
                        while (reader.Read())
                        {
                            if (count > 0)
                            {
                                var price = Regex.Replace(reader.GetString(15).Replace(",", ""), "[^0-9.]", "");
                                var obj = new Grave()
                                {
                                    SKU = reader.GetString(0),
                                    PlotName = reader.GetString(1),
                                    Image = reader.GetString(2),
                                    PlotNo = reader.GetString(3),
                                    PlotType = reader.GetString(4),
                                    Size = reader.GetString(5),
                                    Location = null,
                                    ShortDescription = reader.GetString(9),
                                    FullDescription = reader.GetString(10),
                                    Internement = reader.GetString(11),
                                    InternementFee = Convert.ToDecimal(reader.GetString(12)),
                                    Lease = reader.GetString(13),
                                    Maintenance = reader.GetString(14)

                                };
                                new GravesRepository().Add(obj);
                                total++;
                            }
                            count++;
                        }
                    }
                }
                else
                {
                    using (TextFieldParser csvParser = new TextFieldParser(path))
                    {
                        csvParser.CommentTokens = new string[] { "#" };
                        csvParser.SetDelimiters(new string[] { "," });
                        csvParser.HasFieldsEnclosedInQuotes = true;
                        csvParser.ReadLine();
                        while (!csvParser.EndOfData)
                        {
                            string[] fields = csvParser.ReadFields();
                            var obj = new Grave();
                            obj.SKU = fields[0];
                            obj.PlotName = fields[1];
                            obj.PlotNo = fields[2];
                            obj.PlotType = fields[3];
                            obj.Size = fields[4];
                            obj.Address = fields[5];
                            obj.Location = fields[6];
                            var rel = fields[7].ToLower();
                            var religion = new RelgionRepostiory().FirstOrDefault(c => c.RelgionName.ToLower() == rel);
                            if (religion != null)
                            {
                                obj.ReligionId = religion.Id;
                            }
                            var subrel = fields[8].ToLower();
                            var subReligion = new SubRelgionRepository().FirstOrDefault(c => c.SubRelgionName.ToLower() == subrel);
                            if (subReligion != null)
                            {
                                obj.SectId = subReligion.Id;
                            }
                            obj.SectionId = Convert.ToDecimal(sectionId);
                            obj.ShortDescription = fields[9];
                            obj.FullDescription = fields[10];
                            obj.Internement = fields[11];
                            obj.InternementFee = Convert.ToDecimal(fields[12]); ;
                            obj.Lease = fields[13];
                            obj.Maintenance = fields[14];
                            var tyr = fields[15].ToLower();
                            var tier = new TierRepository().FirstOrDefault(c => c.Name.ToLower() == tyr);
                            if (tier != null)
                            {
                                obj.TierId = tier.Id;
                            }
                            var kk = new GravesRepository().Add(obj);
                            if (kk)
                            {
                                var layers = fields[16].Split(';');
                                foreach (var item in layers)
                                {
                                    if (!string.IsNullOrEmpty(item))
                                    {
                                        var layer = item.Split('|');
                                        var layerObj = new CemeteryLayer();
                                        layerObj.CemeteryId = obj.Id;
                                        layerObj.Name = layer[0];
                                        layerObj.Price = Convert.ToDecimal(layer[1]);
                                        new CemeteryLayerRepository().Add(layerObj);
                                    }
                                }
                            }
                            total++;
                        }
                    }
                }
                ////////

                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
                res = total + "";
            }
            catch (Exception ex)
            {
                res = "false";
            }
            finally
            {
                if (System.IO.File.Exists(path))
                {
                    System.IO.File.Delete(path);
                }
            }
            return res;
        }

        [HttpPost]
        public PartialViewResult LoadUnMappingGraves(string sectionId)
        {
            var list = new GravesRepository().GetAll();
            if (!string.IsNullOrEmpty(sectionId))
            {
                var sectID = Convert.ToDecimal(sectionId);
                list = list.Where(c => c.SectionId == sectID).ToList();
            }
            return PartialView("~/Areas/Admin/Views/Plots/_LoadUnMappingGraves.cshtml", list);
        }

        [HttpPost]
        public string DeleteSelectedGraves(string ids)
        {
            try
            {
                var list = new JavaScriptSerializer().Deserialize<List<string>>(ids);
                foreach (var item in list)
                {
                    new GravesRepository().DeleteRecord(Convert.ToDecimal(item));
                }
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        [HttpPost]
        public string EnableDisable(string id)
        {
            var obj = new GravesRepository().GetById(Convert.ToDecimal(id));
            if (obj.IsEnabled != null)
            {
                if (obj.IsEnabled == true)
                {
                    obj.IsEnabled = false;
                }
                else
                {
                    obj.IsEnabled = true;
                }
            }
            else
            {
                obj.IsEnabled = true;
            }
            var f = new GravesRepository().Update(obj);
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
        public ActionResult SaveGraveImage()
        {
            string path = string.Empty;
            string filePath = "";
            if (Request.Files != null)
                try
                {
                    for (int i = 0; i < Request.Files.Count; i++)
                    {
                        var file = Request.Files[i];
                        
                        var name = file.FileName;
                        Random rand = new Random();
                        var r = rand.Next(1, 9999999);


                        name = name +"_"+ r + ".png";
                        filePath = name;
                        path = Path.Combine(Server.MapPath("/images/CemeteryPlots/"), name);
                        file.SaveAs(path);

                    }
                    return Json(new { msg = "true", Image = filePath });
                }
                catch (Exception)
                {
                    return Json(new { msg = "false", Image = "" });
                }
            else
            {
                return Json(new { msg = "false", Image = "" });
            }
        }
    }

    class tempCemeteryLayer
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
    }
    class tempPlot
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Lat { get; set; }
        public string Longi { get; set; }
        public string Image { get; set; }
        public int Zoom { get; set; }
        public string Address { get; set; }
        public List<tempCemetery> list { get; set; }
        public string drpSections { get; set; }
    }

    class tempCemetery
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string OriginalCode { get; set; }
        public List<CemeteryImagesModel> ImagesList { get; set; }
    }
    public class tempLocation
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    class tempGraveBound
    {
        public double lat { get; set; }
        public double lng { get; set; }
    }

}