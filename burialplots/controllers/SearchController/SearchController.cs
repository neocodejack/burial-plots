using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult Index(int id)
        {
            ViewBag.BusinessName = new FuneralServicesRepository().GetById(id).Name;
            ViewBag.serviceId = id;

            return View();
        }

        public ActionResult SearchingByTown(string town, string funeralId)
        {
            ViewBag.FuneralId = funeralId;
            List<Town> townsList = null;
            if (string.IsNullOrEmpty(town))
            {
                townsList = new TownsRepositoy().GetAll();
                return PartialView("~/Views/Search/_TownsPartialView.cshtml", townsList);
            }
            else
            {
                townsList = new TownsRepositoy().GetAll(s => s.Name.StartsWith(town));
                return PartialView("~/Views/Search/_TownsPartialView.cshtml", townsList);
            }

        }
        public ActionResult SearchingByPostCode(string PostCodeChar, string funeralId)
        {
            ViewBag.FuneralId = funeralId;
            List<PostCode> postCodeList = null;
            if (String.IsNullOrEmpty(PostCodeChar))
            {
                postCodeList = new PostCodeRepository().GetAll();
                return PartialView("~/Views/Search/_PostCodePatialView.cshtml", postCodeList);
            }
            else
            {
                postCodeList = new PostCodeRepository().GetAll(p => p.Code.StartsWith(PostCodeChar));
                return PartialView("~/Views/Search/_PostCodePatialView.cshtml", postCodeList);
            }

        }
        public ActionResult SearchingByCounties(string Counties, string funeralId)
        {
            ViewBag.FuneralId = funeralId;
            List<County> CountiesList = null;
            if (String.IsNullOrEmpty(Counties))
            {
                CountiesList = new CountyRepository().GetAll();
                return PartialView("~/Views/Search/_CountiesPartialView.cshtml", CountiesList);
            }
            else
            {
                CountiesList = new CountyRepository().GetAll(p => p.Name.StartsWith(Counties));
                return PartialView("~/Views/Search/_CountiesPartialView.cshtml", CountiesList);
            }
        }

        //[HttpPost]
        //public ActionResult SearchForServices(FormCollection form)
        //{
        //    List<SeviceListing> result = new List<SeviceListing>();
        //    string serviceName = form["txtServiceName"];
        //    string postCodeTown = form["txtTown"];
        //    Decimal id = Convert.ToDecimal(Request.QueryString["serviceId"]);
        //    bool IsApproved = true;

        //        ViewBag.ServiceName = serviceName;
        //        ViewBag.funeralId = id;
        //        int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.Town.Equals(postCodeTown) && x.IsApproved == IsApproved).Count();
        //        ViewBag.TotalServiceCount = TotalServiceCount;
        //        var towns = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.IsApproved == IsApproved && x.Town == postCodeTown).Take(3).ToList();

        //        if (towns.Count != 0)
        //        {
        //            int ServiceCount = towns.Count;
        //            ViewBag.ServiceCount = ServiceCount;
        //            ViewBag.TownName = towns.Select(x => x.Town).FirstOrDefault();
        //            return View(towns);
        //        }

        //    return View(result);
        //}

        //[HttpPost]
        //public ActionResult SearchForServices(FormCollection form)
        //{
        //    List<SeviceListing> result = new List<SeviceListing>();
        //    string serviceName = form["txtServiceName"];
        //    string postCodeTown = form["txtPostCodeTown"];
        //    Decimal id = new FuneralServicesRepository().FirstOrDefault(x=>x.Name.ToLower()== serviceName.ToLower()).Id;
        //    //Decimal id = Convert.ToDecimal(Request.QueryString["serviceId"]);
        //    bool IsApproved = false;
        //    var status = new ServiceListingApprovalRepository().FirstOrDefault();
        //    if (status != null)
        //    {
        //        if (status.Status == true)
        //        {
        //            IsApproved = true;

        //        }

        //        ViewBag.ServiceName = serviceName;
        //        ViewBag.funeralId = id;
        //        int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.Town.Equals(postCodeTown) && x.IsApproved == IsApproved).Count();
        //        ViewBag.TotalServiceCount = TotalServiceCount;
        //        var towns = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.IsApproved == IsApproved && x.Town == postCodeTown).Take(3).ToList();
        //        var postcodes = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.IsApproved == IsApproved && x.PostCode == postCodeTown).Take(3).ToList();
        //        var counties = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.IsApproved == IsApproved && x.County == postCodeTown).Take(3).ToList();
        //        var countries = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.IsApproved == IsApproved && x.Country == postCodeTown).Take(3).ToList();

        //        if (towns.Count != 0)
        //        {
        //            int ServiceCount = towns.Count;
        //            ViewBag.ServiceCount = ServiceCount;
        //            ViewBag.TownName = towns.Select(x => x.Town).FirstOrDefault();
        //            return View(towns);
        //        }
        //        else if (postcodes.Count != 0)
        //        {
        //            int ServiceCount = postcodes.Count;
        //            ViewBag.ServiceCount = ServiceCount;
        //            ViewBag.PostCode = postcodes.Select(x => x.PostCode).FirstOrDefault();
        //            return View(postcodes);
        //        }
        //        else if (counties.Count != 0)
        //        {
        //            int ServiceCount = counties.Count;
        //            ViewBag.ServiceCount = ServiceCount;
        //            ViewBag.CountyName = counties.Select(x => x.County).FirstOrDefault();
        //            return View(counties);
        //        }
        //        else if (countries.Count != 0)
        //        {
        //            int ServiceCount = countries.Count;
        //            ViewBag.ServiceCount = ServiceCount;
        //            ViewBag.CountryName = countries.Select(x => x.Country).FirstOrDefault();
        //            return View(countries);
        //        }

        //    }

        //    return View(result);
        //}
        [HttpPost]
        public ActionResult SearchService(FormCollection form)
        {
            Decimal id;
            List<SeviceListing> result = new List<SeviceListing>();
            string serviceName = form["txtServiceName"];
            string postCodeTown = form["txtPostCodeTown"];
            if (Request.QueryString["serviceId"] == "" || Request.QueryString["serviceId"] == null)
            {
                var obj = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower().Trim().Contains(serviceName.ToLower()));
                if (obj != null)
                {
                    id = obj.Id;
                }
                else
                {
                    id = 0;
                }
            }
            else
            {
                id = Convert.ToDecimal(Request.QueryString["serviceId"]);
            }

            bool IsApproved = true;

            ViewBag.ServiceName = serviceName;
            ViewBag.funeralId = id;
            if (string.IsNullOrEmpty(postCodeTown))
            {
                postCodeTown = "nationwide";
            }
            if (postCodeTown.ToLower() == "nationwide")
            {
                var Nationwide = new ServiceListingRepository().GetAll(x => x.ServiceListingPlans.Where(c=>c.BusinessId == id).Count() > 0 && x.IsApproved == IsApproved && x.NationWide == true).OrderByDescending(x => x.Id).Take(3).ToList();
                if (Nationwide.Count != 0)
                {
                    NationwideSearch(Nationwide, id, postCodeTown, IsApproved);
                    return View(Nationwide);
                }
            }
            var towns = new ServiceListingRepository().GetAll(x => x.ServiceListingPlans.Where(c => c.BusinessId == id).Count() > 0 && x.IsApproved == IsApproved && x.ServiceListingPlans.Where(v=>v.County.Towns.Where(m=>m.Name.ToLower().Trim().Contains(postCodeTown.ToLower().Trim())).Count() > 0).Count() > 0).OrderByDescending(x => x.Id).Take(3).ToList();
            if (towns.Count != 0)
            {
                Towns(towns, id, postCodeTown, IsApproved);
                var townFeatured = towns.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position != null).Count() > 0).ToList();
                ViewBag.Featured = towns.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position)).Take(3).ToList();
                towns = towns.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position == null).Count() > 0).OrderByDescending(c=>c.Id).ToList();
                return View(towns);
            }
            var postcodes = new ServiceListingRepository().GetAll(x => x.ServiceListingPlans.Where(c => c.BusinessId == id).Count() > 0 && x.IsApproved == IsApproved && x.PostCode == postCodeTown && x.CountiesName.Contains(x.County)).OrderByDescending(x => x.Id).Take(3).ToList();
            if (postcodes.Count != 0)
            {
                PostCode(postcodes, id, postCodeTown, IsApproved);
                var postCodeFeatured = postcodes.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position != null).Count() > 0).ToList();
                ViewBag.Featured = postCodeFeatured.OrderBy(c=>c.ServiceListingPlans.Select(v=>v.PartnerPlan.Position)).Take(3).ToList();
                postcodes = postcodes.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position == null).Count() > 0).OrderByDescending(c => c.Id).ToList();
                return View(postcodes);
            }

            var counties = new ServiceListingRepository().GetAll(x => x.ServiceListingPlans.Where(c => c.BusinessId == id).Count() > 0 && x.IsApproved == IsApproved && x.ServiceListingPlans.Where(c=>c.County.Name.ToLower().Trim().Contains(postCodeTown.ToLower().Trim())).Count() > 0).OrderByDescending(x => x.Id).Take(3).ToList();
            if (counties.Count != 0)
            {
                Counties(counties, id, postCodeTown, IsApproved);
                var countiesFeatured = counties.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position != null).Count() > 0).ToList();
                ViewBag.Featured = countiesFeatured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position)).Take(3).ToList();
                counties = counties.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position == null).Count() > 0).OrderByDescending(c => c.Id).ToList();
                return View(counties);
            }
            var countries = new ServiceListingRepository().GetAll(x => x.ServiceListingPlans.Where(c => c.BusinessId == id).Count() > 0 && x.IsApproved == IsApproved && x.Country.ToLower().Trim().Contains(postCodeTown.ToLower().Trim())).OrderByDescending(x => x.Id).Take(3).ToList();
            if (countries.Count != 0)
            {
                Countries(countries, id, postCodeTown, IsApproved);
                var countriesFeatured = countries.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position != null).Count() > 0).ToList();
                ViewBag.Featured = countriesFeatured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position)).Take(3).ToList();
                countries = countries.Where(c => c.ServiceListingPlans.Where(v => v.PartnerPlan.Position == null).Count() > 0).OrderByDescending(c => c.Id).ToList();
                return View(countries);
            }
            return View(result);
        }
        public void NationwideSearch(List<SeviceListing> nationwide, Decimal id, string postCodeTown, bool IsApproved)
        {
            int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.NationWide==true && x.IsApproved == IsApproved).Count();
            ViewBag.TotalServiceCount = TotalServiceCount;
            int ServiceCount = nationwide.Count;
            ViewBag.ServiceCount = ServiceCount;
            ViewBag.CountryName = postCodeTown;

        }
        public void Towns(List<SeviceListing> towns, Decimal id, string postCodeTown, bool IsApproved)
        {
            int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.Town.Contains(postCodeTown) && x.IsApproved == IsApproved).Count();
            ViewBag.TotalServiceCount = TotalServiceCount;
            int ServiceCount = towns.Count;
            ViewBag.ServiceCount = ServiceCount;
            ViewBag.TownName = postCodeTown;

        }
        public void PostCode(List<SeviceListing> postcodes, Decimal id, string postCodeTown, bool IsApproved)
        {
            int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.PostCode.Equals(postCodeTown) && x.IsApproved == IsApproved && x.CountiesName.Contains(x.County)).Count();
            ViewBag.TotalServiceCount = TotalServiceCount;
            int ServiceCount = postcodes.Count;
            ViewBag.ServiceCount = ServiceCount;
            ViewBag.PostCode = postcodes.Select(x => x.PostCode).FirstOrDefault();
        }
        public void Counties(List<SeviceListing> counties, Decimal id, string postCodeTown, bool IsApproved)
        {
            int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.CountiesName.Contains(postCodeTown) && x.IsApproved == IsApproved).Count();
            ViewBag.TotalServiceCount = TotalServiceCount;
            int ServiceCount = counties.Count;
            ViewBag.ServiceCount = ServiceCount;
            ViewBag.CountyName = counties.Select(x => x.County).FirstOrDefault();
        }
        public void Countries(List<SeviceListing> countries, Decimal id, string postCodeTown, bool IsApproved)
        {
            int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == id && x.Country.Equals(postCodeTown) && x.IsApproved == IsApproved).Count();
            ViewBag.TotalServiceCount = TotalServiceCount;
            int ServiceCount = countries.Count;
            ViewBag.ServiceCount = ServiceCount;
            ViewBag.CountryName = countries.Select(x => x.Country).FirstOrDefault();
        }

        public JsonResult GetTownsList(string Prefix)
        {
            var list = new TownsRepositoy().GetAll(c => c.Name.ToLower().Contains(Prefix.ToLower()));
            var tempList = new List<tempTownsList>();
            foreach (var item in list)
            {
                var obj = new tempTownsList();
                obj.Id = item.Id + "";
                obj.Name = item.Name;
                tempList.Add(obj);
            }
            return Json(tempList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAddressList(string Prefix)
        {
            var postCodeResult = new PostCodeRepository().GetAll().AsQueryable();
            var postCode = postCodeResult.Where(x => x.Code.ToLower().Contains(Prefix.ToLower()));
            var postCode1 = new PostCodeRepository().GetAll(p => p.Code.ToLower().Contains(Prefix.ToLower()));
            var town = new TownsRepositoy().GetAll(t => t.Name.ToLower().Contains(Prefix.ToLower()));
            var county = new CountyRepository().GetAll(c => c.Name.ToLower().Contains(Prefix.ToLower()));
            var country = new CountryRepository().GetAll(c => c.Name.ToLower().Contains(Prefix.ToLower()));
            var tempList = new List<tempSearchAddress>();

            if (postCode1.Count != 0)
            {
                foreach (var item in postCode1)
                {
                    var obj = new tempSearchAddress();
                    obj.Id = item.Id + "";
                    obj.Name = item.Code;
                    tempList.Add(obj);
                }

            }
            else if (town.Count != 0)
            {
                foreach (var item in town)
                {
                    var obj = new tempSearchAddress();
                    obj.Id = item.Id + "";
                    obj.Name = item.Name;
                    tempList.Add(obj);
                }
            }
            else if (county.Count != 0)
            {
                foreach (var item in county)
                {
                    var obj = new tempSearchAddress();
                    obj.Id = item.Id + "";
                    obj.Name = item.Name;
                    tempList.Add(obj);
                }

            }
            else if (country.Count != 0)
            {
                foreach (var item in country)
                {
                    var obj = new tempSearchAddress();
                    obj.Id = item.Id + "";
                    obj.Name = item.Name;
                    tempList.Add(obj);
                }
            }

            return Json(tempList, JsonRequestBehavior.AllowGet);
        }

    }
    class tempSearchAddress
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
    class tempTownsList
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
}

