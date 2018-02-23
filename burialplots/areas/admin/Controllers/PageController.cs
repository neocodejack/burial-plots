using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
                ViewBag.NewsFeeds = new NewsManagementRepository().GetAll();
                ViewBag.Teams = new TeamsRepository().GetAll();
                ViewBag.Faqs = new FAQsRepository().GetAll();
                var pageload = new PageRepository().FirstOrDefault(x => x.Pageurl == id);
                if (pageload == null)
                {
                    return RedirectToAction("ErrorPage", "Home", new { Area="" });
                }
                var servicebx = new PageBoxRepository().GetAll().Where(x => x.Page == pageload.Id);
                ViewBag.box = servicebx;
                ViewBag.ServiceBoxesCount = servicebx.Count();
                if (language == "ur")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyUrdu))
                    {
                        ViewBag.Body = pageload.BodyUrdu;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleUrdu))
                    {
                        ViewBag.tittle = pageload.TitleUrdu;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "hi")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyHindi))
                    {
                        ViewBag.Body = pageload.BodyHindi;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleHindi))
                    {
                        ViewBag.tittle = pageload.TitleHindi;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "ar")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyArabic))
                    {
                        ViewBag.Body = pageload.BodyArabic;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleArabic))
                    {
                        ViewBag.tittle = pageload.TitleArabic;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "bn")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyBengali))
                    {
                        ViewBag.Body = pageload.BodyBengali;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleBengali))
                    {
                        ViewBag.tittle = pageload.TitleBengali;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "he")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyHebrew))
                    {
                        ViewBag.Body = pageload.BodyHebrew;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleHebrew))
                    {
                        ViewBag.tittle = pageload.TitleHebrew;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "it")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyItalian))
                    {
                        ViewBag.Body = pageload.BodyItalian;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleItalian))
                    {
                        ViewBag.tittle = pageload.TitleItalian;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "zh")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyChinese))
                    {
                        ViewBag.Body = pageload.BodyChinese;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleChinese))
                    {
                        ViewBag.tittle = pageload.TitleChinese;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else if (language == "tr")
                {
                    if (!string.IsNullOrEmpty(pageload.BodyTurkish))
                    {
                        ViewBag.Body = pageload.BodyTurkish;
                    }
                    else
                    {
                        ViewBag.Body = pageload.Body;
                    }
                    if (!string.IsNullOrEmpty(pageload.TitleTurkish))
                    {
                        ViewBag.tittle = pageload.TitleTurkish;
                    }
                    else
                    {
                        ViewBag.tittle = pageload.PageTittle;
                    }
                }
                else
                {
                    ViewBag.Body = pageload.Body;
                    ViewBag.tittle = pageload.PageTittle;
                }
                ViewBag.image = pageload.FeatureImage;
                ViewBag.Language = language;
                return View();
            }
            catch (Exception e)
            {
                return View();
            }

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
}