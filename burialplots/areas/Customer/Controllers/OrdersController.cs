using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BurialPlots.DAL;

namespace BurialPlots.Areas.Customer.Controllers
{
    public class OrdersController : Controller
    {
        // GET: Customer/Orders
        public ActionResult MyOrders()
        {
            if (Session["cmemId"] == null)
            {
                return Redirect(Url.Content("~/Home/LoginSignup"));
            }
            else
            {
                var id = Convert.ToDecimal(Session["cmemId"]);
                var orders = new OrderRepository().GetAll(c => c.MemberId == id);
                return View(orders);
            }
        }

        public ActionResult ShowOrderDetails(string id)
        {
            var obj = new OrderRepository().GetById(Convert.ToDecimal(id));
            return View(obj);
        }
    }
}