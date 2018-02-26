using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;
using BurialPlots.Models;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class NewsManagementController : Controller
    {
        // GET: Admin/NewsManagement
        public ActionResult Index()
        {
            if (Session["adminUser"] != null && Session["adminRole"].ToString() == "SuperAdmin")
            {
                return View();
            }
            return RedirectToAction("Index", "Login", new { area = "Admin" });
        }

        [HttpGet]
        public ActionResult NewsDetails(Decimal id)
        {
            var newsList = new NewsManagementRepository().GetById(id);
            return View(newsList);
        }

        [HttpPost]
        public PartialViewResult LoadNews()
        {
            var list = new NewsManagementRepository().GetAll().ToList();
            return PartialView("~/Areas/Admin/Views/NewsManagement/_LoadNews.cshtml", list);
        }

        [HttpPost]
        public string DeleteNews(string id)
        {
            try
            {
                new NewsManagementRepository().Delete(Convert.ToDecimal(id));
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        [HttpPost]
        public string SaveNews(string id, string title, string desc, string pubDate, string expiryDate, string titleUrdu, string titleArabic,
                string titleChinese, string titleItalian, string titleHindi, string titleTurkish, string titleBengali,
                string titleHebrew, string descUrdu, string descArabic, string descChinese, string descItalian,
                string descHindi, string descTurkish, string descBengali, string descHebrew)
        {
            if (string.IsNullOrEmpty(id))
            {
                var obj = new NewsManagement();
                obj.Description = desc;
                obj.PubDate = Convert.ToDateTime(pubDate);
                obj.Title = title;
                obj.TitleArabic = titleArabic;
                obj.DescriptionArabic = descArabic;
                obj.DescriptionBengali = descBengali;
                obj.DescriptionChinese = descChinese;
                obj.DescriptionHebrew = descHebrew;
                obj.DescriptionHindi = descHindi;
                obj.DescriptionItalian = descItalian;
                obj.DescriptionUrdu = descUrdu;
                obj.DescriptionTurkish = descTurkish;
                obj.TitleBengali = titleBengali;
                obj.TitleChinese = titleChinese;
                obj.TitleHebrew = titleHebrew;
                obj.TitleHindi = titleHindi;
                obj.TitleItalian = titleItalian;
                obj.TitleUrdu = titleUrdu;
                obj.TitleTurkish = titleTurkish;
                obj.ExpiryDate = Convert.ToDateTime(expiryDate);
                var f = new NewsManagementRepository().Add(obj);
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
                var obj = new NewsManagementRepository().GetById(Convert.ToDecimal(id));
                obj.Description = desc;
                obj.PubDate = Convert.ToDateTime(pubDate);
                obj.Title = title;
                obj.TitleArabic = titleArabic;
                obj.DescriptionArabic = descArabic;
                obj.DescriptionBengali = descBengali;
                obj.DescriptionChinese = descChinese;
                obj.DescriptionHebrew = descHebrew;
                obj.DescriptionHindi = descHindi;
                obj.DescriptionItalian = descItalian;
                obj.DescriptionUrdu = descUrdu;
                obj.DescriptionTurkish = descTurkish;
                obj.TitleBengali = titleBengali;
                obj.TitleChinese = titleChinese;
                obj.TitleHebrew = titleHebrew;
                obj.TitleHindi = titleHindi;
                obj.TitleItalian = titleItalian;
                obj.TitleUrdu = titleUrdu;
                obj.TitleTurkish = titleTurkish;
                obj.ExpiryDate = Convert.ToDateTime(expiryDate);
                var f = new NewsManagementRepository().Update(obj);
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
        public string EditNews(string id)
        {
            var obj = new NewsManagementRepository().GetById(Convert.ToDecimal(id));
            var temp = new NewsManagementModel();
            temp.ArabicDescription = obj.DescriptionArabic;
            temp.ArabicTitle = obj.TitleArabic;
            temp.BengaliDescription = obj.DescriptionBengali;
            temp.BengaliTitle = obj.TitleBengali;
            temp.ChineseDescription = obj.DescriptionChinese;
            temp.ChineseTitle = obj.TitleChinese;
            temp.Description = obj.Description;
            if (obj.ExpiryDate != null)
            {
                temp.ExpireDate = obj.ExpiryDate.Value.ToShortDateString();
            }
            temp.HebrewDescription = obj.DescriptionHebrew;
            temp.HebrewTitle = obj.TitleHebrew;
            temp.HindiDescription = obj.DescriptionHindi;
            temp.HindiTitle = obj.TitleHindi;
            temp.Id = obj.Id + "";
            temp.ItalianDescription = obj.DescriptionItalian;
            temp.ItalianTitle = obj.TitleItalian;
            if (obj.PubDate != null)
            {
                temp.PubDate = obj.PubDate.Value.ToShortDateString();
            }
            temp.Title = obj.Title;
            temp.TurkishDescription = obj.DescriptionTurkish;
            temp.TurkishTitle = obj.TitleTurkish;
            temp.UrduDescription = obj.DescriptionUrdu;
            temp.UrduTitle = obj.TitleUrdu;
            var aa = new JavaScriptSerializer();
            return aa.Serialize(temp);
        }
    }
}