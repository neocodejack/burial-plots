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
    
    public partial class OrderCemetery
    {
        public decimal Id { get; set; }
        public Nullable<decimal> CemeteryId { get; set; }
        public Nullable<decimal> OrderId { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<bool> PreNeed { get; set; }
        public Nullable<bool> AtNeed { get; set; }
    
        public virtual Grave Grave { get; set; }
        public virtual Order Order { get; set; }
    }
}
