//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WSTickets.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SubCategorias
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SubCategorias()
        {
            this.HistorialUsuarioTickets = new HashSet<HistorialUsuarioTickets>();
        }
    
        public System.Guid IdSubCategoria { get; set; }
        public System.Guid IdCategoria { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }
        public decimal PrecioNormal { get; set; }
        public decimal PrecioDescuento { get; set; }
        public int CodigoDescuento { get; set; }
    
        public virtual Categorias Categorias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HistorialUsuarioTickets> HistorialUsuarioTickets { get; set; }
    }
}
