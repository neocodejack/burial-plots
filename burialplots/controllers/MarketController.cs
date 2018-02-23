using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BurialPlots.DAL;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using BurialPlots.Models;
using Worldpay.Sdk;
using Worldpay.Sdk.Models;
using Worldpay.Sdk.Enums;
using System.Net.Mail;
using System.Net;

namespace BurialPlots.Controllers
{
    public class MarketController : Controller
    {
        // GET: Market
        public ActionResult Index(string id)
        {
            ViewBag.PlotId = id;
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }

        [HttpPost]
        public string LoadCemetery(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return "";
            }
            else
            {
                var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
                var temp = new tempCemetery();
                temp.Code = obj.Code;
                temp.Id = obj.Id + "";
                temp.Name = obj.Name;
                var aa = new JavaScriptSerializer();
                return aa.Serialize(temp);
            }

        }
        [HttpPost]
        public ActionResult loadSection(string spotId, string cemeteryId)
        {
            if (string.IsNullOrEmpty(spotId))
            {
                return Json(new { msg = "false" });
            }
            else
            {
                var cemId = Convert.ToDecimal(cemeteryId);
                var obj = new MainSectionRepository().FirstOrDefault(c => c.CemeteryId == cemId && c.SpotId == spotId);
                var graveSpotIds = new List<string>();
                foreach (var item in obj.Graves)
                {
                    if (item.CemeteryLayers.Where(c=>c.IsBooking == true).Count() > 0 || item.IsEnabled != true)
                    {
                        graveSpotIds.Add(item.SpotId);
                    }
                }
                var temp = new tempCemetery();
                temp.Code = obj.Code;
                temp.Id = obj.Id + "";
                temp.Name = obj.Name;
                temp.SectionId = obj.Id + "";
                var aa = new JavaScriptSerializer();
                //return aa.Serialize(temp);
                return Json(new {msg = "true", sections = aa.Serialize(temp), graveSpots = aa.Serialize(graveSpotIds) });
            }

        }


        [HttpPost]
        public string AddToCart(string id, string layerId)
        {
            var list = new List<tempCartItem>();
            if (Session["cartItems"] == null)
            {
                var obj = new tempCartItem();
                obj.Id = id;
                obj.LayerId = layerId;
                list.Add(obj);
                Session["cartItems"] = new JavaScriptSerializer().Serialize(list);
            }
            else
            {
                list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
                var obj = new tempCartItem();
                obj.Id = id;
                obj.LayerId = layerId;
                list.Add(obj);
                Session["cartItems"] = new JavaScriptSerializer().Serialize(list);
            }
            return list.Count() + "";
        }
        [HttpPost]
        public string RemoveFromCart(string id)
        {
            var list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            list = list.Where(c => c.LayerId != id).ToList();
            Session["cartItems"] = new JavaScriptSerializer().Serialize(list);
            return list.Count() + "";
        }
        [HttpPost]
        public string EnquiryForm(string fName, string lName, string date, string Muslim, string Catholic, string Christian, string Jewish, string Buddhism, string Hinduism, string Gnosticism, string Other, string Email, string Telephone, string Avalon, string Dignity, string Golden, string from, string gLeaves, string CoOperative, string None, string cemeteryInterested, string plot2, string plot4, string plot6, string plotMore, string Address)
        {
            try
            {
                if (string.IsNullOrEmpty(Address))
                {
                    Address = "Not Provides";
                }
                if (string.IsNullOrEmpty(cemeteryInterested))
                {
                    cemeteryInterested = "Not Provides";
                }


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
                /////////////admin mail//////////

                var messageadmin = new MailMessage();
                //foreach (var item in emails)
                //{
                //    messageadmin.To.Add(item.Email);
                //}

                messageadmin.From = new MailAddress(fromEmail);  // replace with valid value
                messageadmin.Subject = "For Burial Plot Enquiry Form";
                messageadmin.IsBodyHtml = true;
                messageadmin.Body = "Dear Admin,<br/> Following information is just submitted by the user:<br/><br/>";
                messageadmin.Body += "<label>First Name: </label><span> " + fName + "</span><br/>";
                messageadmin.Body += "<label>Last Name: </label><span> " + lName + "</span><br/>";
                messageadmin.Body += "<label>Date of Birth: </label><span> " + date + "</span><br/>";
                messageadmin.Body += "<label>Email: </label><span> " + Email + "</span><br/>";
                messageadmin.Body += "<label>Telephone: </label><span> " + Telephone + "</span><br/>";
                messageadmin.Body += "<label>Address: </label><span> " + Address + "</span><br/>";
                messageadmin.Body += "<label>Cemetery Interested: </label><span> " + cemeteryInterested + "</span><br/>";
                messageadmin.Body += "<label>Religion: </label><span> " + Muslim + "," + Catholic + "," + Christian + "," + Jewish + "," + Buddhism + "," + Hinduism + "," + Gnosticism + "," + Other + "</span><br/>";
                messageadmin.Body += "<label>Selection of Funeral Plan Provider: </label><span>" + Avalon + "," + Dignity + "," + Golden + "," + from + "," + gLeaves + CoOperative + "," + None + "</span><br/>";
                messageadmin.Body += "<label>Number of Plots: </label><span>" + plot2 + "," + plot4 + "," + plot6 + "," + plotMore + "</span><br/>";
                messageadmin.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";

                //"Dear ,<br /><br />Thank you for creating your account on GettingGifty.<br/>please click the link below to verify your email. <br/><br/><br/><br/>Cheers!<br/>GettingGifty.<br/> ";
                messageadmin.Priority = MailPriority.Normal;
                SendEmail(messageadmin.Body, messageadmin.Subject, adminEmail, fromEmail, password,ssl, MailHostServer, port);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }
        }

        [HttpPost]
        public string EnquiryFormSellPlots(string fName, string Email, string cemeteryName, string noofPlots, string price, string address)
        {
            try
            {
                if (string.IsNullOrEmpty(address))
                {
                    address = "Not Provides";
                }
                if (string.IsNullOrEmpty(cemeteryName))
                {
                    cemeteryName = "Not Provides";
                }


                string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                string port = ConfigurationManager.AppSettings["SmtpPort"];
                string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                string password = ConfigurationManager.AppSettings["SmtpPassword"];
                string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                //string adminEmail = ConfigurationManager.AppSettings["AdminMail"];
                /////////////admin mail//////////
                var messageadmin = new MailMessage();
                string adminEmail;
                var emails = new AddAdministrativeEmailRepository().GetAll().Select(c=>c.Email);
                if (emails.Count() > 0)
                {
                    adminEmail = string.Join(",", emails);
                }
                else
                {
                    adminEmail = ConfigurationManager.AppSettings["AdminMail"];
                }
                //foreach (var item in emails)
                //{
                //    messageadmin.To.Add(item.Email);
                //}

                messageadmin.From = new MailAddress(fromEmail);  // replace with valid value
                messageadmin.Subject = "For Burial Plot Enquiry Form";
                messageadmin.IsBodyHtml = true;
                messageadmin.Body = "Dear Admin,<br/> Following information is just submitted by the user:<br/><br/>";
                messageadmin.Body += "<label>Name: </label><span> " + fName + "</span><br/>";
                messageadmin.Body += "<label>Email: </label><span> " + Email + "</span><br/>";
                messageadmin.Body += "<label>Cemetery Name: </label><span> " + cemeteryName + "</span><br/>";
                messageadmin.Body += "<label>Address: </label><span> " + address + "</span><br/>";
                messageadmin.Body += "<label>Price: </label><span> " + price + "</span><br/>";
                messageadmin.Body += "<label>Number of Plots: </label><span>" + noofPlots + "</span><br/>";
                messageadmin.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";

                //"Dear ,<br /><br />Thank you for creating your account on GettingGifty.<br/>please click the link below to verify your email. <br/><br/><br/><br/>Cheers!<br/>GettingGifty.<br/> ";
                messageadmin.Priority = MailPriority.Normal;
                SendEmail(messageadmin.Body, messageadmin.Subject, adminEmail, fromEmail, password, ssl, MailHostServer, port);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }
        }

        [HttpPost]
        public string SubmitSellPlotEnquiry(string fname, string lname, string email, string message)
        {
            try
            {
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

                var messageadmin = new MailMessage();
                messageadmin.From = new MailAddress(fromEmail);  // replace with valid value
                messageadmin.Subject = "For Burial Plot Enquiry Form";
                messageadmin.IsBodyHtml = true;
                messageadmin.Body = "Dear Admin,<br/> Following information is just submitted by the user:<br/><br/>";
                messageadmin.Body += "<label>Name: </label><span> " + fname + " " + lname + "</span><br/>";
                messageadmin.Body += "<label>Email: </label><span> " + email + "</span><br/>";
                messageadmin.Body += "<label>Message: </label><span> " + message + "</span><br/>";
                messageadmin.Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";
                SendEmail(messageadmin.Body, messageadmin.Subject, adminEmail, fromEmail, password, ssl, MailHostServer, port);
                return "true";
            }
            catch (Exception e)
            {
                return "false";
            }
        }
        [HttpPost]
        public PartialViewResult LoadCartItems()
        {
            var list = new List<tempCartItem>();
            if (Session["cartItems"] != null)
            {
                list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            }
            var cartList = new List<TempGrave>();
            foreach (var item in list)
            {
                var obj = new TempGrave();
                var grave = new GravesRepository().GetById(Convert.ToDecimal(item.Id));
                obj.CemeteryName = grave.MainSection.Cemetery.Name;
                obj.GraveName = grave.PlotName;
                obj.Id = grave.Id + "";
                obj.Layer = grave.CemeteryLayers.FirstOrDefault(c => c.Id.ToString() == item.LayerId).Name;
                obj.Price = grave.CemeteryLayers.FirstOrDefault(c => c.Id.ToString() == item.LayerId).Price + "";
                obj.Religion = grave.Relgion.RelgionName;
                obj.LayerId = item.LayerId;
                cartList.Add(obj);
            }
            return PartialView("~/Views/Market/_LoadCartItems.cshtml", cartList);
        }

        [HttpPost]
        public string GetCartIds()
        {
            if (Session["cartItems"] != null)
            {
                return Session["cartItems"].ToString();
            }
            else
            {
                return "false";
            }
        }

        public ActionResult Checkout()
        {
            return View();
        }


        [HttpPost]
        public string BillingInfoCheck()
        {

            if (Session["cartItems"] != null)
            {
                //string json = "";
                //if (Session["cmemId"] != null)
                //{
                //    string id = Convert.ToString(Session["cmemId"]);
                //    string password = "";
                //    var customer = new MemberRepository().GetById(Convert.ToDecimal(id));
                //    if (customer != null)
                //    {
                //        password = customer.Password;
                //    }
                //    string email=Convert.ToString(Session["cmemEmail"]);
                //    string firstName=Convert.ToString(Session["cmemFirstName"]);
                //    string lastName=Convert.ToString(Session["cmemLastName"]);
                //    tempcustomerCredentails obj = new tempcustomerCredentails();
                //    obj.Id = id;
                //    obj.Email = email;
                //    obj.FirstName = firstName;
                //    obj.LastName = lastName;
                //    obj.Password = password;
                //     json = new JavaScriptSerializer().Serialize(obj);

                //}
                var list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());

                if (list.Count() > 0)
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
        public string BillingInfo(string fname, string lname, string address, string country, string cellno, string regFname, string regLname, string regEmail, string regPassword, string regCellNo,
            string loginEmail, string loginPassword, string isLogin, string token)
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
            var restClient = new WorldpayRestClient("https://api.worldpay.com/v1", "T_S_45afb18e-84aa-4ecb-9099-27cdf23f01e8");

            var orderRequest = new OrderRequest()
            {
                token = token,
                amount = Convert.ToInt32(PriceApi * 100),
                currencyCode = CurrencyCode.GBP.ToString(),
                name = Session["cmemFirstName"] + " " + Session["cmemLastName"],
                orderDescription = tempList.Count() + " Cemteries",
                customerOrderCode = Session["cmemEmail"].ToString()

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
                    var orderObj = new Order();
                    orderObj.Address = address;
                    orderObj.CellNo = cellno;
                    orderObj.Country = country;
                    orderObj.FirstName = fname;
                    orderObj.LastName = lname;
                    orderObj.MemberId = Convert.ToDecimal(Session["cmemId"]);
                    orderObj.OrderDate = DateTime.Now;
                    orderObj.Status = "pending";
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
                            var k = new OrderCemeteryRepository().Add(cemeteryOrder);
                            if (k)
                            {
                                CL.IsBooking = true;
                                new CemeteryLayerRepository().Update(CL);
                            }
                        }
                        Session.Remove("cartItems");
                        ////////////sent mail/////////////
                        string MailHostServer = ConfigurationManager.AppSettings["SmtpHost"].ToString();
                        string port = ConfigurationManager.AppSettings["SmtpPort"];
                        string fromEmail = ConfigurationManager.AppSettings["SmtpMail"];
                        string password = ConfigurationManager.AppSettings["SmtpPassword"];
                        string ssl = ConfigurationManager.AppSettings["SmtpEnableSsl"];
                        /////////////// mail//////////
                        var toEmail = Session["cmemEmail"] + "";
                        var Subject = "Order Submitted";
                        var Body = "Dear " + Session["cmemFirstName"] + ",<br/><br/> Your order has been submitted for further review. Our representative shall be in contact with you within 24 hours. You may track your order by logging into your account and go to My Orders section.<br/><br/>";
                        Body += "<br/><span>Thanks,</span><br/><span>Burial Plots</span>";

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
                        SendEmail(adminBody, adminSubject, adminEmail, fromEmail, password,
                            ssl, MailHostServer, port);
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
            try
            {
                smtp.Send(message);
            }
            catch (Exception)
            {

                throw;
            }
        }



        public ActionResult CemeteryPlots()
        {
            ViewBag.LocationName = "All Cemeteries";
            return View();
        }

        [HttpPost]
        public PartialViewResult LoadCemeteryPlots()
        {
            var list = new CemeteryRepository().GetAll();
            return PartialView("~/Views/Market/_LoadCemeteryPlots.cshtml", list);
        }


        [HttpPost]
        public string LoadSects(string religionId)
        {
            var content = "<option value=''>-- Sub Section --</option>";
            if (!string.IsNullOrEmpty(religionId))
            {
                var relId = Convert.ToDecimal(religionId);
                var subSections = new SubRelgionRepository().GetAll(c => c.RelgioId == relId).ToList();
                foreach (var item in subSections)
                {
                    content += "<option value='" + item.Id + "'>" + item.SubRelgionName + "</option>";
                }
            }
            return content;
        }
        [HttpPost]
        public PartialViewResult SectionFilter(string SectionName)
        {
            List<Grave> list = new List<Grave>();
            var section = new MainSectionRepository().FirstOrDefault(x => x.Name.ToLower() == SectionName.ToLower());
            if (section != null)
            {
                list = new GravesRepository().GetAll(x => x.SectionId == section.Id);
            }

            return PartialView("~/Views/Market/_Filtration.cshtml", list);
        }
        [HttpPost]
        public string ReligionFilter(string religionId)
        {
            Decimal id = 0;
            if (!string.IsNullOrEmpty(religionId))
            {
                id = Convert.ToDecimal(religionId);
            }

            var list = new SubRelgionRepository().GetAll(x => x.RelgioId == id);
            List<tempSubREligion> subReligionList = new List<tempSubREligion>();
            foreach (var item in list)
            {
                tempSubREligion obj = new tempSubREligion();
                obj.id = item.Id;
                obj.Name = item.SubRelgionName;
                subReligionList.Add(obj);
            }
            var json = new JavaScriptSerializer().Serialize(subReligionList);
            return json;
        }
        [HttpPost]
        public PartialViewResult FilterSubReligion(string SubRelgionId)
        {
            Decimal id = 0;
            if (!string.IsNullOrEmpty(SubRelgionId))
            {
                id = Convert.ToDecimal(SubRelgionId);
            }
            List<Grave> list = new List<Grave>();
            //var section = new MainSectionRepository().FirstOrDefault(x =>x.SubRelgion.Id ==id);
            //if (section != null)
            //{
            //    list = new GravesRepository().GetAll(x => x.SectionId == section.Id);
            //}

            return PartialView("~/Views/Market/_Filtration.cshtml", list);
        }

        [HttpPost]
        public string LoadSubReligions(string religionId)
        {
            var relId = Convert.ToDecimal(religionId);
            var list = new SubRelgionRepository().GetAll(c => c.RelgioId == relId);
            var content = "<option value=''>--Select Sect--</option>";
            foreach (var item in list)
            {
                content += "<option value='" + item.Id + "'>" + item.SubRelgionName + "</option>";
            }
            return content;
        }

        [HttpPost]
        public PartialViewResult Filteration(string cemeteryId, string sectionId, string pageSize,
            string religionId, string sectSubId
            )
        {
            var cemId = Convert.ToDecimal(cemeteryId);
            var cartlist = new List<tempCartItem>();
            if (Session["cartItems"] != null)
            {
                cartlist = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            }
            ViewBag.CartList = cartlist;
            int pageNumber = Convert.ToInt32(pageSize);
            int pageData = 6;
            List<Grave> list = new GravesRepository().GetAll(c => c.MainSection.CemeteryId == cemId).ToList();
            list = list.Where(c => !string.IsNullOrEmpty(c.SpotId) && c.IsEnabled == true).ToList();
            if (!string.IsNullOrEmpty(sectionId))
            {
                var sectId = Convert.ToDecimal(sectionId);
                list = list.Where(c => c.SectionId == sectId).ToList();
            }
            if (!string.IsNullOrEmpty(religionId))
            {
                var relId = Convert.ToDecimal(religionId);
                list = list.Where(c => c.ReligionId == relId).ToList();
            }
            if (!string.IsNullOrEmpty(sectSubId))
            {
                var subId = Convert.ToDecimal(sectSubId);
                list = list.Where(c => c.SectId == subId).ToList();
            }
            ViewBag.CountList = list.Count();
            list = list.Skip((pageNumber - 1) * pageData).Take(pageData).ToList();
            return PartialView("~/Views/Market/_Filtration.cshtml", list);
        }

        [HttpPost]
        public string GetSectionId(string spotId, string cemeteryId)
        {
            var cemId = Convert.ToDecimal(cemeteryId);
            var obj = new MainSectionRepository().FirstOrDefault(c => c.CemeteryId == cemId && c.SpotId == spotId);
            if (obj != null)
            {
                return obj.Id + "";
            }
            else
            {
                return "";
            }
        }

        [HttpPost]
        public PartialViewResult GetGraveDetails(string spotId, string sectionId)
        {
            var sectId = Convert.ToDecimal(sectionId);
            var grave = new GravesRepository().FirstOrDefault(c => c.SpotId == spotId && c.SectionId == sectId);
            var list = new List<tempCartItem>();
            if (Session["cartItems"] != null)
            {
                list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            }
            var img = new PurchaseBoxImageRepository().FirstOrDefault();
            if (grave != null)
            {
                if (!string.IsNullOrEmpty(grave.Image))
                {
                    ViewBag.DefaultImage = "CemeteryPlots/"+ grave.Image;
                }
                else
                {
                    if (img != null)
                    {
                        ViewBag.DefaultImage = "CemeteryPlots/" + img.Image;
                    }
                    else
                    {
                        ViewBag.DefaultImage = "directory-map.jpg";
                    }
                }
            }
            else
            {
                if (img != null)
                {
                    ViewBag.DefaultImage = "CemeteryPlots/" + img.Image;
                }
                else
                {
                    ViewBag.DefaultImage = "directory-map.jpg";
                }
            }
            ViewBag.CartList = list;
            return PartialView("~/Views/Market/_GetGraveDetails.cshtml", grave);
        }

        [HttpPost]
        public PartialViewResult GetGraveDetailsById(string id)
        {
            var grave = new GravesRepository().GetById(Convert.ToDecimal(id));
            var list = new List<tempCartItem>();
            if (Session["cartItems"] != null)
            {
                list = new JavaScriptSerializer().Deserialize<List<tempCartItem>>(Session["cartItems"].ToString());
            }
            var img = new PurchaseBoxImageRepository().FirstOrDefault();
            if (grave != null)
            {
                if (!string.IsNullOrEmpty(grave.Image))
                {
                    ViewBag.DefaultImage = "CemeteryPlots/" + grave.Image;
                }
                else
                {
                    if (img != null)
                    {
                        ViewBag.DefaultImage = "CemeteryPlots/" + img.Image;
                    }
                    else
                    {
                        ViewBag.DefaultImage = "directory-map.jpg";
                    }
                }
            }
            else
            {
                if (img != null)
                {
                    ViewBag.DefaultImage = "CemeteryPlots/" + img.Image;
                }
                else
                {
                    ViewBag.DefaultImage = "directory-map.jpg";
                }
            }
            ViewBag.CartList = list;
            return PartialView("~/Views/Market/_GetGraveDetails.cshtml", grave);
        }

        public ActionResult CemeteryDetails(string id)
        {
            var obj = new CemeteryRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }

        public ActionResult Sell_Your_Plot()
        {
            return View();
        }
    }
    public class tempSubREligion
    {
        public Decimal id { get; set; }
        public string Name { get; set; }
    }
    public class tempMainSection
    {
        public string CatName { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public List<tempSectionCoordinate> list { get; set; }
    }
    public class tempSectionCoordinate
    {
        public double lat { get; set; }
        public double lng { get; set; }
    }
    public class tempCartItem
    {
        public string Id { get; set; }
        public string LayerId { get; set; }
        public bool PreNeed { get; set; }
        public bool AtNeed { get; set; }
    }

    public class tempBillingInfo
    {
        public string Address { get; set; }
        public string CellNo { get; set; }
        public string Country { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
    }
    public class tempPlanItem
    {
        public decimal Id { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
    }

    class tempPlot
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Lat { get; set; }
        public string Longi { get; set; }
        public string Address { get; set; }
        public string Image { get; set; }
        public int Zoom { get; set; }
        public List<tempCemetery> list { get; set; }

    }

    class tempLayer
    {
        public string Name { get; set; }
        public string Id { get; set; }
        public string Price { get; set; }
    }
    class tempGraveCoordinates
    {
        public double lat { get; set; }
        public double lng { get; set; }
    }
    class tempCemetery
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Image { get; set; }
        public string SectionId { get; set; }

    }

    public class TempGrave
    {
        public string Id { get; set; }
        public string GraveName { get; set; }
        public string CemeteryName { get; set; }
        public string Religion { get; set; }
        public string Layer { get; set; }
        public string LayerId { get; set; }
        public string Price { get; set; }
    }
    public class tempcustomerCredentails
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

    }
}