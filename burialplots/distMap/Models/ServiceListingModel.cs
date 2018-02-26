using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BurialPlots.Models
{
    public class ServiceListingModel
    {
        public string Id { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string Picture { get; set; }
        public string MyProperty { get; set; }
        public string PaymentGateways { get; set; }
        public string ServicesAndProducts { get; set; }
        public string BusinessDescription { get; set; }
        public string FacebookLink { get; set; }
        public string GooglePlusLink { get; set; }
        public string TwitterLink { get; set; }
        public string PartnerId { get; set; }
        public string IsApproved { get; set; }
        public string Town { get; set; }
        public string County { get; set; }
        public string Number { get; set; }
        public string Country { get; set; }
        public string Address2 { get; set; }
        public string Address1 { get; set; }
        public string Website { get; set; }
        public string PostCode { get; set; }
        public string PhoneNo { get; set; }
        public string BusinessName { get; set; }
        public string Address { get; set; }
        public string LinkedIn { get; set; }
        public List<BusinessPlanModel> BusinessPlan { get; set; }
    }
    public class BusinessPlanModel
    {
        public decimal? county { get; set; }
        public string CountyName { get; set; }
        public decimal? business { get; set; }
        public string BusinessName { get; set; }
        public decimal? plan { get; set; }
        public string PlanName { get; set; }
        public string PlanPrice { get; set; }
    }
}