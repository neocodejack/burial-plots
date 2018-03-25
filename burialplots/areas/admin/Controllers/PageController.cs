using BurialPlots.DAL;
using BurialPlots.Filters;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class PageController : Controller
    {
        // GET: Admin/Page
        public ActionResult Index()
        {
            if (Session["adminUser"] == null && Session["adminRole"].ToString() != "SuperAdmin")
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var getbox = new ServiceBoxRepository().GetAll();
                //Editor Editor1 = new Editor(System.Web.HttpContext.Current, "Editor1");
                //Editor1.LoadFormData(getdata.Body);
                //Editor1.MvcInit();
                //ViewBag.Editor = Editor1.MvcGetString();
                ViewBag.box = getbox;
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }



        }
        [HttpPost]
        [ValidateInput(false)]
        public string PageAdded(string html, string tittle, string image, string[] servicebox, string bodyUrdu, string bodyArabic,
            string bodyChinese, string bodyHindi, string bodyItalian, string bodyTurkish, string bodyBengali, string bodyHebrew,
            string tittleUrdu, string tittleArabic, string tittleChinese, string tittleItalian,
            string tittleHindi, string tittleTurkish, string tittleBengali, string tittleHebrew)
        {
            try
            {
                var pagebody = Request.Unvalidated.Form["html"] + "";
                var p = new Page();
                p.Body = pagebody;
                p.PageTittle = tittle;
                p.Pageurl = tittle.Replace(" ", "-");
                p.FeatureImage = image;
                p.BodyArabic = bodyArabic;
                p.BodyBengali = bodyBengali;
                p.BodyChinese = bodyChinese;
                p.BodyHebrew = bodyHebrew;
                p.BodyHindi = bodyHindi;
                p.BodyItalian = bodyItalian;
                p.BodyTurkish = bodyTurkish;
                p.BodyUrdu = bodyUrdu;
                p.TitleArabic = tittleArabic;
                p.TitleBengali = tittleBengali;
                p.TitleChinese = tittleChinese;
                p.TitleHebrew = tittleHebrew;
                p.TitleHindi = tittleHindi;
                p.TitleItalian = tittleItalian;
                p.TitleTurkish = tittleTurkish;
                p.TitleUrdu = tittleUrdu;
                var add = new PageRepository().Add(p);
                var getlastid = new PageRepository().LastOrDefaultRecord();
                PageBox pb = new PageBox();

                int i = 0;
                int count = servicebox.Length;
                if (add)
                {
                    foreach (var item in servicebox)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            string value = item.ToString();
                            pb.Box = Convert.ToInt32(value);
                            pb.Page = getlastid.Id;
                            var addpagebox = new PageBoxRepository().Add(pb);

                            if (i < count)
                            {
                                i++;
                            }

                        }
                        else
                        {
                            return "true";
                        }

                    }
                    return "true";

                }

                else
                {
                    return "false";
                }


            }
            catch (Exception e)
            {
                return "false";
            }

        }

        [GZipOrDeflate]
        public ActionResult PageView(string id)
        {
            string language = "";
            if (Request.Browser.Cookies)
            {
                HttpCookie reqCookies = Request.Cookies["Language"];
                if (reqCookies == null)
                {
                    HttpCookie cookie = new HttpCookie("Language");
                    cookie.Value = "en";
                    Response.Cookies.Add(cookie);
                }
                else
                {
                    language = Convert.ToString(reqCookies.Value);
                }
            }
            else
            {
                language = "en";
            }
            HttpCookie lang = Request.Cookies["Language"];
            if (lang != null)
            {
                language = lang.Value;
            }

            ViewBag.FeaturedCemetries = new CemeteryRepository().GetAll(x=>x.IsFeatured==true).OrderByDescending(x=>x.Id).ToList();
            try
            {
                ViewBag.NewsList = 
                ViewBag.NewsFeeds = new NewsManagementRepository().GetAll();
                ViewBag.Teams = new TeamsRepository().GetAll();
                ViewBag.Faqs = new FAQsRepository().GetAll();
                var pageload = new PageRepository().FirstOrDefault(x => x.Pageurl == id);
                if (pageload == null)
                {
                    //Check if this url is providing the popular location's infor
                    var pageId = new GenericRepository<LocationUrl>().GetAll().Where(_ => _.PageName.Equals(id)).Select(_ => _.PageId).FirstOrDefault();

                    if (pageId == null)
                    {
                        return RedirectToAction("ErrorPage", "Home", new { Area = "" });
                    }
                    else
                    {
                        var locationContent = new GenericRepository<PopularLocationContent>().GetAll().ToList();
                        var location = locationContent.Where(x => x.PopularLocationName.Equals(pageId.ToString())).FirstOrDefault();
                        ViewBag.HeaderImage = location.HeaderImage;
                        ViewBag.HeaderText = Regex.Replace(location.HeaderText, "<.*?>|&.*?;", string.Empty);
                        ViewBag.FirstColHeader = Regex.Replace(location.FirstColHeader, "<.*?>|&.*?;", string.Empty);
                        ViewBag.FirstColText = Server.HtmlDecode(location.FirstColText);
                        ViewBag.FirstColImage = location.FirstColImage;
                        ViewBag.SecondColHeader = Regex.Replace(location.SecondColHeader, "<.*?>|&.*?;", string.Empty);
                        ViewBag.SecondColText = Server.HtmlDecode(location.SecondColText);
                        ViewBag.SecondColeImage = location.SecondColImage;
                        ViewBag.ThirdColHeader = Regex.Replace(location.SecondColHeader, "<.*?>|&.*?;", string.Empty);
                        ViewBag.ThirdColText = Server.HtmlDecode(location.ThirdColText);
                        ViewBag.ThirdColImage = location.ThirdColImage;
                        ViewBag.Step1Header = location.Step1Header;
                        ViewBag.Step1Message = location.Step1Message;
                        ViewBag.Step2Header = location.Step2Header;
                        ViewBag.Step2Message = location.Step2Message;
                        ViewBag.Step3Header = location.Step3Header;
                        ViewBag.Step3Message = location.Step3Message;
                        return View("_PopularLocations");
                    }
                }
                var servicebx = new PageBoxRepository().GetAll().Where(x => x.Page == pageload.Id);
                ViewBag.box = servicebx;
                ViewBag.ServiceBoxesCount = servicebx.Count();
                
                ViewBag.Body = pageload.Body;
                ViewBag.tittle = pageload.PageTittle;
                ViewBag.ReligionList = new RelgionRepostiory().GetAll();
                ViewBag.Slides = new AddSlidesRepository().GetAll();
                ViewBag.image = pageload.FeatureImage;
                ViewBag.Language = language;
                return View();
            }
            catch (Exception e)
            {
                return View();
            }

        }

        [HttpGet]
        public ActionResult EnquiryList()
        {
            var result = new GenericRepository<Enquiry>().GetAll().AsEnumerable();
            return PartialView("_EnquiryList", result);
        }

        public ActionResult PageSelect()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var page = new PageRepository().GetAll();
                ViewBag.pages = page;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        [HttpPost]
        public string DeletePage(string id)
        {
            bool result = false;
            bool res = false;
            var ID = Convert.ToDecimal(id);
            var c = new PageRepository().GetById(ID);
            var pageBox = new PageBoxRepository().GetAll(x => x.Page == c.Id);
            foreach (var item in pageBox)
            {
                result = new PageBoxRepository().DeleteRecord(item.Id);

            }
            if (c != null)
            {
                if (result == true || pageBox.Count == 0)
                {
                    res = new PageRepository().DeleteRecord(ID);
                }
            }


            if (res)
            {
                return "True";

            }
            else
            {
                return "false";
            }
        }
        public ActionResult Edit(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                Page c = new PageRepository().GetById(Convert.ToDecimal(id));
                ViewBag.body = c.Body;
                ViewBag.tittle = c.PageTittle;
                ViewBag.Id = id;
                ViewBag.pageurl = "Admin/Page/PageView/" + c.PageTittle;
                ViewBag.image = c.FeatureImage;
                var getbox = new ServiceBoxRepository().GetAll();
                ViewBag.box = getbox;
                return View(c);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpGet]
        public JsonResult GetCountries()
        {
            var country = new CountryRepository();
            var list = country.GetAll().Select(_ => new CountryModel { CountryId = _.Id, CountryName = _.Name }).ToList();
            
            return Json(list, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult GetCountyByCountry(decimal Id)
        {
            var county = new CountyRepository().GetAll().Where(_=>_.CountryId.Equals(Id))
                                        .Select(_=>new CountyModel { CountyId=_.Id, CountyName=_.Name }).ToList();
            return Json(county, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult AddLocation()
        {
            ViewBag.IsEditMode = "0";
            ViewBag.Title = "Add Location";
            ViewBag.PageName = "Add Location";
            return PartialView("_AddLocation");
        }

        [HttpPost]
        public ActionResult UploadFile()
        {
            string fname = string.Empty;
            if (Request.Files.Count > 0)
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        
                        HttpPostedFileBase file = files[i];
                        fname = Guid.NewGuid().ToString()+"."+file.FileName.Split('.')[1];
                        
                        // Get the complete folder path and store the file inside it.  
                        string finalName = Path.Combine(Server.MapPath("~/landingpageImages/"), fname);
                        file.SaveAs(finalName);
                    }
                    // Returns message that successfully uploaded  
                    return Content(fname);
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }
        }

        [HttpPost]
        public ActionResult AddLocation(PopularLocationContent data)
        {
            if (!string.IsNullOrEmpty(data.PopularLocationName))
            {
                var isAdded = new GenericRepository<PopularLocationContent>().Add(data);
                if (isAdded)
                {
                    return Content("Sucessfully Added");
                }
                else
                {
                    return Content("Something went wrong, Please try again");
                }
            }
            else
            {
                return Content("Location Cannot Be Blank");
            }
        }

        [HttpGet]
        public JsonResult GetLocationContent(string locationId)
        {
            PopularLocationContent content = new PopularLocationContent();
            if (!string.IsNullOrEmpty(locationId))
            {
                content = new GenericRepository<PopularLocationContent>().GetAll().Where(_ => _.PopularLocationName.Equals(locationId)).FirstOrDefault();
                
            }
            
            return Json(content, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult EditLocation()
        {
            ViewBag.IsEditMode = "1";
            ViewBag.Title = "Edit Location";
            ViewBag.PageName = "Edit Location";
            return PartialView("_AddLocation");
        }

        [HttpGet]
        public ActionResult GetLocationName(string locationId)
        {
            var locationName = new GenericRepository<LocationUrl>().GetAll()
                                        .Where(_ => _.PageId.Equals(Convert.ToDecimal(locationId)))
                                        .Select(_ => _.PageName)
                                        .FirstOrDefault();
            return Json(locationName, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditLocation(PopularLocationContent content)
        {
            var isEdited = new GenericRepository<PopularLocationContent>().UpdateLocation(content);
            if (isEdited)
            {
                return Content("Successfully Edited");
            }
            else
            {
                return Content("Unable to edit, please try later");
            }
        }

        [HttpPost]
        public ActionResult SaveLocation(int locationId, string locationName)
        {
            var responseStatus = false;
            var locationObject = new LocationUrl { Id = locationId, PageId = locationId, PageName = locationName };

            var previousLocationName = new GenericRepository<LocationUrl>().GetAll()
                                        .Where(_ => _.PageId.Equals(Convert.ToDecimal(locationId)))
                                        .Select(_ => _.PageName)
                                        .FirstOrDefault();
            if (previousLocationName == string.Empty)
            {
                responseStatus = new GenericRepository<LocationUrl>().Add(locationObject);
            }
            else if(previousLocationName != locationName)
            {
                responseStatus = new GenericRepository<LocationUrl>().Update(locationObject);
            }

            return Json(responseStatus, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [ValidateInput(false)]
        public string Edit(string id, string html, string tittle, string[] servicebox, string image, string bodyUrdu, string bodyArabic,
            string bodyChinese, string bodyHindi, string bodyItalian, string bodyTurkish, string bodyBengali, string bodyHebrew,
            string tittleUrdu, string tittleArabic, string tittleChinese, string tittleItalian,
            string tittleHindi, string tittleTurkish, string tittleBengali, string tittleHebrew)
        {
            try
            {
                int idnew = Convert.ToInt32(id);
                var pagedata = new PageRepository().FirstOrDefault(x => x.Id == idnew);
                var pagebody = Request.Unvalidated.Form["html"] + "";
                Page p = new PageRepository().GetById(Convert.ToInt32(id));
                p.Body = pagebody;
                p.BodyArabic = bodyArabic;
                p.BodyBengali = bodyBengali;
                p.BodyChinese = bodyChinese;
                p.BodyHebrew = bodyHebrew;
                p.BodyHindi = bodyHindi;
                p.BodyItalian = bodyItalian;
                p.BodyTurkish = bodyTurkish;
                p.BodyUrdu = bodyUrdu;
                p.PageTittle = tittle;
                p.TitleArabic = tittleArabic;
                p.TitleBengali = tittleBengali;
                p.TitleChinese = tittleChinese;
                p.TitleHebrew = tittleHebrew;
                p.TitleHindi = tittleHindi;
                p.TitleItalian = tittleItalian;
                p.TitleTurkish = tittleTurkish;
                p.TitleUrdu = tittleUrdu;
                if (image != null)
                {
                    p.FeatureImage = image;
                }
                else
                {
                    p.FeatureImage = pagedata.FeatureImage;
                }

                var c = new PageRepository().Update(p);
                if (c)
                {
                    var boxList = new PageBoxRepository().GetAll(f=>f.Page == p.Id);
                    foreach (var item in boxList)
                    {
                        new PageBoxRepository().DeleteRecord(item.Id);
                    }
                    int count = servicebox.Length;
                    foreach (var item in servicebox)
                    {
                        PageBox pb = new PageBox();
                        if (!string.IsNullOrEmpty(item))
                        {
                            pb.Box = Convert.ToInt32(item);
                            pb.Page = p.Id;
                            var addpagebox = new PageBoxRepository().Add(pb);
                        }
                        else
                        {
                            return "true";
                        }

                    }
                    return "true";
                }
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }
        }
        [HttpPost]
        public ActionResult LoadPagesPartial()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var data = new PageRepository().GetAll().ToList();
                return View("~/Areas/Admin/Views/Page/_LoadPages.cshtml", data);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public ActionResult LoadPages()
        {
            return View();
        }
        //Picture Upload Action Method
        [HttpPost]
        public ActionResult Upload()
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
                        path = Path.Combine(Server.MapPath("/Areas/Admin/Image"), fileName);
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
        public ActionResult ServiceBox()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var allpage = new PageRepository().GetAll();
                ViewBag.page = allpage;
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public string ServiceBoxAdded(string id, string name, string des, string pic, string status, string url, string link, string urlstat)
        {
            try
            {
                if (string.IsNullOrEmpty(id))
                {
                    ServiceBox s = new ServiceBox();
                    s.BoxName = name;
                    s.BoxPic = pic;
                    //s.BoxUrl = Convert.ToInt32(url);

                    if (urlstat == "ok")
                    {
                        s.UrlStatus = false;
                        string b = link.Substring(0, 4);
                        if (b == "http")
                        {
                            s.ServiceUrl = link;
                        }
                        else
                        {
                            s.ServiceUrl = "http://" + link;
                        }

                    }
                    else
                    {
                        s.UrlStatus = true;
                        s.ServiceUrl = link;
                    }
                    if (status == "ok")
                    {
                        s.BoxStatus = true;
                        s.BoxDescription = des;
                    }
                    else
                    {
                        s.BoxStatus = false;
                        s.BoxDescription = "";
                    }
                    var insert = new ServiceBoxRepository().Add(s);
                    return "true";
                }
                else
                {
                    ServiceBox s = new ServiceBoxRepository().GetById(Convert.ToDecimal(id));
                    s.BoxName = name;
                    if (!string.IsNullOrEmpty(pic))
                    {
                        var path = Server.MapPath("~/Areas/Admin/Image" + s.BoxPic);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                        s.BoxPic = pic;
                    }
                    //s.BoxUrl = Convert.ToInt32(url);

                    if (urlstat == "ok")
                    {
                        s.UrlStatus = false;
                        string b = link.Substring(0, 4);
                        if (b == "http")
                        {
                            s.ServiceUrl = link;
                        }
                        else
                        {
                            s.ServiceUrl = "http://" + link;
                        }

                    }
                    else
                    {
                        s.UrlStatus = true;
                        s.ServiceUrl = link;
                    }
                    if (status == "ok")
                    {
                        s.BoxStatus = true;
                        s.BoxDescription = des;
                    }
                    else
                    {
                        s.BoxStatus = false;
                        s.BoxDescription = "";
                    }
                    var insert = new ServiceBoxRepository().Update(s);
                    return "true";
                }
            }
            catch (Exception e)
            {

                return "false";
            }

        }

        [HttpPost]
        public PartialViewResult LoadBlogSection()
        {
            return PartialView("~/Areas/Admin/Views/Page/_LoadBlogSection.cshtml");
        }

        public ActionResult BlogDetail(Decimal id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var blog = new BlogListRepository().GetById(id);
                return View(blog);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public ActionResult ViewServiceBox()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpPost]
        public PartialViewResult LoadServiceBoxes()
        {
            var list = new ServiceBoxRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Page/_LoadServiceBoxes.cshtml", list);
        }

        [HttpPost]
        public string DeleteServiceBox(string id)
        {
            var f = new ServiceBoxRepository().DeleteRecord(Convert.ToDecimal(id));
            if (f)
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }

        public ActionResult EditServiceBox(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var allpage = new PageRepository().GetAll();
                ViewBag.page = allpage;
                var obj = new ServiceBoxRepository().GetById(Convert.ToDecimal(id));
                return View(obj);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
    }

    public class CountryModel
    {
        public decimal CountryId { get; set; }
        public string CountryName { get; set; }
    }

    public class CountyModel
    {
        public decimal CountyId { get; set; }
        public string CountyName { get; set; }
    }
}