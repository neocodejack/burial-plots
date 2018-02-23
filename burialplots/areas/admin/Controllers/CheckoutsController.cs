using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class CheckoutsController : Controller
    {
        // GET: Admin/Checkout
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult ExtendCheckout()
        {
            return View();
        }

        [HttpPost]
        public string BillingInfo(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
              string loginEmail, string loginPassword, string isLogin)
        {
            try
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
                var tempList = new JavaScriptSerializer().Deserialize<ServiceListingModel>(Session["ServiceList"].ToString());
                /////////////////payment ///////////////////
                double? PriceApi = 0;
                foreach (var item in tempList.BusinessPlan)
                {
                    PriceApi = PriceApi + Convert.ToDouble(item.PlanPrice);
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
                var cartId = "plan-" + rn;
                Session["cartId"] = cartId + "|plan";
                var method = new PaymentMethodsRepository().FirstOrDefault(c => c.Active == true);
                if (method != null)
                {
                    return new JavaScriptSerializer().Serialize(Json(new
                    {
                        msg = "true",
                        CartId = cartId,
                        InstallId = 1212518,
                        Amount = PriceApi,
                        Currency = "GBP"
                    }));
                }
                else
                {
                    return "instalId";
                }
            }
            catch (Exception ex)
            {
                return "false";
            }
        }

        [HttpPost]
        public string BillingExtendInfo(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
      string loginEmail, string loginPassword, string isLogin)
        {
            try
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
                var tempList = new JavaScriptSerializer().Deserialize<List<string>>(Session["ServiceList"].ToString());
                /////////////////payment ///////////////////
                double? PriceApi = 0;
                foreach (var item in tempList)
                {
                    var planobj = new ServiceListingPlanRepository().GetById(Convert.ToDecimal(item));
                    PriceApi = PriceApi + Convert.ToDouble(planobj.PartnerPlan.Price);
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
                var cartId = "plan-" + rn;
                Session["cartId"] = cartId + "|extendPlan";
                var method = new PaymentMethodsRepository().FirstOrDefault(c => c.Active == true);
                if (method != null)
                {
                    return new JavaScriptSerializer().Serialize(Json(new
                    {
                        msg = "true",
                        CartId = cartId,
                        InstallId = 1212518,
                        Amount = PriceApi,
                        Currency = "GBP"
                    }));
                }
                else
                {
                    return "instalId";
                }
            }
            catch (Exception ex)
            {
                return "false";
            }
        }


        [HttpPost]
        public string BillingInfoaaaa(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
      string loginEmail, string loginPassword, string isLogin)
        {
            try
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

                var orderObj = new OrderPlan();
                orderObj.Address = address;
                orderObj.CellNo = cellno;
                orderObj.Country = country;
                orderObj.FirstName = fname + " " + lname;
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
                        // planOrder.PlanId = obj.Id;
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
                    return new JavaScriptSerializer().Serialize(Json(new
                    {
                        msg = "true",
                        CartId = orderObj.Id,
                        InstallId = 1212518,
                        Amount = PriceApi,
                        Currency = "GBP"
                    }));
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception ex)
            {
                return "false";
            }
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
    }
}