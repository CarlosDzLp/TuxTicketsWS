using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSTickets.ViewModels
{
    public class CategoriaViewModel
    {
        public Guid IdCategoria { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }
    }
}