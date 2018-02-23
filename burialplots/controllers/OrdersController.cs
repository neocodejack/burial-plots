using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class OrdersController : Controller
    {
        // GET: Orders
        public ActionResult Index()
        {
            return View();
        }
        public string OrderPlace(string shipName,string shipLastName,string shipAddresone,string shipAddresstwo,string shipCity,
            string shipState,string shipZip,string billName,string billLastName,string billAddresone,string billAddrestwo,
            string billCity,string billState,string billZip,string cardNumber,string cardName,string cardMonth,string cardYear,
            string cardCvc
            )
        {
   
            return "";
        }
    }
}