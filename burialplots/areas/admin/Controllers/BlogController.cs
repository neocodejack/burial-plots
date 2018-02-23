using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class BlogController : Controller
    {
        // GET: Admin/Blog
        public ActionResult Index()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        public PartialViewResult LoadBlogListing()
        {
            var list = new BlogListRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Blog/_LoadBlogListing.cshtml", list);
        }
        [HttpGet]
        public ActionResult CreateBlog()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        public ActionResult EditBlog(string id)
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                var blog = new BlogListRepository().GetById(Convert.ToDecimal(id));
                return View(blog);
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        [ValidateInput(false)]
        [HttpPost]
        public string CreateBlog(Blog blog)
        {
            try
            {
                if (blog.Id == 0)
                {
                    var createBlog = new BlogListRepository().Add(blog);
                }
                else
                {
                    var obj = new BlogListRepository().GetById(blog.Id);
                    if (!string.IsNullOrEmpty(blog.FeaturedImage))
                    {
                        var path = Server.MapPath("~/Images/Blog/"+obj.FeaturedImage);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                    }
                    else
                    {
                        blog.FeaturedImage = obj.FeaturedImage;
                    }
                    new BlogListRepository().Update(blog);
                }
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }
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

        [HttpPost]
        public string DeleteBlog(string id)
        {
            try
            {
                var obj = new BlogListRepository().GetById(Convert.ToDecimal(id));
                var f = new BlogListRepository().DeleteRecord(Convert.ToDecimal(id));
                if (f)
                {
                    var path = Server.MapPath("~/images/Blog/" + obj.FeaturedImage);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                }
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        // Publish Blog Approval
        public string PublishBlogApproval(string id)
        {
            var dbBlog = new BlogListRepository().GetById(Convert.ToDecimal(id));
            dbBlog.IsApproved = true;
            try
            {
                new BlogListRepository().Update(dbBlog);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }

        }
        // Un-Publish Blog Approval
        public string UnPublishBlogApproval(string id)
        {
            var dbBlog = new BlogListRepository().GetById(Convert.ToDecimal(id));
            dbBlog.IsApproved = false;
            try
            {
                new BlogListRepository().Update(dbBlog);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }

        }
        public ActionResult AddBlogCategory()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
        [HttpPost]
        public string SaveBlogCategory(string id, string name)
        {
            var blogCategory = new BlogCategory();
            if (string.IsNullOrEmpty(id))
            {
                blogCategory.Name = name;
                try
                {
                    var res = new BlogCategoryRepository().Add(blogCategory);

                    return "true";

                }
                catch (Exception e)
                {
                    return "false";
                }
            }
            else
            {
                var dbObj = new BlogCategoryRepository().GetById(Convert.ToDecimal(id));
                try
                {
                    dbObj.Name = name;
                    var res = new BlogCategoryRepository().Update(dbObj);
                    return "true";
                }
                catch (Exception e)
                {
                    return "false";
                }
            }
        }
        public PartialViewResult LoadBlogCategory()
        {
            var list = new BlogCategoryRepository().GetAll();
            return PartialView("~/Areas/Admin/Views/Blog/_LoadBlogCategory.cshtml", list);
        }

        // Delete Blog Category
        [HttpPost]
        public string DeleteBlogCategory(string id)
        {
            try
            {
                new BlogCategoryRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception)
            {
                return "false";
            }
        }

  
        //Picture Upload Action Method
        public ActionResult Upload()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
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
                            path = Path.Combine(Server.MapPath("/images/Blog/"), fileName);
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
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }
    }
}