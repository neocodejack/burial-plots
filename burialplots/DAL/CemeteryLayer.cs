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
    
    public partial class CemeteryLayer
    {
        public decimal Id { get; set; }
        public string Name { get; set; }
        public Nullable<decimal> CemeteryId { get; set; }
        public Nullable<bool> IsBooking { get; set; }
        public Nullable<decimal> Price { get; set; }
    
        public virtual Grave Grave { get; set; }
    }
}
