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
    
    public partial class UrduPage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UrduPage()
        {
            this.PageBoxes = new HashSet<PageBox>();
        }
    
        public int Id { get; set; }
        public string Body { get; set; }
        public string PageTittle { get; set; }
        public string Pageurl { get; set; }
        public string FeatureImage { get; set; }
        public string ServiceTitle { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PageBox> PageBoxes { get; set; }
        public virtual UrduPage UrduPage1 { get; set; }
        public virtual UrduPage UrduPage2 { get; set; }
    }
}
