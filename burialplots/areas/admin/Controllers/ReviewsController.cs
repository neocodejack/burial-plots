using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class ReviewsController : Controller
    {
        // GET: Admin/Reviews
        public ActionResult Index(Decimal id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var serviceReviews = new ReviewsListingRepository().GetAll(x => x.ServiceListingId == id);
            ViewBag.ServiceName = Request.QueryString["ServiceName"];
            ViewBag.id = id;
            return View(serviceReviews);
        }
        [HttpPost]
        public PartialViewResult LoadReviewsListing()
        {
            Decimal sId = 0;
            Decimal Id = Convert.ToDecimal(Session["memId"]);
            var service = new ServiceListingRepository().FirstOrDefault(x => x.PartnerId == Id);
            if (service != null)
            {
               sId = service.Id;
            }
            var reviews = new ReviewsListingRepository().GetAll(x => x.ServiceListingId == sId);
            return PartialView("~/Areas/Admin/Views/Reviews/_LoadReviewsListing.cshtml", reviews);
        }
        public ActionResult PendingReviews()
        {
            if (Session["memId"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var id = Convert.ToDecimal(Session["memId"]);
            var ServiceList = new ServiceListingRepository().GetAll(x=>x.PartnerId==id).Select(x=>x.Id).ToList();
            var reviewListCount = new ReviewsListingRepository().GetAll().Where(x => ServiceList.Contains(x.ServiceListingId ?? -1) && x.Status == null).ToList();
            return View(reviewListCount);
        }
        [HttpPost]
        public string ApprovedReview(Decimal id)
        {
            var DbReview = new ReviewsListingRepository().GetById(id);
            try
            {
                DbReview.Status = true;
                new ReviewsListingRepository().Update(DbReview);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }
        [HttpPost]
        public string DeleteReview(string id)
        {
            try
            {
                new ReviewsListingRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public ActionResult ShowDetails(string id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            var obj = new ReviewsListingRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }
    }
}