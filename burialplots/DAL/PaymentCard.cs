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
    
    public partial class PaymentCard
    {
        public int Id { get; set; }
        public string CardNo { get; set; }
        public string CardName { get; set; }
        public Nullable<System.DateTime> ExpMonth { get; set; }
        public Nullable<System.DateTime> ExpYear { get; set; }
        public Nullable<int> CvcNo { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> BillId { get; set; }
    
        public virtual BillingShipping BillingShipping { get; set; }
        public virtual Member Member { get; set; }
    }
}
