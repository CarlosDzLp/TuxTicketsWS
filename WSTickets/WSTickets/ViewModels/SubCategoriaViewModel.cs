﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WSTickets.ViewModels
{
    public class SubCategoriaViewModel
    {
        public Guid IdSubCategoria { get; set; }
        public Guid IdCategoria { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }
        public decimal PrecioNormal { get; set; }
        public decimal PrecioDescuento { get; set; }
        public int CodigoDescuento { get; set; }

        public List<CategoriaViewModel> ListCategoria{
            get;
            set;
        }
    }
}