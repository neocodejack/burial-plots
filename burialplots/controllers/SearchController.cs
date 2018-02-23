using BurialPlots.DAL;
using NHunspell;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
        //public ActionResult SearchService(FormCollection form)
        //{
        //    decimal countyID = 0;
        //    string serviceName = form["txtServiceName"];
        //    string postCodeTown = form["txtPostCodeTown"];
        //    if (string.IsNullOrEmpty(serviceName))
        //    {
        //        serviceName = "ffffffggggggghhhhhhh";
        //    }
        //    if (string.IsNullOrEmpty(postCodeTown))
        //    {
        //        postCodeTown = "fffffffffffgggggggggggghhhhhhhhhhh";
        //    }
        //    var services = serviceName.Split(' ');
        //    var list = new ServiceListingRepository().GetAll(c => c.BusinessName.ToLower().Contains(serviceName.ToLower()) || c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(serviceName.ToLower())).Count() > 0).ToList();
        //    for (int i = 0; i < services.Length; i++)
        //    {
        //        var val = services[i];
        //        if (val.ToLower() != "in")
        //        {
        //            var list2 = new ServiceListingRepository().GetAll(c => c.BusinessName.ToLower().Contains(val.ToLower()) ||
        //        c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //        c.BusinessDescription.ToLower().Contains(val.ToLower())).ToList();
        //            list = list.Union(list2.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
        //        }
        //    }
        //    var towns = postCodeTown.Split(' ');
        //    var townList = new List<SeviceListing>();
        //    if (!string.IsNullOrEmpty(postCodeTown))
        //    {
        //        townList = list.Where(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0).ToList();
        //        var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(postCodeTown.ToLower()) ||
        //        c.Country.Name.ToLower().Contains(postCodeTown.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //        c.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0);
        //        if (county != null)
        //        {
        //            countyID = county.Id;
        //        }
        //    }
        //    for (int i = 0; i < towns.Length; i++)
        //    {
        //        var val = towns[i];
        //        var townList2 = list.Where(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0).ToList();
        //        townList = townList.Union(townList2.Where(c => !townList.Any(x => x.Id == c.Id))).ToList();
        //        if (countyID == 0)
        //        {
        //            var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(val.ToLower()) ||
        //        c.Country.Name.ToLower().Contains(val.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //        c.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0);
        //            if (county != null)
        //            {
        //                countyID = county.Id;
        //            }
        //        }
        //    }
        //    var townList3 = new List<SeviceListing>();
        //    for (int i = 0; i < services.Length; i++)
        //    {
        //        var val = services[i];
        //        if (val.ToLower() != "in")
        //        {
        //            var townList2 = list.Where(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0);
        //            townList3 = townList3.Union(townList2.Where(c => !townList3.Any(x => x.Id == c.Id))).ToList();
        //            if (countyID == 0)
        //            {
        //                var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(val.ToLower()) ||
        //            c.Country.Name.ToLower().Contains(val.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //            c.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0);
        //                if (county != null)
        //                {
        //                    countyID = county.Id;
        //                }
        //            }
        //        }
        //    }
        //    //var mainList = list.Union(townList.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
        //    var mainList = townList.Union(townList3.Where(c => !townList.Any(x => x.Id == c.Id))).ToList();
        //    var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
        //    if (featured.Count() > 0)
        //    {
        //        featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
        //        ViewBag.Featured = featured;
        //    }
        //    else
        //    {
        //        ViewBag.Featured = new List<SeviceListing>();
        //    }
        //    mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
        //    mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
        //    //ViewBag.Featured = new List<SeviceListing>();
        //    return View(mainList);
        //}

        //////////////////Second Method//////////////////////////////////////
        //[HttpPost]
        //public ActionResult SearchService(FormCollection form)
        //{
        //    decimal countyID = 0;
        //    string serviceName = form["txtServiceName"];
        //    string postCodeTown = form["txtPostCodeTown"];
        //    if (string.IsNullOrEmpty(serviceName))
        //    {
        //        serviceName = "ffffffggggggghhhhhhh";
        //    }
        //    if (string.IsNullOrEmpty(postCodeTown))
        //    {
        //        postCodeTown = "fffffffffffgggggggggggghhhhhhhhhhh";
        //    }
        //    var services = serviceName.Split(' ');
        //    //var list = new ServiceListingRepository().GetAll(c => c.BusinessName.ToLower().Contains(serviceName.ToLower()) || c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(serviceName.ToLower())).Count() > 0).ToList();
        //    var list = new ServiceListingRepository().GetAll(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0).ToList();
        //    for (int i = 0; i < services.Length; i++)
        //    {
        //        var val = services[i];
        //        if (val.ToLower() != "in")
        //        {
        //            var townList2 = new ServiceListingRepository().GetAll(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0 ||
        //    c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0);
        //            list = list.Union(townList2.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
        //            if (countyID == 0)
        //            {
        //                var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(val.ToLower()) ||
        //            c.Country.Name.ToLower().Contains(val.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //            c.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0);
        //                if (county != null)
        //                {
        //                    countyID = county.Id;
        //                }
        //            }
        //        }
        //    }

        //    var towns = postCodeTown.Split(' ');
        //    var townList = new List<SeviceListing>();
        //    //if (!string.IsNullOrEmpty(postCodeTown))
        //    //{
        //    //    townList = list.Where(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    //c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    //c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0 ||
        //    //c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0).ToList();
        //    //    var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(postCodeTown.ToLower()) ||
        //    //    c.Country.Name.ToLower().Contains(postCodeTown.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
        //    //    c.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0);
        //    //    if (county != null)
        //    //    {
        //    //        countyID = county.Id;
        //    //    }
        //    //}
        //    if (!string.IsNullOrEmpty(form["txtPostCodeTown"]))
        //    {
        //        for (int i = 0; i < towns.Length; i++)
        //        {
        //            var val = towns[i];
        //            var townList2 = list.Where(c => c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //        c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //        c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0 ||
        //        c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0).Count() > 0).ToList();
        //            townList = townList.Union(townList2.Where(c => !townList.Any(x => x.Id == c.Id))).ToList();
        //            if (countyID == 0)
        //            {
        //                var county = new CountyRepository().FirstOrDefault(c => c.Name.ToLower().Contains(val.ToLower()) ||
        //            c.Country.Name.ToLower().Contains(val.ToLower()) || c.Towns.Where(m => m.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //            c.PostCodes.Where(m => m.Code.ToLower().Contains(val.ToLower())).Count() > 0);
        //                if (county != null)
        //                {
        //                    countyID = county.Id;
        //                }
        //            }
        //        }
        //    }
        //    else
        //    {
        //        townList = list.ToList();
        //    }

        //    var townList3 = townList.Where(c => c.BusinessName.ToLower().Contains(serviceName.ToLower()) || c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(serviceName.ToLower())).Count() > 0).ToList();
        //    for (int i = 0; i < services.Length; i++)
        //    {
        //        var val = services[i];
        //        if (val.ToLower() != "in")
        //        {
        //            var list2 = townList.Where(c => c.BusinessName.ToLower().Contains(val.ToLower()) ||
        //        c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(val.ToLower())).Count() > 0 ||
        //        c.BusinessDescription.ToLower().Contains(val.ToLower())).ToList();
        //            townList3 = townList3.Union(list2.Where(c => !townList3.Any(x => x.Id == c.Id))).ToList();
        //        }
        //    }
        //    //var mainList = list.Union(townList.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
        //    //var mainList = townList.Union(townList3.Where(c => !townList.Any(x => x.Id == c.Id))).ToList();
        //    var mainList = townList3.ToList();
        //    var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
        //    if (featured.Count() > 0)
        //    {
        //        featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
        //        ViewBag.Featured = featured;
        //    }
        //    else
        //    {
        //        ViewBag.Featured = new List<SeviceListing>();
        //    }
        //    mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
        //    mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
        //    //ViewBag.Featured = new List<SeviceListing>();
        //    return View(mainList);
        //}

        //////////////////////////third Method/////////////////////////////
        [HttpPost]
        public ActionResult SearchService(FormCollection form)
        {
            string serviceName = form["txtServiceName"];
            string postCodeTown = form["txtPostCodeTown"];
            var todayDate = DateTime.Now.Date;
            ///////////// 1st condition
            if (string.IsNullOrEmpty(postCodeTown) && !string.IsNullOrEmpty(serviceName))
            {
                var services = serviceName.Split(' ');
                var list = new List<SeviceListing>();
                foreach (var item in services)
                {
                    if (item.ToLower() != "in")
                    {
                        var chk = new CountryRepository().FirstOrDefault(c => c.Name.ToLower().Contains(item.ToLower()) ||
                    c.Counties.Where(x => x.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                    c.Counties.Where(x => x.Towns.Where(v => v.Name.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0 ||
                    c.Counties.Where(x => x.PostCodes.Where(v => v.Code.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0);
                        if (chk == null)
                        {
                            var listTemp = new ServiceListingRepository().GetAll(c => (c.BusinessName.ToLower().Contains(item.ToLower()) ||
                                 c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                                 c.BusinessDescription.ToLower().Contains(item.ToLower())) && c.ServiceListingPlans.Where(x=> x.ExpiryDate != null && x.ExpiryDate >= todayDate).Count() > 0);
                            list = list.Union(listTemp.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
                        }
                    }
                }
                foreach (var item in services)
                {
                    if (item.ToLower() != "in")
                    {
                        var chk = new CountryRepository().FirstOrDefault(c => c.Name.ToLower().Contains(item.ToLower()) ||
                    c.Counties.Where(x => x.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                    c.Counties.Where(x => x.Towns.Where(v => v.Name.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0 ||
                    c.Counties.Where(x => x.PostCodes.Where(v => v.Code.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0);
                        if (chk != null)
                        {
                            list = list.Where(c => (c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0) && c.ServiceListingPlans.Where(x => x.ExpiryDate != null && x.ExpiryDate >= todayDate).Count() > 0).ToList();
                        }
                    }
                }
                var mainList = list.ToList();
                var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
                if (featured.Count() > 0)
                {
                    featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
                    ViewBag.Featured = featured;
                }
                else
                {
                    ViewBag.Featured = new List<SeviceListing>();
                }
                mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
                mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
                return View(mainList);
            }
            ///////////2nd condition
            if (!string.IsNullOrEmpty(postCodeTown) && !string.IsNullOrEmpty(serviceName))
            {
                var services = serviceName.Split(' ');
                var list = new List<SeviceListing>();
                foreach (var item in services)
                {
                    if (item.ToLower() != "in")
                    {
                        var chk = new CountryRepository().FirstOrDefault(c => c.Name.ToLower().Contains(item.ToLower()) ||
                    c.Counties.Where(x => x.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                    c.Counties.Where(x => x.Towns.Where(v => v.Name.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0 ||
                    c.Counties.Where(x => x.PostCodes.Where(v => v.Code.ToLower().Contains(item.ToLower())).Count() > 0).Count() > 0);
                        if (chk == null)
                        {
                            var listTemp = new ServiceListingRepository().GetAll(c => (c.BusinessName.ToLower().Contains(item.ToLower()) ||
                                 c.ServiceListingPlans.Where(x => x.FuneralService.Name.ToLower().Contains(item.ToLower())).Count() > 0 ||
                                 c.BusinessDescription.ToLower().Contains(item.ToLower())) && c.ServiceListingPlans.Where(x => x.ExpiryDate != null && x.ExpiryDate >= todayDate).Count() > 0);
                            list = list.Union(listTemp.Where(c => !list.Any(x => x.Id == c.Id))).ToList();
                        }
                    }
                }
                list = list.Where(c => (c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0) && c.ServiceListingPlans.Where(x => x.ExpiryDate != null && x.ExpiryDate >= todayDate).Count() > 0).ToList();
                var mainList = list.ToList();
                var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
                if (featured.Count() > 0)
                {
                    featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
                    ViewBag.Featured = featured;
                }
                else
                {
                    ViewBag.Featured = new List<SeviceListing>();
                }
                mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
                mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
                return View(mainList);
            }
            //////////////////3rd Condition
            if (!string.IsNullOrEmpty(postCodeTown) && string.IsNullOrEmpty(serviceName))
            {
                var list = new ServiceListingRepository().GetAll(c => (c.ServiceListingPlans.Where(x => x.County.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Country.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.Towns.Where(m => m.Name.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0 ||
                                   c.ServiceListingPlans.Where(x => x.County.PostCodes.Where(m => m.Code.ToLower().Contains(postCodeTown.ToLower())).Count() > 0).Count() > 0) && c.ServiceListingPlans.Where(x => x.ExpiryDate != null && x.ExpiryDate >= todayDate).Count() > 0).ToList();
                var mainList = list.ToList();
                var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
                if (featured.Count() > 0)
                {
                    featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
                    ViewBag.Featured = featured;
                }
                else
                {
                    ViewBag.Featured = new List<SeviceListing>();
                }
                mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
                mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
                return View(mainList);
            }
            else
            {
                var mainList = new List<SeviceListing>();
                var featured = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position != null).Count() > 0).ToList();
                if (featured.Count() > 0)
                {
                    featured = featured.OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position != null).Min()).OrderBy(c => c.ServiceListingPlans.Select(v => v.PartnerPlan.Position).Min()).Take(3).ToList();
                    ViewBag.Featured = featured;
                }
                else
                {
                    ViewBag.Featured = new List<SeviceListing>();
                }
                mainList = mainList.Where(c => c.ServiceListingPlans.Where(x => x.PartnerPlan.Position == null).Count() > 0).ToList();
                mainList = mainList.Where(c => featured.FirstOrDefault(v => v.Id == c.Id) == null).ToList();
                return View(mainList);
            }
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

