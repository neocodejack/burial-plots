using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace BurialPlots.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        public ActionResult AddUser()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        public ActionResult AfterLogin()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        [HttpPost]
        public string AdminLogin(string username, string pass)
        {
            var check = new AdminLoginRepository().FirstOrDefault(x => x.Username == username && x.Password == pass);
            if (check != null)
            {
                if (!string.IsNullOrEmpty(check.Password))
                {
                    Session["username"] = check.Username;
                    Session["id"] = check.Id;
                    Session["Role"] = check.Role;
                    return "True";
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
        public ActionResult Logout()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            Session.Remove("id");
            Session.Remove("adminUser");
            Session.RemoveAll();
            return RedirectToAction("Index");

        }

        public ActionResult ViewMember()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            ViewBag.totlacoont = new MemberRepository().GetAll().Count;
            return View();
        }
        public ActionResult LoadMember()
        {
            var data = new MemberRepository().GetAll().ToList();
            return View("~/Areas/Admin/Views/Admin/_LoadMember.cshtml", data);

        }
        //Delete Member
        [HttpPost]
        public string DeleteMember(string id)
        {

            var a = new MemberRepository().DeleteRecord(Convert.ToDecimal(id));
            if (a)
            {
                return "True";
            }
            else
            {
                return "false";

            }

        }
        [HttpPost]
        public string DeletesystemUser(string id)
        {

            var a = new AdminLoginRepository().DeleteRecord(Convert.ToDecimal(id));
            if (a)
            {
                return "True";
            }
            else
            {
                return "false";

            }

        }
        [HttpPost]
        public string Edit(string id, string FirstName, string LastName, string Email, string Password, string cell, string user, string role)
        {
            //addmember m = new addmember();
            var c = new MemberRepository().GetById(Convert.ToDecimal(id));
            c.Fname = FirstName;
            c.Lname = LastName;
            c.Email = new DataEncryptor().Encrypt(Email);
            c.Password = Password;
            c.CellNo = new DataEncryptor().Encrypt(cell);
            c.Username = user;
            c.Role = role;
            var d = new MemberRepository().Update(c);
            if (d)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }
        [HttpPost]
        public string Addnew(string id, string FirstName, string LastName, string Email, string Password, string cell, string user, string role)
        {
            var c = new Member1();
            c.Fname = FirstName;
            c.Lname = LastName;
            c.Email = Email;
            c.Password = Password;
            c.CellNo = cell;
            c.Username = user;
            c.Role = role;
            c.Active = true;
            var d = new MemberRepository().Add(c);
            if (d)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }
        [HttpPost]
        public string AddSystemUser(string user, string pass, string role)
        {
            var c = new AdminLogin();
            c.Username = user;
            c.Password = pass;
            c.Role = role;

            var d = new AdminLoginRepository().Add(c);
            if (d)
            {
                return "True";
            }
            else
            {
                return "false";
            }
        }
        public ActionResult ViewSystemUser(string type)
        {
            ViewBag.Type = type;
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }

        [HttpPost]
        public string Suspend(string id)
        {
            string resss = "";
            var Id = Convert.ToDecimal(id);
            var check = new MemberRepository().FirstOrDefault(x => x.Id == Id);
            if (check.Active == false)
            {
                check.Active = true;

                var res = new MemberRepository().Update(check);
                resss = "True";
            }
            else
            {
                check.Active = false;

                var res = new MemberRepository().Update(check);
                resss = "false";
            }
            return resss;

        }

        public void EditData(string id)
        {
            var td = Convert.ToDecimal(id);
            var c = new AddMemberRepository().FirstOrDefault(x => x.Id == td);
            var t = new JavaScriptSerializer();
            temp a = new temp();
            a.FirstName = c.FirstName;
            a.LastName = c.LastName;
            a.Email = c.Email;
            a.Password = c.Password;
            a.ConfirmPassword = c.Password;
            var bb = t.Serialize(a);
            Response.Write(bb);
            Response.End();


        }
        public string Updatesuer(string id, string user, string pass, string role)
        {
            //addmember m = new addmember();
            var c = new AdminLoginRepository().GetById(Convert.ToDecimal(id));
            c.Username = user;
            c.Password = pass;
            c.Role = role;
            var d = new AdminLoginRepository().Update(c);
            if (d)
            {
                return "True";
            }
            else
            {
                return "false";
            }

        }
        public ActionResult SystemUser()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            return View();
        }
        public PartialViewResult LoadSysytemUser(string type)
        {
            if (type == "SuperAdmin")
            {
                var alluser = new AdminLoginRepository().GetAll(c=>c.Role == "SuperAdmin");
                return PartialView("~/Areas/Admin/Views/Admin/_LoadSysytemUser.cshtml", alluser);
            }
            else
            {
                var alluser = new AdminLoginRepository().GetAll(c=>c.Role == "Admin");
                return PartialView("~/Areas/Admin/Views/Admin/_LoadSysytemUser.cshtml", alluser);
            }
        }
        [HttpGet]
        public ActionResult EditSystemUser(string id)
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            Decimal Userid = Convert.ToDecimal(id);
            var systemUser = new AdminLoginRepository().GetById(Userid);
            return View(systemUser);
        }
        // Admin Profile
        public ActionResult AdminProfile()
        {
            if (Session["adminUser"] == null)
            {
                return RedirectToAction("Index", "Login", new { area = "Admin" });
            }
            decimal uId = Convert.ToDecimal(Session["adminId"]);
            var user = new AdminLoginRepository().GetById(uId);
            return View(user);
        }
        [HttpPost]
        public string UpdateProfile(AdminLogin memmber)
        {
            try
            {
               AdminLogin dbMember = new AdminLoginRepository().FirstOrDefault(m => m.Id == memmber.Id);
                dbMember.Username = memmber.Username;
                dbMember.Password = memmber.Password;
                var res = new AdminLoginRepository().Update(dbMember);

                return "true";

            }
            catch (Exception ex)
            {
                return "false";
            }

        }
        [HttpPost]
        public string coustmeradd(string FirstName, string LastName, string Email, string Password, string cell,string Username)
        {
            var encEmail = new DataEncryptor().Encrypt(Email);
            var c = new Member1();
            c.Fname = FirstName;
            c.Lname = LastName;
            c.Email = encEmail;
            c.Password = Password;
            c.CellNo = new DataEncryptor().Encrypt(cell);
            c.Username = Username;
            c.Active = true;
            var chk = new MemberRepository().FirstOrDefault(x => x.Email == encEmail);
            if (chk == null)
            {
                var d = new MemberRepository().Add(c);
                if (d)
                {
                    return "True";
                }
                else
                {
                    return "false";
                }
            }
            else
            {
                return "exist";
            }
        }
  

    }



public class temp
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }
}

