using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Worldpay.Sdk;
using Worldpay.Sdk.Enums;
using Worldpay.Sdk.Models;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        // GET: Admin/Users
        public ActionResult Dashboard()
        {
            if (Session["memId"] == null)
            {
                return Redirect(Url.Content("~/Home/PartnerRegister"));
            }
            else
            {
                return View();
            }
        }
        public ActionResult MyListings()
        {
            if (Session["memId"] == null)
            {
                return Redirect(Url.Content("~/Home/PartnerRegister"));
            }
            decimal mId = Convert.ToDecimal(Session["memId"]);
            List<SeviceListing> listingCount = new List<SeviceListing>();
            if (Session["memId"] != null)
            {
                listingCount = new ServiceListingRepository().GetAll(c => c.PartnerId == mId);
                ViewBag.ListingCount = listingCount.Count;

                return View();
            }
            return RedirectToAction("Admin/Logout", "Home");
        }
        public List<int> ReviewsCount(List<SeviceListing> list)
        {
            int count = 0;
            List<int> CountingList = new List<int>();
            foreach (var item in list)
            {
                var listReviewCount = new ReviewsListingRepository().GetAll(x => x.ServiceListingId == item.Id);
                count = listReviewCount.Count();
                CountingList.Add(count);
                CountingList = CountingList.OrderBy(v => v).ToList();
            }
            return CountingList;
        }

        // Add Service
        public ActionResult AddService()
        {
            if (Session["memId"] != null)
            {
                ViewBag.Plans = new PartnerPlanRepository().GetAll();
                return View();
            }
            else
            {
                return Redirect(Url.Content("~/Home/PartnerRegister"));
            }
        }
        [HttpPost]
        public JsonResult GetTowns(string counties, string servicesId)
        {
            Decimal sId = 0;
            if (!string.IsNullOrEmpty(servicesId))
            {
                sId = Convert.ToDecimal(servicesId);
            }
            List<tempTownList> json = new List<tempTownList>();
            var list = new ServiceListingRepository().GetById(sId);

            if (list != null)
            {
                if (list.Town != null)
                {
                    var townsList = list.Town.Split(',');
                    foreach (var item in townsList)
                    {
                        tempTownList obj = new tempTownList();
                        obj.Name = item;
                        json.Add(obj);
                    }
                }

            }
            var data = new JavaScriptSerializer().Serialize(json);
            var countyIdList = new JavaScriptSerializer().Deserialize<List<string>>(counties);
            List<tempSelectedTownList> json1 = new List<tempSelectedTownList>();
            if (countyIdList != null)
            {
                foreach (var id in countyIdList)
                {
                    if (!string.IsNullOrEmpty(id))
                    {
                        var cid = Convert.ToDecimal(id);
                        var townsList = new TownsRepositoy().GetAll(x => x.CountyId == cid).OrderBy(x => x.Name.Trim());
                        foreach (var item in townsList)
                        {
                            tempSelectedTownList obj = new tempSelectedTownList();
                            obj.Name = item.Name;
                            json1.Add(obj);
                        }

                    }
                }
            }


            var data1 = new JavaScriptSerializer().Serialize(json1);

            var myResult = new
            {
                list = data,
                list1 = data1
            };
            return Json(myResult, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public string GetTownsList(string CountyId)
        {
            var arr = new JavaScriptSerializer().Deserialize<List<string>>(CountyId);
            List<tempTownList> json = new List<tempTownList>();
            if (arr != null)
            {
                foreach (var id in arr)
                {
                    if (!string.IsNullOrEmpty(id))
                    {
                        var cid = Convert.ToDecimal(id);
                        var townsList = new TownsRepositoy().GetAll(x => x.CountyId == cid).OrderBy(x => x.Name).ToList();
                        foreach (var item in townsList)
                        {
                            tempTownList obj = new tempTownList();
                            obj.Id = item.Id;
                            obj.Name = item.Name;
                            json.Add(obj);

                        }


                    }
                }
            }

            var data = new JavaScriptSerializer().Serialize(json);
            return data;

        }
        [HttpPost]
        public string SaveService(string id, string hidImg, string businessName, string postCode, string address, string phNo, string number, string website, string adress2, string Country, string County, string Town, string Address1, string Longitude, string Latitude, string ServicesAndProducts, string BusinessDescription, string PaymentGateways, string FacebookLink, string GooglePlusLink, string TwitterLink, string Picture, string planIds, string linkedin)
        {
            if (string.IsNullOrEmpty(id))
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
                obj.Picture = Picture;
                obj.PaymentGateways = PaymentGateways;
                obj.ServicesAndProducts = ServicesAndProducts;
                obj.BusinessDescription = BusinessDescription;
                obj.FacebookLink = FacebookLink;
                obj.GooglePlusLink = GooglePlusLink;
                obj.TwitterLink = TwitterLink;
                obj.PartnerId = mId + "";
                obj.LinkedIn = linkedin;
                obj.IsApproved = status.ToString();
                obj.BusinessPlan = new JavaScriptSerializer().Deserialize<List<BusinessPlanModel>>(planIds);
                double? amount = 0;
                foreach (var item in obj.BusinessPlan)
                {
                    var planobj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                    amount = amount + planobj.Price;
                }
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
                    sobj.LinkedIn = linkedin;
                    sobj.Picture = Picture;
                    sobj.PaymentGateways = PaymentGateways;
                    sobj.ServicesAndProducts = ServicesAndProducts;
                    sobj.BusinessDescription = BusinessDescription;
                    sobj.FacebookLink = FacebookLink;
                    sobj.GooglePlusLink = GooglePlusLink;
                    sobj.TwitterLink = TwitterLink;
                    sobj.PartnerId = mId;
                    var f = new ServiceListingRepository().Add(sobj);
                    if (f)
                    {
                        foreach (var item in obj.BusinessPlan)
                        {
                            var planobj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                            var bPlan = new ServiceListingPlan();
                            bPlan.BusinessId = Convert.ToDecimal(item.business);
                            bPlan.CountyId = Convert.ToDecimal(item.county);
                            bPlan.PlanId = Convert.ToDecimal(item.plan);
                            bPlan.ServiceListId = sobj.Id;
                            bPlan.ExpiryDate = DateTime.Now.AddMonths(Convert.ToInt32(planobj.FreeListingPeriod));
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
            else
            {
                var planIDs = new JavaScriptSerializer().Deserialize<List<BusinessPlanModel>>(planIds);
                if (planIDs.Count() == 0)
                {
                    var obj = new ServiceListingRepository().GetById(Convert.ToDecimal(id));
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
                    obj.LinkedIn = linkedin;
                    if (!string.IsNullOrEmpty(Picture))
                    {
                        obj.Picture = Picture;
                        var path = Server.MapPath("~/Images/Users/" + hidImg);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                    }
                    obj.PaymentGateways = PaymentGateways;
                    obj.ServicesAndProducts = ServicesAndProducts;
                    obj.BusinessDescription = BusinessDescription;
                    obj.FacebookLink = FacebookLink;
                    obj.GooglePlusLink = GooglePlusLink;
                    obj.TwitterLink = TwitterLink;
                    var f = new ServiceListingRepository().Update(obj);
                    if (f)
                    {
                        return "update";
                    }
                    else
                    {
                        return "false";
                    }
                }
                else
                {
                    var objupd = new ServiceListingRepository().GetById(Convert.ToDecimal(id));
                    objupd.Address = address;
                    objupd.BusinessName = businessName;
                    objupd.PhoneNo = phNo;
                    objupd.PostCode = postCode;
                    objupd.Website = website;
                    objupd.Address1 = Address1;
                    objupd.Address2 = adress2;
                    objupd.Country = Country;
                    objupd.Number = number;
                    objupd.County = County;
                    objupd.Town = Town;
                    objupd.Latitude = Latitude;
                    objupd.Longitude = Longitude;
                    if (!string.IsNullOrEmpty(Picture))
                    {
                        objupd.Picture = Picture;
                        var path = Server.MapPath("~/Images/Users/" + hidImg);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                    }
                    objupd.PaymentGateways = PaymentGateways;
                    objupd.ServicesAndProducts = ServicesAndProducts;
                    objupd.BusinessDescription = BusinessDescription;
                    objupd.FacebookLink = FacebookLink;
                    objupd.GooglePlusLink = GooglePlusLink;
                    objupd.TwitterLink = TwitterLink;
                    objupd.LinkedIn = linkedin;
                    var f = new ServiceListingRepository().Update(objupd);
                    if (f)
                    {
                        Decimal mId = Convert.ToDecimal(Session["memId"]);
                        var obj = new ServiceListingModel();
                        obj.Id = id;
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
                        obj.Picture = Picture;
                        obj.PaymentGateways = PaymentGateways;
                        obj.ServicesAndProducts = ServicesAndProducts;
                        obj.BusinessDescription = BusinessDescription;
                        obj.FacebookLink = FacebookLink;
                        obj.GooglePlusLink = GooglePlusLink;
                        obj.TwitterLink = TwitterLink;
                        obj.LinkedIn = linkedin;
                        obj.PartnerId = mId + "";
                        obj.BusinessPlan = new JavaScriptSerializer().Deserialize<List<BusinessPlanModel>>(planIds);
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
                        return "false";
                    }
                }
            }
        }
        public PartialViewResult LoadServiceListing()
        {
            Decimal Id = Convert.ToDecimal(Session["memId"]);
            var Services = new ServiceListingRepository().GetAll(s => s.PartnerId == Id);
            Services = Services.OrderByDescending(c => c.Id).ToList();
            //ViewBag.ReviewCount = ReviewsCount(Services);
            return PartialView("~/Areas/Admin/Views/Users/_LoadServiceListing.cshtml", Services);

        }
        public ActionResult EditServiceListing(int Id)
        {
            ViewBag.Plans = new PartnerPlanRepository().GetAll();
            if (Session["memId"] != null)
            {
                Decimal memId = Convert.ToDecimal(Session["memId"]);
                var id = Convert.ToDecimal(Id);
                var serviceId = new ServiceListingRepository().FirstOrDefault(c => c.Id == id && c.PartnerId == memId);

                if (serviceId != null)
                {
                    return View(serviceId);
                }
                else
                {
                    return RedirectToAction("MyListings");
                }
            }
            else
            {
                return Redirect(Url.Content("~/Home/PartnerRegister"));
            }
        }
        [HttpPost]
        public string EditServiceListing(SeviceListing serviceListing)
        {
            var serviceInDb = new ServiceListingRepository().GetById(serviceListing.Id);
            if (ModelState.IsValid)
            {
                serviceInDb.BusinessName = serviceListing.BusinessName;
                serviceInDb.BusinessClassification = serviceListing.BusinessClassification;
                serviceInDb.Address = serviceListing.Address;
                serviceInDb.PostCode = serviceListing.PostCode;
                serviceInDb.Website = serviceListing.Website;
                serviceInDb.PhoneNo = serviceListing.PhoneNo;
                if (!string.IsNullOrEmpty(serviceListing.Picture))
                {

                    serviceInDb.Picture = serviceListing.Picture;
                }
                else
                {
                    serviceInDb.Picture = serviceInDb.Picture;
                }

                string CountyName = "";
                string countyNameList = null;
                if (!string.IsNullOrEmpty(serviceListing.CountiesId))
                {
                    var countyarr = serviceListing.CountiesId.Split(',');
                    foreach (var item in countyarr)
                    {
                        if (!string.IsNullOrEmpty(item))
                        {
                            var countyObj = new CountyRepository().GetById(Convert.ToDecimal(item));
                            CountyName = CountyName + countyObj.Name + ",";

                        }
                    }
                }
                countyNameList = CountyName;
                if (!string.IsNullOrEmpty(serviceListing.CountiesName))
                {
                    serviceListing.Town = serviceListing.CountiesName;
                }
                serviceInDb.ServicesAndProducts = serviceListing.ServicesAndProducts;
                serviceInDb.BusinessDescription = serviceListing.BusinessDescription;
                serviceInDb.PaymentGateways = serviceListing.PaymentGateways;
                serviceInDb.FacebookLink = serviceListing.FacebookLink;
                serviceInDb.TwitterLink = serviceListing.TwitterLink;
                serviceInDb.GooglePlusLink = serviceListing.GooglePlusLink;
                serviceInDb.CountiesId = serviceListing.CountiesId;
                serviceInDb.CountiesName = countyNameList;
                serviceInDb.Town = serviceListing.Town;
                serviceInDb.NationWide = Convert.ToBoolean(serviceListing.NationWide);
                //serviceInDb.NationWide = serviceListing.NationWide;
            }

            var res = new ServiceListingRepository().Update(serviceInDb);
            if (res)
            {
                return "true";
            }
            else
            {
                return "false";
            }

        }
        [HttpPost]
        public string DeleteServiceListing(string id)
        {
            try
            {
                var obj = new ServiceListingRepository().GetById(Convert.ToDecimal(id));
                var f = new ServiceListingRepository().DeleteRecord(Convert.ToDecimal(id));
                if (f)
                {
                    var path = Path.Combine(Server.MapPath("/images/Users/"), obj.Picture);
                    if (System.IO.File.Exists(path))
                    {
                        System.IO.File.Delete(path);
                    }
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception)
            {
                return "false";
            }
        }
        public ActionResult DetailServiceListing(int Id)
        {
            if (Session["memId"] == null)
            {
                return Redirect(Url.Content("~/Home/PartnerRegister"));
            }
            else
            {
                var services = new ServiceListingRepository().FirstOrDefault(m => m.Id == Id);
                return View(services);
            }
        }

        // Parter Plan
        public ActionResult MyPlan()
        {
            if (Session["memId"] != null)
            {
                OrderPlanItem Memberplan = new OrderPlanItem();
                Decimal memId = Convert.ToDecimal(Session["memId"]);
                ViewBag.Id = memId;
                var orderPlan = new OrderPlanRepository().GetAll(x => x.PartnerId == memId).OrderByDescending(c => c.Id).FirstOrDefault();
                if (orderPlan != null)
                {
                    Memberplan = new OrderPlanItemRepository().FirstOrDefault(x => x.OrderPlanId == orderPlan.Id);
                }

                if (Memberplan.Id == 0)
                {
                    ViewBag.Plan = null;
                }
                else
                {
                    ViewBag.Plan = Memberplan;
                }
                var planList = new PartnerPlanRepository().GetAll();
                return View(planList);
            }
            else
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }

        }
        [HttpPost]
        public string SavePlan(Decimal PlanId)
        {
            var mId = Session["memId"];
            var partner = new PartnerRepository().GetById(Convert.ToDecimal(mId));

            try
            {

                partner.PartnerPlanId = PlanId;
                var res = new PartnerRepository().Update(partner);
                return "true";
            }
            catch (Exception ex)
            {
                return "false";
            }
        }
        public ActionResult PlanPayment(Decimal PlanId)
        {
            ViewBag.PlanId = PlanId;
            var carlist = new PartnerPlanRepository().GetById(PlanId);
            if (Session["cartItems"] == null)
            {
                var list = new List<tempCartItem>();
                var obj = new tempCartItem();
                obj.Id = carlist.Id;
                obj.Price = Convert.ToDouble(carlist.Price);
                obj.Title = carlist.Title;
                list.Add(obj);
                Session["cartItems"] = new JavaScriptSerializer().Serialize(list);
            }

            return View();
        }
        [HttpPost]
        public string BillingInfoCheck()
        {
            if (Session["ServiceList"] != null)
            {
                var obj = new JavaScriptSerializer().Deserialize<ServiceListingModel>(Session["ServiceList"].ToString());
                if (obj.BusinessPlan.Count() > 0)
                {
                    return "true";
                }
                else
                {
                    return "empty";
                }
            }
            else
            {
                return "empty";
            }
        }
        [HttpPost]
        public string ExtendBillingInfoCheck()
        {
            if (Session["ServiceList"] != null)
            {
                var obj = new JavaScriptSerializer().Deserialize<List<string>>(Session["ServiceList"].ToString());
                if (obj.Count() > 0)
                {
                    return "true";
                }
                else
                {
                    return "empty";
                }
            }
            else
            {
                return "empty";
            }
        }
        [HttpPost]
        public string RemoveFromCart(string county, string business, string plan)
        {
            var obj = new JavaScriptSerializer().Deserialize<ServiceListingModel>(Session["ServiceList"].ToString());
            var countyId = Convert.ToDecimal(county);
            var businesId = Convert.ToDecimal(business);
            var planId = Convert.ToDecimal(plan);
            obj.BusinessPlan = obj.BusinessPlan.Where(c => c.business != businesId && c.county == countyId && c.plan == planId).ToList();
            Session["ServiceList"] = new JavaScriptSerializer().Serialize(obj);
            return "";
        }
        [HttpPost]
        public string BillingInfo(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
              string loginEmail, string loginPassword, string isLogin, string token)
        {
            if (Session["memId"] == null)
            {
                if (isLogin == "true")
                {
                    var cobj = new Partner();
                    cobj.Password = loginPassword;
                    cobj.Email = loginEmail;
                    var encEmail = new DataEncryptor().Encrypt(cobj.Email);
                    var ck = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail && c.Password == loginPassword);
                    if (ck != null)
                    {
                        Session["memId"] = ck.Id;
                        Session["memEmail"] = loginEmail;
                        Session["memFirstName"] = ck.Fname;
                    }
                    else
                    {
                        return "notExists";
                    }
                }
                else
                {
                    var cobj = new Partner();
                    cobj.Fname = regFname;
                    cobj.Lname = regLname;
                    cobj.Password = regPassword;
                    cobj.Email = regEmail;
                    cobj.CellNo = cellno;
                    cobj.Active = true;
                    cobj.Role = "Partner";
                    var encEmail = new DataEncryptor().Encrypt(cobj.Email);
                    var ck = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail);
                    if (ck != null)
                    {
                        return "exists";
                    }
                    else
                    {
                        cobj.Email = new DataEncryptor().Encrypt(cobj.Email);
                        cobj.CellNo = new DataEncryptor().Encrypt(cobj.CellNo);
                        var m = new PartnerRepository().Add(cobj);
                        if (m)
                        {
                            Session["memId"] = cobj.Id;
                            Session["memEmail"] = regEmail;
                            Session["memFirstName"] = regFname;
                            Session["memLastName"] = regLname;
                        }
                    }
                }
            }
            var tempList = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            /////////////////payment ///////////////////
            double? PriceApi = 0;
            foreach (var item in tempList)
            {
                PriceApi = item.Price;
            }
            var restClient = new WorldpayRestClient("https://api.worldpay.com/v1", "T_S_45afb18e-84aa-4ecb-9099-27cdf23f01e8");

            var orderRequest = new OrderRequest()
            {
                token = token,
                amount = Convert.ToInt32(PriceApi * 100),
                currencyCode = CurrencyCode.GBP.ToString(),
                name = Session["memFirstName"].ToString(),
                orderDescription = tempList.Count() + " Plans",
                customerOrderCode = Session["memEmail"].ToString()

            };

            var addressApi = new Address()
            {
                address1 = address,
                address2 = " ",
                city = country,
                countryCode = CountryCode.GB.ToString(),
                postalCode = "N/A"
            };

            orderRequest.billingAddress = addressApi;

            try
            {
                OrderResponse orderResponse = restClient.GetOrderService().Create(orderRequest);
                if (orderResponse.paymentStatus.ToString().ToLower() == "success")
                {
                    var orderObj = new OrderPlan();
                    orderObj.Address = address;
                    orderObj.CellNo = cellno;
                    orderObj.Country = country;
                    orderObj.FirstName = fname;
                    orderObj.PartnerId = Convert.ToDecimal(Session["memId"]);
                    orderObj.OrderDate = DateTime.Now;
                    orderObj.Status = "pending";
                    var f = new OrderPlanRepository().Add(orderObj);
                    if (f)
                    {

                        foreach (var item in tempList)
                        {
                            var obj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.Id));

                            var planOrder = new OrderPlanItem();
                            planOrder.OrderPlanId = orderObj.Id;
                            //planOrder.PlanId = obj.Id;
                            planOrder.Price = Convert.ToDecimal(obj.Price);
                            planOrder.Title = obj.Title;
                            planOrder.Description = obj.Description;
                            var k = new OrderPlanItemRepository().Add(planOrder);

                        }
                        Session.Remove("cartItems");
                        ////////////sent mail/////////////
                        string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                        string port = ConfigurationManager.AppSettings["SmtpPort"];
                        string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                        string password = ConfigurationManager.AppSettings["SmtpPassword"];
                        string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                        /////////////// mail//////////
                        var toEmail = Session["memEmail"] + "";
                        var Subject = "Order Submitted";
                        var Body = "Dear " + Session["memFirstName"] + ",<br/><br/> Your order has been submitted for further review. Our representative shall be in contact with you within 24 hours. You may track your order by logging into your account and go to My Orders section.<br/><br/>";
                        Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                        /////////////////////

                        //var client = new HttpClient();
                        //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        //var baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
                        //var urlString = baseUrl + "api/BurialPlotsEmails/SendEmail?Body=" + Body + "&Subject=" + Subject + "&toEmail=" + toEmail + "&fromEmail=" + fromEmail + "&Password=" + password +
                        //    "&ssl=" + ssl + "&MailHost=" + MailHostServer + "&Port=" + port;
                        //client.GetAsync(urlString);

                        SendEmail(Body, Subject, toEmail, fromEmail, password,
                             ssl, MailHostServer, port);
                        ////////////////////////////////// admin mail////////////
                        //var adminToEmail = ConfigurationManager.AppSettings["AdminMail"];
                        var adminSubject = "New Plan Order Arrived";
                        var adminBody = "Dear Admin,<br/><br/>An order has been placed by " + Session["memFirstName"] + " " + Session["memLastName"] + ".Below are the details: ";
                        adminBody += "<br/><br/>";
                        adminBody += "<table border='1'><tr><td>Order ID</td><td>Plan Name</td>";
                        adminBody += "<td>Price</td></tr>";
                        foreach (var item in tempList)
                        {
                            adminBody += "<tr>";

                            //var cemeteryOrder = new OrderCemetery();
                            adminBody += "<td>" + orderObj.Id + "</td>";
                            adminBody += "<td>" + item.Title + "</td>";
                            adminBody += "<td>" + item.Price + "</td>";

                            adminBody += "</tr>";
                        }
                        adminBody += "</table>";
                        adminBody += "<br/><br/>You may review this order from admin panel.<br/><br/>Regards,<br/>Burial Plots";

                        var message = new MailMessage();
                        var emails = ToAddEmail.ToAddEmails();
                        foreach (var item in emails)
                        {
                            message.To.Add(item.Email);
                        }

                        message.From = new MailAddress(fromEmail);  // replace with valid value
                        message.Subject = adminSubject;
                        message.IsBodyHtml = true;
                        message.Body = adminBody;
                        message.Priority = MailPriority.Normal;
                        var smtp = new SmtpClient();
                        smtp.Credentials = new NetworkCredential(fromEmail, password);
                        smtp.Host = MailHostServer;
                        smtp.Port = Convert.ToInt32(port);
                        smtp.EnableSsl = Convert.ToBoolean(ssl);
                        smtp.Send(message);

                        //SendEmail(adminBody, adminSubject, adminToEmail, fromEmail, password,
                        //    ssl, MailHostServer, port);
                        //var client2 = new HttpClient();
                        //client2.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                        //var urlString2 = baseUrl + "api/BurialPlotsEmails/SendEmail?Body=" + adminBody + "&Subject=" + adminSubject + "&toEmail=" + adminToEmail + "&fromEmail=" + fromEmail + "&Password=" + password +
                        //    "&ssl=" + ssl + "&MailHost=" + MailHostServer + "&Port=" + port;
                        //client2.GetAsync(urlString2);
                        return "true";
                    }
                    else
                    {
                        return "false";
                    }
                }
                else
                {
                    return "Payment status: False";
                }
            }
            catch (WorldpayException e)
            {
                return e.apiError.customCode + "|" + e.apiError.description + "|" + e.apiError.message;
            }
            ////////////////////////////////////////////



        }

        [HttpGet]
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
            smtp.Send(message);
        }
        public string GetPlanById(string planId)
        {
            PartnerPlan plan = new PartnerPlan();
            try
            {
                plan = new PartnerPlanRepository().GetById(Convert.ToDecimal(planId));


                tempPartnerPlan json = new tempPartnerPlan();
                json.Price = Convert.ToString(plan.Price);
                json.Title = plan.Title;
                var obj = new JavaScriptSerializer().Serialize(json);
                return obj;
            }
            catch (Exception ex)
            {
                return "false";
            }
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
                        path = Path.Combine(Server.MapPath("/images/Users/"), fileName);
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

        // User Profile
        public ActionResult UserProfile()
        {
            if (Session["memId"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            decimal uId = Convert.ToDecimal(Session["memId"]);
            var user = new PartnerRepository().GetById(uId);
            return View(user);
        }
        public string UpdateProfile(Partner memmber)
        {
            if (ModelState.IsValid)
            {
                Partner dbMember = new PartnerRepository().FirstOrDefault(m => m.Id == memmber.Id);
                if (dbMember != null)
                {
                    dbMember.Fname = memmber.Fname;
                    dbMember.Email = memmber.Email;
                    dbMember.CellNo = memmber.CellNo;
                    dbMember.Lname = memmber.Lname;
                    dbMember.Password = memmber.Password;
                    dbMember.Username = memmber.Username;
                    if (!string.IsNullOrEmpty(memmber.Picture))
                    {
                        dbMember.Picture = memmber.Picture;
                    }
                    //var encEmail = new DataEncryptor().Encrypt(dbMember.Email);
                    //var ck = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail && c.Password== dbMember.Password && c.Role == "Partner");
                    //if (ck != null)
                    //{
                    //    return "exist";
                    //}

                    dbMember.Email = new DataEncryptor().Encrypt(dbMember.Email);
                    dbMember.CellNo = new DataEncryptor().Encrypt(dbMember.CellNo);
                    var res = new PartnerRepository().Update(dbMember);

                    if (res)
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
            else
            {
                return "false";
            }
        }

        public ActionResult MyOrders()
        {
            var memId = Session["memId"];
            if (memId != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login", new { Area = "Admin" });
            }

        }
        public PartialViewResult LoadOrders()
        {
            List<OrderPlan> list = new List<OrderPlan>();
            var memId = Session["memId"];
            if (memId != null)
            {
                var id = Convert.ToDecimal(memId);
                list = new OrderPlanRepository().GetAll(x => x.PartnerId == id);
            }
            return PartialView("~/Areas/Admin/Views/Users/_LoadPartnerOrders.cshtml", list);
        }
        public ActionResult PlanOrderDetails(string id)
        {
            var memId = Session["memId"];
            if (memId != null)
            {
                var obj = new OrderPlanRepository().GetById(Convert.ToDecimal(id));
                return View(obj);
            }
            else
            {
                return RedirectToAction("Index", "Login", new { Area = "Admin" });
            }
        }

        [HttpPost]
        public string GetTotalPlansAmount(string planIds)
        {
            var plans = new JavaScriptSerializer().Deserialize<List<BusinessPlanModel>>(planIds);
            double? total = 0;
            var f = false;
            foreach (var item in plans)
            {
                var position = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                if (position.Position == null)
                {
                    total = total + position.Price;
                }
                else
                {
                    var chk = new ServiceListingPlanRepository().FirstOrDefault(c => c.BusinessId == item.business && c.CountyId == item.county && c.PlanId == item.plan);
                    if (chk == null)
                    {
                        if (item.plan != null)
                        {
                            total = total + position.Price;
                        }
                    }
                    else
                    {
                        f = true;
                        break;
                    }
                }
            }
            if (f)
            {
                return "false";
            }
            else
            {
                return total + "";
            }
        }
        [HttpPost]
        public PartialViewResult LoadCartItems()
        {
            var obj = new JavaScriptSerializer().Deserialize<ServiceListingModel>(Session["ServiceList"].ToString());
            var newobj = new ServiceListingModel();
            var list = obj.BusinessPlan.ToList();
            newobj = obj;
            newobj.BusinessPlan = new List<BusinessPlanModel>();
            foreach (var item in list)
            {
                var plan = new BusinessPlanModel();
                var county = new CountyRepository().GetById(Convert.ToDecimal(item.county));
                plan.county = item.county;
                plan.CountyName = county.Name;
                var business = new FuneralServicesRepository().GetById(Convert.ToDecimal(item.business));
                plan.business = item.business;
                plan.BusinessName = business.Name;
                var planobj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                plan.plan = item.plan;
                plan.PlanName = planobj.Title;
                plan.PlanPrice = planobj.Price + "";
                newobj.BusinessPlan.Add(plan);
            }
            Session["ServiceList"] = new JavaScriptSerializer().Serialize(newobj);
            return PartialView("~/Areas/Admin/Views/Users/_LoadCartItems.cshtml", newobj);
        }

        public ActionResult ExtendListings()
        {
            var memId = Session["memId"];
            if (memId != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login", new { Area = "Admin" });
            }
        }

        [HttpPost]
        public string GetServicePlanPrice(string sPlanIds)
        {
            var plans = new JavaScriptSerializer().Deserialize<List<string>>(sPlanIds);
            double? total = 0;
            foreach (var item in plans)
            {
                var obj = new ServiceListingPlanRepository().GetById(Convert.ToDecimal(item));
                total = total + obj.PartnerPlan.Price;
            }
            return total + "";
        }

        [HttpPost]
        public string ExtendExpiryDate(string sPlanIds)
        {
            Session["ServiceList"] = sPlanIds;
            if (Session["ServiceList"] != null)
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }
    }

    class tempPartnerPlan
    {
        public string Price { get; set; }
        public string Title { get; set; }
    }
    class tempTowns
    {
        public List<tempSelectedTownList> SelectedTowns { get; set; }
        public List<tempTownList> AllTowns { get; set; }
    }
    class tempTownList
    {
        public decimal Id { get; set; }
        public string Name { get; set; }
    }
    class tempSelectedTownList
    {
        public string Name { get; set; }
    }
    public class ReviewCont
    {
        public static int count { get; set; }
    }
    public class tempCartItem
    {
        public decimal Id { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
    }
    public class tempBillingInfo
    {
        public string Address { get; set; }
        public string CellNo { get; set; }
        public string Country { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
    }
}