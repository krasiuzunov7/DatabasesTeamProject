//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SQLITEModule
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tax
    {
        public Tax()
        {
            this.Products = new HashSet<Product>();
        }
    
        public long Id { get; set; }
        public string ProductName { get; set; }
        public Nullable<long> Tax1 { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
    }
}
