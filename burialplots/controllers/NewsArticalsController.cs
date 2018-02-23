using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class NewsArticalsController : Controller
    {
        public static int Count = 0;
        // GET: NewsArticals
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BlogDetail(Decimal id)
        {
            var blog = new BlogListRepository().GetById(id);
            return View(blog);
        }
        [HttpGet]
        public PartialViewResult LoadBlog()
        {
            Count = 0;
            return PartialView("~/Views/NewsArticals/_LoadMoreBlog.cshtml");
        }
        [HttpGet]
        public PartialViewResult LoadMoreBlog(string BlogCount,string totalBlogCount)
        {
            ViewBag.BlogCount = BlogCount;
            ViewBag.totalBlogCount = totalBlogCount;
            return PartialView("~/Views/NewsArticals/_LoadMoreBlogList.cshtml");
        }
        [HttpPost]
        public PartialViewResult LoadBlogSection()
        {
            return PartialView("~/Views/NewsArticals/_LoadBlogSection.cshtml");
        }
    }
}