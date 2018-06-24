using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public string BillingInfo(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
            string loginEmail, string loginPassword, string isLogin, string agentCode)
        {
            var res = "true";
            //Assigning the AgentCode to Session
            Session["AgentCode"] = agentCode;
            try
            {
                if (Session["cmemId"] == null)
                {
                    if (isLogin == "true")
                    {
                        var cobj = new Member1();
                        cobj.Password = loginPassword;
                        cobj.Email = loginEmail;
                        var encEmail = new DataEncryptor().Encrypt(cobj.Email);
                        var ck = new MemberRepository().FirstOrDefault(c => c.Email == encEmail && c.Password == loginPassword);
                        if (ck != null)
                        {
                            Session["cmemId"] = ck.Id;
                            Session["cmemEmail"] = loginEmail;
                            Session["cmemFirstName"] = ck.Fname;
                            Session["cmemLastName"] = ck.Lname;
                        }
                        else
                        {
                            return "notExists";
                        }
                    }
                    else
                    {
                        var cobj = new Member1();
                        cobj.Fname = regFname;
                        cobj.Lname = regLname;
                        cobj.Password = regPassword;
                        cobj.Email = regEmail;
                        cobj.CellNo = cellno;
                        cobj.Active = true;
                        cobj.Role = "Customer";
                        var encEmail = new DataEncryptor().Encrypt(cobj.Email);
                        var ck = new MemberRepository().FirstOrDefault(c => c.Email == encEmail);
                        if (ck != null)
                        {
                            return "exists";
                        }
                        else
                        {
                            cobj.Email = new DataEncryptor().Encrypt(cobj.Email);
                            cobj.CellNo = new DataEncryptor().Encrypt(cobj.CellNo);
                            var m = new MemberRepository().Add(cobj);
                            if (m)
                            {
                                Session["cmemId"] = cobj.Id;
                                Session["cmemEmail"] = regEmail;
                                Session["cmemFirstName"] = regFname;
                                Session["cmemLastName"] = regLname;
                            }
                        }
                    }
                }
                var tempList = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
                /////////////////payment ///////////////////
                decimal? PriceApi = 0;
                foreach (var item in tempList)
                {
                    var CL = new CemeteryLayerRepository().GetById(Convert.ToDecimal(item.LayerId));
                    PriceApi = PriceApi + CL.Price;
                }
                var obj = new tempBillingInfo();
                obj.Address = address;
                obj.CellNo = cellno;
                obj.Country = country;
                obj.Fname = fname;
                obj.Lname = lname;
                var aa = new JavaScriptSerializer();
                Session["cartBilling"] = aa.Serialize(obj);
                var random = new Random();
                var rn = random.Next(0, 99999999);
                var cartId = "cart-" + rn;
                Session["cartId"] = cartId + "|grave";
                var method = new PaymentMethodsRepository().FirstOrDefault(c => c.Active == true);
                if (method != null)
                {
                    return new JavaScriptSerializer().Serialize(Json(new
                    {
                        msg = res,
                        CartId = cartId,
                        InstallId = ConfigurationManager.AppSettings["InstallId"].ToString(),
                        Amount = PriceApi,
                        Currency = "GBP"
                    }));
                }
                else
                {
                    return "instalId";
                }
            }
            catch (Exception)
            {
                return "false";
            }

            ////////////////////////////////////////////
        }

        private void NotifySalesAgent(string agentCode, string orderId, string price)
        {
            //Code to update the sales admin commission
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(ConfigurationManager.AppSettings["apiBaseUrl"].ToString());
                dynamic jsonObject = new ExpandoObject();
                //jsonObject.AgentCode = Session["AgentCode"].ToString();
                //jsonObject.SellingPrice = cemeteryOrder.Price.ToString();
                //jsonObject.OrderId = cemeteryOrder.OrderId;
                jsonObject.AgentCode = agentCode;
                jsonObject.SellingPrice = price;
                jsonObject.OrderId = orderId;
                var content = new StringContent(jsonObject.ToString(), Encoding.UTF8, "application/json");
                var response = client.PostAsync("salesadmin/api/sales", content).Result;
                //response.IsSuccessStatusCode
            }
        }

        public ActionResult SuccessPayment()
        {
            return View();
        }

        [HttpPost]
        public string ConfirmBillingOrder()
        {
            var res = "true";
            try
            {
                if (Session["cartId"] != null)
                {
                    var arr = Session["cartId"].ToString().Split('|');
                    if (arr[1] == "grave")
                    {
                        var tempList = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
                        var tempBilling = new JavaScriptSerializer().Deserialize<tempBillingInfo>(Session["cartBilling"].ToString());
                        /////////////////payment ///////////////////
                        decimal? PriceApi = 0;
                        foreach (var item in tempList)
                        {
                            var CL = new CemeteryLayerRepository().GetById(Convert.ToDecimal(item.LayerId));
                            PriceApi = PriceApi + CL.Price;
                        }
                        var orderObj = new Order();
                        orderObj.Address = tempBilling.Address;
                        orderObj.CellNo = tempBilling.CellNo;
                        orderObj.Country = tempBilling.Country;
                        orderObj.FirstName = tempBilling.Fname;
                        orderObj.LastName = tempBilling.Lname;
                        orderObj.MemberId = Convert.ToDecimal(Session["cmemId"]);
                        orderObj.OrderDate = DateTime.Now;
                        orderObj.CartId = arr[0];
                        orderObj.Status = "Confirmed";
                        var f = new OrderRepository().Add(orderObj);
                        if (f)
                        {
                            foreach (var item in tempList)
                            {
                                var obj = new GravesRepository().GetById(Convert.ToDecimal(item.Id));
                                var CL = new CemeteryLayerRepository().GetById(Convert.ToDecimal(item.LayerId));
                                var cemeteryOrder = new OrderCemetery();
                                cemeteryOrder.OrderId = orderObj.Id;
                                cemeteryOrder.CemeteryId = obj.Id;
                                cemeteryOrder.Price = CL.Price;
                                cemeteryOrder.PreNeed = item.PreNeed;
                                cemeteryOrder.AtNeed = item.AtNeed;
                                cemeteryOrder.Quantity = Convert.ToInt32(item.LayerId);
                                NotifySalesAgent(Session["AgentCode"].ToString(), cemeteryOrder.OrderId.ToString(), cemeteryOrder.Price.ToString());
                                var k = new OrderCemeteryRepository().Add(cemeteryOrder);
                                if (k)
                                {
                                    CL.IsBooking = true;
                                    new CemeteryLayerRepository().Update(CL);
                                }
                            }
                            Session.Remove("cartItems");
                            Session.Remove("cartId");
                            Session.Remove("cartBilling");
                            ////////////sent mail/////////////
                            string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                            string port = ConfigurationManager.AppSettings["SmtpPort"];
                            string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                            string password = ConfigurationManager.AppSettings["SmtpPassword"];
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
                            ///////////////// mail//////////
                            var toEmail = Session["cmemEmail"] + "";
                            var Subject = "Order Submitted";
                            var Body = "Dear " + Session["cmemFirstName"] + ",<br/><br/> Your order has been submitted for further review. Our representative shall be in contact with you within 24 hours. You may track your order by logging into your account and go to My Orders section.<br/><br/>";
                            Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                            /////////////////////

                            //var client = new HttpClient();
                            //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                            //var baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
                            //var urlString = baseUrl + "api/BurialPlotsEmails/SendEmail?Body=" + Body + "&Subject=" + Subject + "&toEmail=" + toEmail + "&fromEmail=" + fromEmail + "&Password=" + password +
                            //    "&ssl=" + ssl + "&MailHost=" + MailHostServer + "&Port=" + port;
                            //client.GetAsync(urlString);

                            SendEmail(Body, Subject, toEmail, fromEmail, password, ssl, MailHostServer, port);
                            ////////////////////////////////// admin mail////////////
                            //var adminToEmail = ConfigurationManager.AppSettings["AdminMail"];
                            var adminSubject = "New Cemetery Order Arrived";
                            var adminBody = "Dear Admin,<br/><br/>An order has been placed by " + Session["cmemFirstName"] + " " + Session["cmemLastName"] + ".Below are the details: ";
                            adminBody += "<br/><br/>";
                            adminBody += "<table border='1'><tr><td>Order ID</td><td>Cemetery Name</td>";
                            adminBody += "<td>Grave Name</td><td>Layer</td><td>Tier</td><td>Price</td><td>Type</td></tr>";
                            foreach (var item in tempList)
                            {
                                adminBody += "<tr>";
                                var obj = new GravesRepository().GetById(Convert.ToDecimal(item.Id));
                                var CL = new CemeteryLayerRepository().GetById(Convert.ToDecimal(item.LayerId));
                                //var cemeteryOrder = new OrderCemetery();
                                adminBody += "<td>" + orderObj.Id + "</td>";
                                adminBody += "<td>" + obj.PlotName + "</td>";
                                adminBody += "<td>" + obj.MainSection.Cemetery.Name + "</td>";
                                adminBody += "<td>" + CL.Name + "</td>";
                                if (obj.Tier != null)
                                {
                                    adminBody += "<td>" + obj.Tier.Name + "</td>";
                                }
                                else
                                {
                                    adminBody += "<td></td>";
                                }
                                adminBody += "<td>" + Math.Round(Convert.ToDecimal(CL.Price), 2) + "</td>";
                                if (item.AtNeed)
                                {
                                    adminBody += "<td>At Need</td>";
                                }
                                else
                                {
                                    adminBody += "<td>Pre Need</td>";
                                }
                                adminBody += "</tr>";
                            }
                            adminBody += "</table>";
                            adminBody += "<br/><br/>You may review this order from admin panel.<br/><br/>Regards,<br/>Burial Plots";
                            SendEmail(adminBody, adminSubject, adminEmail, fromEmail, password, ssl, MailHostServer, port);
                            
                        }
                        return "true";
                    }
                    else if (arr[1] == "extendPlan")
                    {
                        var tempList = new JavaScriptSerializer().Deserialize<List<string>>(Session["ServiceList"].ToString());
                        var service = new ServiceListingPlanRepository().GetById(Convert.ToDecimal(tempList.FirstOrDefault()));
                        var tempBilling = new JavaScriptSerializer().Deserialize<tempBillingInfo>(Session["cartBilling"].ToString());
                        var orderObj = new OrderPlan();
                        orderObj.Address = tempBilling.Address;
                        orderObj.CellNo = tempBilling.CellNo;
                        orderObj.Country = tempBilling.Country;
                        orderObj.FirstName = tempBilling.Fname + " " + tempBilling.Lname;
                        orderObj.PartnerId = Convert.ToDecimal(Session["memId"]);
                        orderObj.OrderDate = DateTime.Now;
                        orderObj.CartId = arr[0];
                        orderObj.Status = "Confirmed";
                        orderObj.ServiceListingId = service.ServiceListId;
                        var k = new OrderPlanRepository().Add(orderObj);
                        foreach (var item in tempList)
                        {
                            var planObj = new ServiceListingPlanRepository().GetById(Convert.ToDecimal(item));
                            var todayDate = DateTime.Now.Date;
                            if (planObj.ExpiryDate < todayDate)
                            {
                                planObj.ExpiryDate = DateTime.Now.AddMonths(Convert.ToInt32(planObj.PartnerPlan.PlanPeriods));
                                var f = new ServiceListingPlanRepository().Update(planObj);
                                if (f)
                                {
                                    var planOrder = new OrderPlanItem();
                                    planOrder.OrderPlanId = orderObj.Id;
                                    planOrder.Price = Convert.ToDecimal(planObj.PartnerPlan.Price);
                                    planOrder.ServiceListingPlanId = planObj.Id;
                                    NotifySalesAgent(Session["AgentCode"].ToString(), planOrder.OrderPlanId.ToString(), planOrder.Price.ToString());
                                    var n = new OrderPlanItemRepository().Add(planOrder);
                                }
                            }
                            else
                            {
                                planObj.ExpiryDate = planObj.ExpiryDate.Value.AddMonths(Convert.ToInt32(planObj.PartnerPlan.PlanPeriods));
                                var f = new ServiceListingPlanRepository().Update(planObj);
                                if (f)
                                {
                                    var planOrder = new OrderPlanItem();
                                    planOrder.OrderPlanId = orderObj.Id;
                                    planOrder.Price = Convert.ToDecimal(planObj.PartnerPlan.Price);
                                    planOrder.ServiceListingPlanId = planObj.Id;
                                    NotifySalesAgent(Session["AgentCode"].ToString(), planOrder.OrderPlanId.ToString(), planOrder.Price.ToString());
                                    var n = new OrderPlanItemRepository().Add(planOrder);
                                }
                            }
                        }
                        Session.Remove("ServiceList");
                        Session.Remove("cartId");
                        Session.Remove("cartBilling");
                        return "true";
                    }
                    else
                    {
                        var tempList = new JavaScriptSerializer().Deserialize<ServiceListingModel>(Session["ServiceList"].ToString());
                        if (string.IsNullOrEmpty(tempList.Id))
                        {
                            var tempBilling = new JavaScriptSerializer().Deserialize<tempBillingInfo>(Session["cartBilling"].ToString());
                            var serviceList = new SeviceListing();
                            serviceList.Address = tempList.Address;
                            serviceList.BusinessName = tempList.BusinessName;
                            serviceList.PhoneNo = tempList.PhoneNo;
                            serviceList.PostCode = tempList.PostCode;
                            serviceList.Website = tempList.Website;
                            serviceList.Address1 = tempList.Address1;
                            serviceList.Address2 = tempList.Address2;
                            serviceList.Country = tempList.Country;
                            serviceList.Number = tempList.Number;
                            serviceList.County = tempList.County;
                            serviceList.Town = tempList.Town;
                            serviceList.Latitude = tempList.Latitude;
                            serviceList.Longitude = tempList.Longitude;
                            serviceList.Picture = tempList.Picture;
                            serviceList.PaymentGateways = tempList.PaymentGateways;
                            serviceList.ServicesAndProducts = tempList.ServicesAndProducts;
                            serviceList.BusinessDescription = tempList.BusinessDescription;
                            serviceList.FacebookLink = tempList.FacebookLink;
                            serviceList.GooglePlusLink = tempList.GooglePlusLink;
                            serviceList.TwitterLink = tempList.TwitterLink;
                            serviceList.LinkedIn = tempList.LinkedIn;
                            serviceList.PartnerId = Convert.ToDecimal(Session["memId"]);
                            serviceList.IsApproved = Convert.ToBoolean(tempList.IsApproved);

                            var f = new ServiceListingRepository().Add(serviceList);
                            if (f)
                            {
                                var orderObj = new OrderPlan();
                                orderObj.Address = tempBilling.Address;
                                orderObj.CellNo = tempBilling.CellNo;
                                orderObj.Country = tempBilling.Country;
                                orderObj.FirstName = tempBilling.Fname + " " + tempBilling.Lname;
                                orderObj.PartnerId = Convert.ToDecimal(Session["memId"]);
                                orderObj.OrderDate = DateTime.Now;
                                orderObj.CartId = arr[0];
                                orderObj.Status = "Confirmed";
                                orderObj.ServiceListingId = serviceList.Id;
                                var k = new OrderPlanRepository().Add(orderObj);
                                if (k)
                                {
                                    foreach (var item in tempList.BusinessPlan)
                                    {
                                        var planObj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                                        var bPlan = new ServiceListingPlan();
                                        bPlan.BusinessId = Convert.ToDecimal(item.business);
                                        bPlan.CountyId = Convert.ToDecimal(item.county);
                                        bPlan.PlanId = Convert.ToDecimal(item.plan);
                                        bPlan.ServiceListId = serviceList.Id;
                                        var expiry = DateTime.Now.AddMonths(Convert.ToInt32(planObj.FreeListingPeriod + planObj.PlanPeriods));
                                        bPlan.ExpiryDate = expiry;
                                        var m = new ServiceListingPlanRepository().Add(bPlan);
                                        if (m)
                                        {
                                            var planOrder = new OrderPlanItem();
                                            planOrder.OrderPlanId = orderObj.Id;
                                            planOrder.Price = Convert.ToDecimal(item.PlanPrice);
                                            planOrder.ServiceListingPlanId = bPlan.Id;
                                            NotifySalesAgent(Session["AgentCode"].ToString(), planOrder.OrderPlanId.ToString(), planOrder.Price.ToString());
                                            var n = new OrderPlanItemRepository().Add(planOrder);
                                        }
                                    }
                                }
                                Session.Remove("ServiceList");
                                Session.Remove("cartId");
                                Session.Remove("cartBilling");
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
                                var adminSubject = "New Plan Order Arrived";
                                var adminBody = "Dear Admin,<br/><br/>An order has been placed by " + Session["memFirstName"] + " " + Session["memLastName"] + ".Below are the details: ";
                                adminBody += "<br/><br/>";
                                adminBody += "<table border='1'><tr><td>Order ID</td><td>Plan Name</td>";
                                adminBody += "<td>Price</td></tr>";
                                foreach (var item in tempList.BusinessPlan)
                                {
                                    adminBody += "<tr>";
                                    //var cemeteryOrder = new OrderCemetery();
                                    adminBody += "<td>" + orderObj.Id + "</td>";
                                    adminBody += "<td>" + item.PlanName + "</td>";
                                    adminBody += "<td>" + item.PlanPrice + "</td>";

                                    adminBody += "</tr>";
                                }
                                adminBody += "</table>";
                                adminBody += "<br/><br/>You may review this order from admin panel.<br/><br/>Regards,<br/>Burial Plots";
                                SendEmail(adminBody, adminSubject, adminEmail, fromEmail, password,
                                    ssl, MailHostServer, port);
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
                            var tempBilling = new JavaScriptSerializer().Deserialize<tempBillingInfo>(Session["cartBilling"].ToString());
                            var orderObj = new OrderPlan();
                            orderObj.Address = tempBilling.Address;
                            orderObj.CellNo = tempBilling.CellNo;
                            orderObj.Country = tempBilling.Country;
                            orderObj.FirstName = tempBilling.Fname + " " + tempBilling.Lname;
                            orderObj.PartnerId = Convert.ToDecimal(Session["memId"]);
                            orderObj.OrderDate = DateTime.Now;
                            orderObj.CartId = arr[0];
                            orderObj.Status = "Confirmed";
                            orderObj.ServiceListingId = Convert.ToDecimal(tempList.Id);
                            var k = new OrderPlanRepository().Add(orderObj);
                            if (k)
                            {
                                foreach (var item in tempList.BusinessPlan)
                                {
                                    var planObj = new PartnerPlanRepository().GetById(Convert.ToDecimal(item.plan));
                                    var bPlan = new ServiceListingPlan();
                                    bPlan.BusinessId = Convert.ToDecimal(item.business);
                                    bPlan.CountyId = Convert.ToDecimal(item.county);
                                    bPlan.PlanId = Convert.ToDecimal(item.plan);
                                    bPlan.ServiceListId = Convert.ToDecimal(tempList.Id);
                                    bPlan.ExpiryDate = DateTime.Now.AddMonths(Convert.ToInt32(planObj.PlanPeriods + planObj.FreeListingPeriod));
                                    var m = new ServiceListingPlanRepository().Add(bPlan);
                                    if (m)
                                    {
                                        var planOrder = new OrderPlanItem();
                                        planOrder.OrderPlanId = orderObj.Id;
                                        planOrder.Price = Convert.ToDecimal(item.PlanPrice);
                                        planOrder.ServiceListingPlanId = bPlan.Id;
                                        NotifySalesAgent(Session["AgentCode"].ToString(), planOrder.OrderPlanId.ToString(), planOrder.Price.ToString());
                                        var n = new OrderPlanItemRepository().Add(planOrder);
                                    }
                                }
                            }
                            Session.Remove("ServiceList");
                            Session.Remove("cartId");
                            Session.Remove("cartBilling");
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
                            

                            SendEmail(Body, Subject, toEmail, fromEmail, password,
                                 ssl, MailHostServer, port);
                            ////////////////////////////////// admin mail////////////
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
                            var adminSubject = "New Plan Order Arrived";
                            var adminBody = "Dear Admin,<br/><br/>An order has been placed by " + Session["memFirstName"] + " " + Session["memLastName"] + ".Below are the details: ";
                            adminBody += "<br/><br/>";
                            adminBody += "<table border='1'><tr><td>Order ID</td><td>Plan Name</td>";
                            adminBody += "<td>Price</td></tr>";
                            foreach (var item in tempList.BusinessPlan)
                            {
                                adminBody += "<tr>";
                                //var cemeteryOrder = new OrderCemetery();
                                adminBody += "<td>" + orderObj.Id + "</td>";
                                adminBody += "<td>" + item.PlanName + "</td>";
                                adminBody += "<td>" + item.PlanPrice + "</td>";

                                adminBody += "</tr>";
                            }
                            adminBody += "</table>";
                            adminBody += "<br/><br/>You may review this order from admin panel.<br/><br/>Regards,<br/>Burial Plots";
                            SendEmail(adminBody, adminSubject, adminEmail, fromEmail, password,
                                ssl, MailHostServer, port);
                            return "true";
                        }
                    }
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception)
            {
                return "true";
            }

            //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//  //**//
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

    }
}