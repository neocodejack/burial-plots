using BurialPlots.DAL;
using BurialPlots.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Reflection;
using System.Threading;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Controllers
{
    public class HomeController : Controller
    {
        public static int serviceCount = 0;
        public int ServiceCount
        {
            set
            {
                serviceCount = value;
            }
            get
            {
                return serviceCount;
            }
        }
        
        public ActionResult ErrorPage()
        {
            return View();
        }
        public ActionResult PaymentTest()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult PartnerRegister()
        {
            if (Session["memId"] != null)
            {
                return RedirectToAction("GetListed");
            }
            else
            {
                return View();
            }
        }
        public PartialViewResult loadmenu()
        {
            var menu = new MenuRepository().GetAll();
            var sub = new Submenurepo().GetAll();
            var subchild = new SubChlidMenuRepository().GetAll();
            ViewBag.menu = menu;
            ViewBag.sub = sub;
            ViewBag.subchild = subchild;
            return PartialView("~/Views/Home/_loadmenu.cshtml");

        }
        public ActionResult Cemetery()
        {
            if (Session["cmemId"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("LoginSignup", "Home");
            }

        }
        public ActionResult GetListed()
        {
            if (Session["memId"] != null)
            {
                ViewBag.Counties = new CountyRepository().GetAll();
                ViewBag.FuneralServices = new FuneralServicesRepository().GetAll();
                ViewBag.Plans = new PartnerPlanRepository().GetAll();
                return View();
            }
            else
            {
                return RedirectToAction("PartnerRegister", "Home");
            }

        }
        // Get Address from PostCode
        [HttpPost]
        public async System.Threading.Tasks.Task<string> GetAddress(string postCode)
        {
            HttpClient client = new HttpClient();
            string addressApi = ConfigurationManager.AppSettings["AddressApiKey"];
            string Url = "https://api.getaddress.io/v2/uk/";
            client.BaseAddress = new Uri(Url);
            // Add an Accept header for JSON format.
            client.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync(postCode + "?api-key=" + addressApi).Result;
            string data = "false";
            if (response.IsSuccessStatusCode)
            {
                data = await response.Content.ReadAsStringAsync();
                //var apiAddress = new JavaScriptSerializer().Deserialize<tempApiStatus>(data);

            }
            return data;
        }


        [HttpPost]
        public string SaveServiceListing(string PaymentGateways, string TwitterLink, string GooglePlusLink, string FacebookLink,
            string BusinessDescription, string businessName, string ServicesAndProducts, string postCode, string address, string phNo,
            string website, string businessClass, string adress2, string Country, string County, string Town, string Address1, string number,
            string Longitude, string Latitude, string planIds)
        {
            Decimal mId = Convert.ToDecimal(Session["memId"]);
            var status = new ServiceListingApprovalRepository().FirstOrDefault().Status;
            var obj = new ServiceListingModel();
            obj.Address = address;
            obj.BusinessName = businessName;
            obj.PhoneNo = phNo;
            obj.PostCode = postCode;
            obj.Website = website;
            obj.Address1 = Address1;
            obj.Address2 = adress2;
            obj.Country = Country;
            obj.Number = number;
            obj.County = County;
            obj.Town = Town;
            obj.Latitude = Latitude;
            obj.Longitude = Longitude;
            obj.PaymentGateways = PaymentGateways;
            obj.ServicesAndProducts = ServicesAndProducts;
            obj.BusinessDescription = BusinessDescription;
            obj.FacebookLink = FacebookLink;
            obj.GooglePlusLink = GooglePlusLink;
            obj.TwitterLink = TwitterLink;
            obj.PartnerId = mId + "";
            obj.IsApproved = status.ToString();
            obj.BusinessPlan = new JavaScriptSerializer().Deserialize<List<BusinessPlanModel>>(planIds);
            var amount = obj.BusinessPlan.Sum(c => Convert.ToDecimal(c.PlanPrice));
            if (amount > 0)
            {
                var aa = new JavaScriptSerializer();
                Session["ServiceList"] = aa.Serialize(obj);
                if (Session["ServiceList"] != null)
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
                var sobj = new SeviceListing();
                sobj.Address = address;
                sobj.BusinessName = businessName;
                sobj.PhoneNo = phNo;
                sobj.PostCode = postCode;
                sobj.Website = website;
                sobj.Address1 = Address1;
                sobj.Address2 = adress2;
                sobj.Country = Country;
                sobj.Number = number;
                sobj.County = County;
                sobj.Town = Town;
                sobj.Latitude = Latitude;
                sobj.Longitude = Longitude;
                sobj.PaymentGateways = PaymentGateways;
                sobj.ServicesAndProducts = ServicesAndProducts;
                sobj.BusinessDescription = BusinessDescription;
                sobj.FacebookLink = FacebookLink;
                sobj.GooglePlusLink = GooglePlusLink;
                sobj.TwitterLink = TwitterLink;
                var f = new ServiceListingRepository().Add(sobj);
                if (f)
                {
                    foreach (var item in obj.BusinessPlan)
                    {
                        var bPlan = new ServiceListingPlan();
                        bPlan.BusinessId = Convert.ToDecimal(item.business);
                        bPlan.CountyId = Convert.ToDecimal(item.county);
                        bPlan.PlanId = Convert.ToDecimal(item.plan);
                        bPlan.ServiceListId = sobj.Id;
                        var m = new ServiceListingPlanRepository().Add(bPlan);
                    }
                    return "add";
                }
                else
                {
                    return "false";
                }
            }
        }

        public JsonResult GetServicesList(string Prefix)
        {
            var list = new FuneralServicesRepository().GetAll(c => c.Name.ToLower().Contains(Prefix.ToLower()));
            var tempList = new List<tempFuneralServices>();
            foreach (var item in list)
            {
                var obj = new tempFuneralServices();
                obj.Id = item.Id + "";
                obj.Name = item.Name;
                tempList.Add(obj);
            }
            return Json(tempList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LoginSignup()
        {
            ViewBag.RecapthaKey = ConfigurationManager.AppSettings["captchKey"].ToString();
            return View();
        }

        [HttpPost]
        public string Signup(string fname, string lname, string email, string cellno, string password)
        {
            var obj = new Member1();
            obj.Fname = fname;
            obj.Lname = lname;
            obj.Password = password;
            obj.Email = email;
            obj.CellNo = cellno;
            obj.Active = false;
            obj.Role = "Customer";
            var encEmail = new DataEncryptor().Encrypt(obj.Email);
            var ck = new MemberRepository().FirstOrDefault(c => c.Email == encEmail && c.Role == "Customer");
            if (ck != null)
            {
                return "exist";
            }
            else
            {
                obj.Email = new DataEncryptor().Encrypt(obj.Email);
                obj.CellNo = new DataEncryptor().Encrypt(obj.CellNo);
                var f = new MemberRepository().Add(obj);
                if (f)
                {
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];
                    string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                    string emailPwd = ConfigurationManager.AppSettings["SmtpPassword"];
                    string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                    var appUrl = Request.Url.AbsoluteUri.Replace("Signup", "Verification?code=" + obj.Id);

                    var message = new MailMessage();
                    message.To.Add(new MailAddress(email));
                    message.From = new MailAddress(fromEmail);  // replace with valid value
                    message.Subject = "Your registration with Burial Plots";
                    message.IsBodyHtml = true;
                    message.Body = "Dear " + fname + ",<br/><br/> Thank you for your registration with Burial Plots .<br/><br/>";
                    message.Body += "<p>Please <a href='" + appUrl + "'>click here</a> to verify your account.</p>";
                    message.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                    SendEmail(message.Body, message.Subject, email, fromEmail, emailPwd, ssl, MailHostServer, port);
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
        }
        public string SignupPartner(string fname, string lname, string email, string cellno, string password)
        {
            var obj = new Partner();
            obj.Fname = fname;
            obj.Lname = lname;
            obj.Password = password;
            obj.Email = email;
            obj.CellNo = cellno;
            obj.Active = false;
            obj.Role = "Partner";
            var encEmail = new DataEncryptor().Encrypt(obj.Email);
            var ck = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail && c.Role == "Partner");
            if (ck != null)
            {
                return "exist";
            }
            else
            {
                obj.Email = new DataEncryptor().Encrypt(obj.Email);
                obj.CellNo = new DataEncryptor().Encrypt(obj.CellNo);
                var f = new PartnerRepository().Add(obj);
                if (f)
                {
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];
                    string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                    var appUrl = Request.Url.AbsoluteUri.Replace("SignupPartner", "PartnerMessage?code=" + obj.Id);
                    string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                    string emailPwd = ConfigurationManager.AppSettings["SmtpPassword"];
                    var message = new MailMessage();

                    message.To.Add(new MailAddress(email));
                    message.From = new MailAddress(fromEmail);  // replace with valid value
                    message.Subject = "Your registration with Burial Plots";
                    message.IsBodyHtml = true;
                    message.Body = "Dear " + fname + ",<br/><br/> Thank you for your registration as partner with Burial Plots .<br/><br/>";
                    message.Body += "<p>Please <a href='" + appUrl + "'>click here</a> to verify your account.</p>";
                    message.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                    SendEmail(message.Body, message.Subject, email, fromEmail, emailPwd, ssl, MailHostServer, port);
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
        }

        public ActionResult Verification(string code)
        {
            var obj = new MemberRepository().GetById(Convert.ToDecimal(code));
            if (obj != null)
            {
                obj.Active = true;
                new MemberRepository().Update(obj);
            }
            return View();
        }

        public string Login(string email, string password, string role)
        {
            if (role == "Partner")
            {
                var encEmail = new DataEncryptor().Encrypt(email);
                var chk = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail && c.Password == password);
                if (chk != null)
                {
                    if (chk.Active == true)
                    {

                        Session["memId"] = chk.Id;
                        Session["memEmail"] = email;
                        Session["memFirstName"] = chk.Fname;
                        Session["Role"] = chk.Role;

                    }
                    else
                    {
                        return "verify";
                    }


                }
                else
                {
                    return "false";
                }
                return "true";

            }
            else if (role == "Customer")
            {
                var encEmail = new DataEncryptor().Encrypt(email);
                var chk = new MemberRepository().FirstOrDefault(c => c.Email == encEmail && c.Password == password);
                if (chk != null)
                {
                    if (chk.Active == true)
                    {
                        if (chk.Role == "Customer")
                        {
                            Session["cmemId"] = chk.Id;
                            Session["cmemEmail"] = email;
                            Session["cmemFirstName"] = chk.Fname;
                            Session["cmemLastName"] = chk.Lname;
                            Session["Role"] = chk.Role;
                            return "true";

                        }
                        else
                        {
                            return "verify";
                        }


                    }
                    else
                    {
                        return "verify";
                    }

                }
                return "false";
            }

            else
            {

                return "exist";
            }
        }

        public void CheckRemainingService(int totalCreatedListCounts, int totalServiceListCount)
        {
            if (totalCreatedListCounts >= totalServiceListCount)
            {
                ServiceCount = 0;
            }
        }
        public int CountServiceListing(int count)
        {
            ServiceCount = ServiceCount + count;
            return ServiceCount;
        }
        [HttpPost]
        public PartialViewResult LoadService(int serviceCount, string FId, string TownName, string PostCode, string CountyName, string CountryName)
        {
            var funeralId = Convert.ToDecimal(FId);
            ViewBag.TownName = TownName;
            ViewBag.PostCode = PostCode;
            ViewBag.CountyName = CountyName;
            ViewBag.CountryName = CountryName;
            ViewBag.funeralId = funeralId;
            bool IsApproved = false;
            ViewBag.ServiceName = new FuneralServicesRepository().GetById(funeralId).Name;
            List<SeviceListing> listing = new List<SeviceListing>();
            IsApproved = true;
            if (TownName != null && TownName != "")
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Town.Contains(TownName) && x.IsApproved == IsApproved).Count();
                int sCount = CountServiceListing(serviceCount);
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Town.Contains(TownName) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Skip(3).Take(sCount).ToList();
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = serviceCount;
                int totalCreatedListCounts = sCount + serviceCount;
                ViewBag.CheckServiceCount = sCount + serviceCount;
                CheckRemainingService(totalCreatedListCounts, TotalServiceCount);

            }

            else if (PostCode != null && PostCode != "")
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.PostCode.Equals(PostCode) && x.CountiesName.Contains(x.County) && x.IsApproved == IsApproved).Count();
                int sCount = CountServiceListing(serviceCount);
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.PostCode.Equals(PostCode) && x.CountiesName.Contains(x.County) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Skip(3).Take(sCount).ToList();
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = serviceCount;
                int totalCreatedListCounts = sCount + serviceCount;
                ViewBag.CheckServiceCount = sCount + serviceCount;
                CheckRemainingService(totalCreatedListCounts, TotalServiceCount);

            }
            else if (CountyName != null && CountyName != "")
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.CountiesName.Contains(CountyName) && x.IsApproved == IsApproved).Count();
                int sCount = CountServiceListing(serviceCount);
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.CountiesName.Contains(CountyName) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Skip(3).Take(sCount).ToList();
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = serviceCount;
                int totalCreatedListCounts = sCount + serviceCount;
                ViewBag.CheckServiceCount = sCount + serviceCount;
                CheckRemainingService(totalCreatedListCounts, TotalServiceCount);


            }
            else if (CountryName != null && CountryName != "")
            {
                int TotalServiceCount = 0;
                int sCount = 0;
                if (CountryName.ToLower() == "nationwide")
                {
                    TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.NationWide == true && x.IsApproved == IsApproved).Count();
                    sCount = CountServiceListing(serviceCount);
                    listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.NationWide == true && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Skip(3).Take(sCount).ToList();
                }
                else
                {
                    TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Country.Equals(CountryName) && x.IsApproved == IsApproved).Count();
                    sCount = CountServiceListing(serviceCount);
                    listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Country.Equals(CountryName) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Skip(3).Take(sCount).ToList();
                }

                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = serviceCount;
                int totalCreatedListCounts = sCount + serviceCount;
                ViewBag.CheckServiceCount = sCount + serviceCount;
                CheckRemainingService(totalCreatedListCounts, TotalServiceCount);

            }
            return PartialView("~/Views/Home/_LoadServiceList.cshtml", listing);
        }
        public ActionResult ServiceListing(Decimal id)
        {
            string TownName = Request.QueryString["TownName"];
            string PostCode = Request.QueryString["PostCode"];
            string CountyName = Request.QueryString["CountyName"];
            string CountryName = Request.QueryString["CountryName"];
            Decimal funeralId = id;
            ViewBag.TownName = TownName;
            ViewBag.PostCode = PostCode;
            ViewBag.CountyName = CountyName;
            ViewBag.CountryName = CountryName;
            ViewBag.funeralId = funeralId;

            bool IsApproved = true;
            ViewBag.ServiceName = new FuneralServicesRepository().GetById(id).Name;
            List<SeviceListing> listing = new List<SeviceListing>();

            if (TownName != null)
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Town.Contains(TownName) && x.IsApproved == IsApproved).Count();
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Town.Contains(TownName) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Take(3).ToList();
                int ServiceCount = listing.Count;
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = ServiceCount;
                return View(listing);
            }

            else if (PostCode != null)
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.PostCode.Equals(PostCode) && x.IsApproved == IsApproved && x.CountiesName.Contains(x.County)).Count;
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.PostCode.Equals(PostCode) && x.IsApproved == IsApproved && x.CountiesName.Contains(x.County)).OrderByDescending(x => x.Id).Take(3).ToList();
                int ServiceCount = listing.Count;
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = ServiceCount;
                return View(listing);
            }
            else if (CountyName != null)
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.CountiesName.Contains(CountyName) && x.IsApproved == IsApproved).Count();
                listing = new ServiceListingRepository().GetAll(x => (x.FuneralServiceId == funeralId && x.CountiesName.Contains(CountyName)) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Take(3).ToList();
                int ServiceCount = listing.Count;
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = ServiceCount;
                return View(listing);

            }
            else if (CountryName != null)
            {
                int TotalServiceCount = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Country.Equals(CountryName) && x.IsApproved == IsApproved).Count();
                listing = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == funeralId && x.Country.Equals(CountryName) && x.IsApproved == IsApproved).OrderByDescending(x => x.Id).Take(3).ToList();
                int ServiceCount = listing.Count;
                ViewBag.TotalServiceCount = TotalServiceCount;
                ViewBag.ServiceCount = ServiceCount;
                return View(listing);
            }
            return View(listing);
        }
        public string SubmitReview(string Title, string Description, Decimal Id, Decimal MemberId)
        {
            Review review = new Review();
            review.PartnerId = MemberId;
            review.Description = Description;
            review.ServiceListingId = Id;
            review.Date = DateTime.Now;
            try
            {
                new ReviewsListingRepository().Add(review);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        public string GetLangLongitude(string FId, string TownName, string PostCode, string CountyName, string CountryName)
        {
            var json = "";
            List<SeviceListing> lstServices = new List<SeviceListing>();
            Decimal fId = Convert.ToDecimal(FId);
            try
            {
                if (TownName != "")
                {
                    lstServices = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == fId && x.Town == TownName);
                }
                else if (PostCode != "")
                {
                    lstServices = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == fId && x.PostCode == PostCode);
                }
                else if (CountyName != "")
                {
                    lstServices = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == fId && x.County == CountyName);
                }
                else if (CountryName != "")
                {
                    lstServices = new ServiceListingRepository().GetAll(x => x.FuneralServiceId == fId && x.Country == CountryName);
                }
                var tempList = new List<tempServiceList>();
                foreach (var item in lstServices)
                {
                    var obj = new tempServiceList();
                    obj.BusinessName = item.BusinessName;
                    obj.Latitude = Convert.ToDouble(item.Latitude);
                    obj.Longitude = Convert.ToDouble(item.Longitude);
                    tempList.Add(obj);
                }
                var aa = new JavaScriptSerializer().Serialize(tempList);
                return aa;
            }
            catch (Exception ex)
            {
                return "false";
            }

        }
        [HttpGet]
        public ActionResult PopularLocations()
        {
            var locationId = new CountyRepository().GetAll().Where(_ => _.Name.Equals(Request.QueryString["TownName"])).Select(_ => _.Id).FirstOrDefault().ToString();
            var locationContent = new GenericRepository<PopularLocationContent>().GetAll().Where(_ => _.PopularLocationName.Equals(locationId)).FirstOrDefault();
            //var locations = new FuneralServicesRepository().GetAll();
            //string TownName = Request.QueryString["TownName"];
            //if (TownName != null)
            //{
            //    ViewBag.Name = TownName;
            //}
            ViewBag.IsComingFromPopularLocation = 1;
            return View();
        }
        [HttpPost]
        public PartialViewResult LoadServiceListing()
        {
            var list = new ServiceListingRepository().GetAll();
            return PartialView("~/Views/Home/_LoadServiceListing.cshtml", list);
        }

        public ActionResult DetailServiceListing(Decimal Id)
        {
            Decimal mId = Convert.ToDecimal(Session["cmemId"]);

            //ViewBag.ServiceAddress = serviceAddress;
            var listing = new ServiceListingRepository().GetById(Id);
            if (!string.IsNullOrEmpty(listing.Latitude))
            {
                ViewBag.Latitude = Convert.ToDouble(listing.Latitude);
            }
            else
            {
                ViewBag.Latitude = 51.509865;
            }
            if (!string.IsNullOrEmpty(listing.Longitude))
            {
                ViewBag.Longitude = Convert.ToDouble(listing.Longitude);
            }
            else
            {
                ViewBag.Longitude = -0.118092;
            }

            ViewBag.IsMemberIdExistInReview = new ReviewsListingRepository().FirstOrDefault(m => m.PartnerId == mId && m.ServiceListingId == listing.Id);
            ViewBag.MemberId = mId;
            ViewBag.ServiceId = Id;
            if (listing.PaymentGateways != null)
            {
                var paymentGw = listing.PaymentGateways.Split(',');
                ViewBag.paymentGw = paymentGw;
            }
            if (listing.ServicesAndProducts != null)
            {
                var svAndPro = listing.ServicesAndProducts.Split(' ');
                ViewBag.svAndPro = svAndPro;
            }
            return View(listing);
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("PageView", "Page", new { id = "Index", Area = "Admin" });
        }
        public ActionResult ListingTypes()
        {

            return View();
        }
        public ActionResult PreNeedPlot()
        {
            return View();
        }
        public ActionResult AtNeedPlot()
        {
            return View();
        }
        public ActionResult HelpfullAdvice()
        {
            return View();
        }
        public ActionResult Burialplots()
        {
            return View();
        }
        public ActionResult Message()
        {
            return View();
        }
        public ActionResult PartnerMessage(string code)
        {
            var obj = new PartnerRepository().GetById(Convert.ToDecimal(code));
            if (obj != null)
            {
                obj.Active = true;
                new PartnerRepository().Update(obj);
            }
            return View();
        }

        public ActionResult Testing()
        {
            return View();
        }
        [HttpPost]
        public string ContactUs(string name, string email, string phone, string mess)
        {
            try
            {
                string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                string port = ConfigurationManager.AppSettings["SmtpPort"];
                string defaultemail = ConfigurationManager.AppSettings["SmtpMail"];
                string Password = ConfigurationManager.AppSettings["SmtpPassword"].ToString();
                string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                string adminEmail;
                var emails = new AddAdministrativeEmailRepository().GetAll().Select(c => c.Email);
                if (emails.Count() > 0)
                {
                    adminEmail = string.Join(",", emails);
                }
                else
                {
                    adminEmail = ConfigurationManager.AppSettings["AdminMail"];
                }

                var message = new MailMessage();

                message.From = new MailAddress(defaultemail);  // replace with valid value
                message.Subject = "Burial Plots Contact Form Enquiry";
                message.IsBodyHtml = true;
                message.Body = "Name:" + name;
                message.Body += "<br/><br/>Email:" + email + "<br/><br/>Number:" + phone + "<br/><br/>Message: <br/><br/>" + mess + "";
                SendEmail(message.Body, message.Subject, adminEmail, defaultemail, Password, ssl, MailHostServer, port);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }

        }

        public ActionResult Florist()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "FLORISTS".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult StoneMasons()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "StoneMasons".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult Cars()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Funeral Cars".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult FuneralDirectors()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Funeral Directors".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult WILLWRITING()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Will Writers".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult LIFEINSURANCE()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Insurance".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult COFFINS()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Coffins".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult Solicitors()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Solicitors".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult FuneralPlans()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Funeral Plans".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult Memorials()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Memorials ".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult Headstones()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Headstones".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult Probate()
        {
            var FId = new FuneralServicesRepository().FirstOrDefault(x => x.Name.ToLower() == "Probate".ToLower()).Id;
            ViewBag.Id = FId;
            return View();
        }
        public ActionResult FAQS()
        {
            return View();
        }
        public ActionResult TermsAndConditions()
        {
            return View();
        }
        public ActionResult Picture()
        {
            return View();
        }
        public string Change(String LanguageAbbrevation)
        {
            try
            {
                if (LanguageAbbrevation != null)
                {
                    Session["Language"] = LanguageAbbrevation;
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(LanguageAbbrevation);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(LanguageAbbrevation);
                }

                HttpCookie cookie = new HttpCookie("Language");
                cookie.Value = LanguageAbbrevation;
                Response.Cookies.Add(cookie);
                return "true";
                //return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                return "false";
            }

        }
        public ActionResult Route()
        {
            return RedirectToAction("PageView", "Page", new { id = "Index", Area = "Admin" });
        }
        public async System.Threading.Tasks.Task<ActionResult> SearchbyPostCodeApi(string postcode, string religion)
        {
            var list = new CemeteryRepository().GetAll().AsQueryable();
            try
            {
                var isPostCode = false;
                var isReligion = false;
                if (!string.IsNullOrEmpty(postcode))
                {
                    HttpClient client = new HttpClient();

                    string Url = "http://api.postcodes.io/postcodes/";
                    client.BaseAddress = new Uri(Url);
                    // Add an Accept header for JSON format.
                    client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                    HttpResponseMessage response = client.GetAsync(postcode).Result;
                    string data = "false";
                    if (response.IsSuccessStatusCode)
                    {
                        data = await response.Content.ReadAsStringAsync();
                    }
                    var region = "";
                    if (data != "false")
                    {
                        var obj = new JavaScriptSerializer().Deserialize<tempApiStatus>(data);
                        region = obj.result.region;
                    }
                    if (!string.IsNullOrEmpty(region))
                    {
                        list = list.Where(c => c.Origin != null && c.Origin.Name.ToLower() == region.ToLower()).AsQueryable();
                        ViewBag.LocationName = "Records found under Postcode '" + postcode + "'";
                        isPostCode = true;
                    }
                    else
                    {
                        list = new List<Cemetery>().AsQueryable();
                    }
                }
                if (!string.IsNullOrEmpty(religion))
                {
                    var rel = Convert.ToDecimal(religion);
                    list = list.Where(c => c.MainSections.Where(s => s.Graves.Where(m => m.ReligionId == rel).Count() > 0).Count() > 0).AsQueryable();
                    var relig = new RelgionRepostiory().GetById(Convert.ToDecimal(religion));
                    var v = "";
                    if (relig != null)
                    {
                        v = relig.RelgionName;
                    }
                    if (isPostCode == true)
                    {
                        ViewBag.LocationName = "Records found under Postcode '" + postcode + "' and Religion '" + v + "'";
                    }
                    else
                    {
                        ViewBag.LocationName = "Records found under Religion '" + v + "'";
                    }
                    isReligion = true;
                }
                if (isPostCode == false && isReligion == false)
                {
                    ViewBag.LocationName = "Results found";
                }
                return View(list);
            }
            catch (Exception)
            {
                return View(list);
            }

        }

        [HttpPost]
        public string SendRecoveryEmail(string email)
        {
            var encEmail = new DataEncryptor().Encrypt(email);
            var chk = new MemberRepository().FirstOrDefault(c => c.Email == encEmail);
            if (chk == null)
            {
                return "notExists";
            }
            else
            {
                try
                {
                    string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                    string port = ConfigurationManager.AppSettings["SmtpPort"];
                    string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                    string emailPwd = ConfigurationManager.AppSettings["SmtpPassword"];
                    string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                    string adminEmail;
                    var emails = new AddAdministrativeEmailRepository().GetAll().Select(c => c.Email);
                    if (emails.Count() > 0)
                    {
                        adminEmail = string.Join(",", emails);
                    }
                    else
                    {
                        adminEmail = ConfigurationManager.AppSettings["AdminMail"];
                    }
                    string strPathAndQuery = HttpContext.Request.Url.PathAndQuery;
                    string path = HttpContext.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
                    var appUrl = path + "Home/ResetPassword?code=" + encEmail.Replace("+", "%2B");

                    var message = new MailMessage();
                    message.To.Add(new MailAddress(email));
                    message.From = new MailAddress(fromEmail);  // replace with valid value
                    message.Subject = "Reset Password";
                    message.IsBodyHtml = true;
                    message.Body = "<br/><br/>";
                    message.Body += "<p>Please <a href='" + appUrl + "'>click here</a> to reset your password</p>";
                    message.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                    SendEmail(message.Body, message.Subject, adminEmail, fromEmail, emailPwd, ssl, MailHostServer, port);
                    return "true";
                }
                catch (Exception)
                {
                    return "false";
                }
            }
        }

        public ActionResult ResetPassword(string code)
        {
            ViewBag.ResetEmail = code.Replace("+", "%2B");
            return View();
        }

        [HttpPost]
        public string ResetPassword(string psw, string email)
        {
            email = email.Replace("%2B", "+");
            var obj = new MemberRepository().FirstOrDefault(c => c.Email == email);
            if (obj != null)
            {
                obj.Password = psw;
                var f = new MemberRepository().Update(obj);
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
                return "false";
            }
        }

        public void SendEmail(string Body, string Subject, string toEmail, string fromEmail, string Password, string ssl, string MailHost, string Port)
        {
            var message = new MailMessage();
            message.To.Add(toEmail);
            message.From = new MailAddress(fromEmail);  // replace with valid value
            message.Subject = Subject;
            message.IsBodyHtml = true;
            message.Body = Body;
            message.Priority = MailPriority.Normal;
            var smtp = new SmtpClient();
            smtp.Credentials = new NetworkCredential(fromEmail, Password);
            smtp.Host = MailHost;
            smtp.Port = Convert.ToInt32(Port);
            smtp.EnableSsl = Convert.ToBoolean(ssl);
            try
            {
                smtp.Send(message);
            }
            catch (Exception)
            {

                throw;
            }
        }


        public ActionResult AllNewsFeeds()
        {
            var list = new NewsManagementRepository().GetAll();
            HttpCookie reqCookies = Request.Cookies["Language"];
            var language = "en";
            if (reqCookies != null)
            {
                language = reqCookies.Value.ToString();
            }
            ViewBag.Language = language;
            return View(list);
        }

        [HttpPost]
        public ActionResult Enquiry(Enquiry enquiry)
        {
            var responseStatus = false;
            //Code to collct data and 
            if (!IsAnyNullOrEmpty(enquiry))
            {
                responseStatus = new AddEnquiryRepository().Add(enquiry);
                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("avishekpatra.1986@gmail.com", "Babai@243111"),
                    EnableSsl = true
                };
                client.Send("avishekpatra.1986@gmail.com", "avishekpatra.1986@gmail.com", "test", "testbody");
            }

            return Json(responseStatus);
        }

        private bool IsAnyNullOrEmpty(object myObject)
        {
            foreach (PropertyInfo pi in myObject.GetType().GetProperties()) 
            {
                if (pi.PropertyType == typeof(string))
                {
                    string value = (string)pi.GetValue(myObject);
                    if (string.IsNullOrEmpty(value))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }

    class tempFuneralServices
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    class tempApiStatus
    {
        public tempApiAddress result { get; set; }
    }
    class tempApiAddress
    {
        public string admin_district { get; set; }
        public string admin_county { get; set; }
        public string country { get; set; }
        public string latitude { get; set; }
        public string longitude { get; set; }
        public string region { get; set; }
    }

    class tempServiceList
    {
        public string BusinessName { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}