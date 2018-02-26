using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BurialPlots.Models
{
    public class PlanModel
    {
        public string Id { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public string Price { get; set; }
        public string Position { get; set; }

        public string PlanPeriod { get; set; }

        public string FreePeriod { get; set; }
    }
}