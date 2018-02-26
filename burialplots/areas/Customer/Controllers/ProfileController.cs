using BurialPlots.DAL;
using BurialPlots.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Areas.Customer.Controllers
{
    public class ProfileController : Controller
    {
        // GET: Customer/Profile
        public ActionResult Index()
        {
            decimal uId = Convert.ToDecimal(Session["cmemId"]);
            var user = new MemberRepository().GetById(uId);
            return View(user);
        }
        public string UpdateProfile(string fname, string lname, string email, string password, string cellno)
        {
            try
            {
                decimal uId = Convert.ToDecimal(Session["cmemId"]);
                var user = new MemberRepository().GetById(uId);
                user.Fname = fname;
                user.Lname = lname;
                user.Password = password;
                user.Email = new DataEncryptor().Encrypt(email);
                user.CellNo = new DataEncryptor().Encrypt(cellno);
                new MemberRepository().Update(user);
                return "true";
            }
            catch (Exception e)
            {

                return "false";
            }
        }
    }
}