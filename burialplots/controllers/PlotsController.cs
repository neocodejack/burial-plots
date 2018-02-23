using BurialPlots.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class PlotsController : Controller
    {
        public ActionResult AddMember()
        {
            return View();
        }
        [HttpPost]
        public string AddMember(Member m)
        {
            var member1 = new Member()
            {
                FirstName = m.FirstName,
                LastName = m.LastName,
                Email = m.Email,
                Password = m.Password,
                Suspend = "false",
                Status = false
                
                //Capcha=m.Capcha
            };
            var c = new AddMemberRepository().Add(member1);
            if (c)
            {
                return "True";
            }
            else
            {
                return "false";
            }

        }
        //Login Methods
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public string Login(string email, string pass)
        {
            var check = new AddMemberRepository().FirstOrDefault(x=>x.Email==email&& x.Password==pass);
            if (check != null)
            {
                if (check.Status == true) {
                    if (!string.IsNullOrEmpty(check.Email))
                    {
                        if (!string.IsNullOrEmpty(check.Password))
                        {
                            Session["Email"] = check.Email;
                            Session["firstname"] = check.FirstName;
                            Session["id"] = check.Id;
                            return "True";
                        }
                        else
                        {
                            return "false";
                        }
                    }
                    else { return "false"; }
                    
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
           
        //Logout Methods
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            return View("~/Views/Plots/Login.cshtml");
        }

        // GET: Plots
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult AfterFuneral()
        {
            return View();
        }
        public ActionResult Arranging()
        {
            return View();
        }
        public ActionResult AtNeed()
        {
            return View();
        }
        public ActionResult Bereavement()
        {
            return View();
        }

        public ActionResult BurialPlots()
        {
            return View();
        }
        public ActionResult Cars()
        {
            return View();
        }
        public ActionResult Coffins()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult DealingWithLossChild()
        {
            return View();
        }
        public ActionResult Dictionary()
        {
            return View();
        }
        public ActionResult Faq()
        {
            return View();
        }
        public ActionResult Florist()
        {
            return View();
        }
        public ActionResult FuneralDirectors()
        {
            return View();
        }
        public ActionResult FuneralPlans()
        {
            return View();
        }
        public ActionResult Funerals()
        {
            return View();
        }
        public ActionResult HealingProcess()
        {
            return View();
        }
        public ActionResult HelpfullAdvice()
        {
            return View();
        }

        public ActionResult HelpfulOrganization()
        {
            return View();
        }

        public ActionResult HelpfulOrgs()
        {
            return View();
        }

        public ActionResult HowToCOmfortChildren()
        {
            return View();
        }

        public ActionResult Legal()
        {
            return View();
        }
        public ActionResult LifeInsurance()
        {
            return View();
        }
        public ActionResult Memorials()
        {
            return View();
        }
        public ActionResult NewsArticles()
        {
            return View();
        }
        public ActionResult NewsFeed()
        {
            return View();
        }

        public ActionResult Now()
        {
            return View();
        }
        public ActionResult ParentalGrief()
        {
            return View();
        }
        public ActionResult PreNeed()
        {
            return View();
        }
        public ActionResult PressCoverage()
        {
            return View();
        }
        public ActionResult Probate()
        {
            return View();
        }
        public ActionResult Search()
        {
            return View();
        }
        public ActionResult ServiceLegal()
        {
            return View();
        }
        public ActionResult Services()
        {
            return View();
        }
        public ActionResult ShokSuddenDeath()
        {
            return View();
        }
        public ActionResult Stonemasons()
        {
            return View();
        }
        public ActionResult Suicide()
        {
            return View();
        }
        public ActionResult Team()
        {
            return View();
        }
        public ActionResult Testimonials()
        {
            return View();
        }
        public ActionResult WhereToStart()
        {
            return View();
        }
        public ActionResult WhoWhy()
        {
            return View();
        }
        public ActionResult Wills()
        {
            return View();
        }
        public ActionResult WillWriting()
        {
            return View();
        }
        public ActionResult WritingEulagies()
        {
            return View();
        }
        public ActionResult WritingEulogies()
        {
            return View();
        }
        public ActionResult TermsAndConditions()
        {
            return View();
        }







    }
}