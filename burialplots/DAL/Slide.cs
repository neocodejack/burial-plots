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
    
    public partial class Slide
    {
        public decimal Id { get; set; }
        public string Name { get; set; }
        public string Caption { get; set; }
        public string Image { get; set; }
        public Nullable<decimal> SliderId { get; set; }
        public string CaptionUrdu { get; set; }
        public string CaptionArabic { get; set; }
        public string CaptionHindi { get; set; }
        public string CaptionChinese { get; set; }
        public string CaptionItalian { get; set; }
        public string CaptionTurkish { get; set; }
        public string CaptionBengali { get; set; }
        public string CaptionHebrew { get; set; }
    
        public virtual Slider Slider { get; set; }
    }
}
