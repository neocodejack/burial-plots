using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public string Login(string username, string pass)
        {
            var chk = new AdminLoginRepository().FirstOrDefault(x => x.Username == username && x.Password == pass);
            if (chk != null)
            {
                Session["adminUser"] = chk.Username;
                Session["adminRole"] = chk.Role;
                Session["adminId"] = chk.Id;
                return "true";
            }
            else
            {
                var encEmail = new DataEncryptor().Encrypt(username);
                var chkPartner = new PartnerRepository().FirstOrDefault(c => c.Email == encEmail && c.Password == pass);
                if (chkPartner != null)
                {
                    if (chkPartner.Active == true)
                    {
                        Session["memId"] = chkPartner.Id;
                        Session["memEmail"] = username;
                        Session["memFirstName"] = chkPartner.Fname;
                        Session["memLastName"] = chkPartner.Lname;
                        Session["memCellno"] = chkPartner.CellNo;
                        return "partner";
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
            }
           
        }

        public ActionResult AdminLogout()
        {
            Session.Abandon();
            return RedirectToAction("Index");
        }
    }
}