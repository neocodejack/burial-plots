//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BurialPlots.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderPlan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderPlan()
        {
            this.OrderPlanItems = new HashSet<OrderPlanItem>();
        }
    
        public decimal Id { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public Nullable<decimal> PartnerId { get; set; }
        public string Status { get; set; }
        public string FirstName { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string CellNo { get; set; }
        public Nullable<bool> AmountStatus { get; set; }
        public Nullable<decimal> ServiceListingId { get; set; }
        public string CartId { get; set; }
    
        public virtual Partner Partner { get; set; }
        public virtual SeviceListing SeviceListing { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderPlanItem> OrderPlanItems { get; set; }
    }
}
