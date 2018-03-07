using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BurialPlots.Controllers
{
    public class LocationController : Controller
    {
        [Route("{locationName}/")]
        public ActionResult Popular(string locationName)
        {
            return Content(locationName);
        }
    }
}