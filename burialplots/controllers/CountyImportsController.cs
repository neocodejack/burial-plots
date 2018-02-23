using BurialPlots.DAL;
using Excel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class CountyImportsController : Controller
    {
        // GET: CountyImports
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ImportCounties(HttpPostedFileBase file)
        {
            var path = Server.MapPath("~/ImportSheets/");
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }
            var filePath = Server.MapPath("~/ImportSheets/" + file.FileName);
            file.SaveAs(filePath);
            FileStream stream = System.IO.File.Open(filePath, FileMode.Open, FileAccess.Read);
            using (IExcelDataReader reader = ExcelReaderFactory.CreateOpenXmlReader(stream))
            {
                var count = 0;
                while (reader.Read())
                {
                    if (count > 0)
                    {
                        var country = reader.GetString(0);
                        var countryObj = new CountryRepository().FirstOrDefault(c => c.Name.ToLower() == country.ToLower());
                        if (countryObj != null)
                        {
                            var countyName = reader.GetString(2);
                            var obj = new County();
                            obj.Name = countyName;
                            obj.CountryId = countryObj.Id;
                            obj.AddedDate = DateTime.Now;
                            new CountyRepository().Add(obj);
                        }
                    }
                    count++;
                }
            }
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ImportTowns(HttpPostedFileBase fileTown)
        {
            var path = Server.MapPath("~/ImportSheets/");
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }
            var filePath = Server.MapPath("~/ImportSheets/" + fileTown.FileName);
            fileTown.SaveAs(filePath);
            FileStream stream = System.IO.File.Open(filePath, FileMode.Open, FileAccess.Read);
            using (IExcelDataReader reader = ExcelReaderFactory.CreateOpenXmlReader(stream))
            {
                var count = 0;
                while (reader.Read())
                {
                    if (count > 0)
                    {
                        var county = reader.GetString(0);
                        var countyObj = new CountyRepository().FirstOrDefault(c => c.Name.ToLower() == county.ToLower());
                        if (countyObj != null)
                        {
                            var townName = reader.GetString(2);
                            var obj = new Town();
                            obj.Name = townName;
                            obj.CountyId = countyObj.Id;
                            obj.AddedDate = DateTime.Now.ToShortDateString();
                            new TownsRepositoy().Add(obj);
                        }
                    }
                    count++;
                }
            }
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ImportPostCode(HttpPostedFileBase filePost)
        {
            var path = Server.MapPath("~/ImportSheets/");
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }
            var filePath = Server.MapPath("~/ImportSheets/" + filePost.FileName);
            filePost.SaveAs(filePath);
            FileStream stream = System.IO.File.Open(filePath, FileMode.Open, FileAccess.Read);
            using (IExcelDataReader reader = ExcelReaderFactory.CreateOpenXmlReader(stream))
            {
                var count = 0;
                while (reader.Read())
                {
                    if (count > 0)
                    {
                        var county = reader.GetString(0);
                        var countyObj = new CountyRepository().FirstOrDefault(c => c.Name.ToLower() == county.ToLower());
                        if (countyObj != null)
                        {
                            var postCode = reader.GetString(2);
                            var obj = new PostCode();
                            obj.Code = postCode;
                            obj.CountyId = countyObj.Id;
                            obj.AddedDate = DateTime.Now;
                            new PostCodeRepository().Add(obj);
                        }
                    }
                    count++;
                }
            }
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }
            return RedirectToAction("Index");
        }

    }
}