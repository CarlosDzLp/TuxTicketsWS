using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using WSTickets.Models;
using WSTickets.ViewModels;

namespace WSTickets.BusinessLayer
{
    public class BLSubCategorias
    {
        public async Task<List<SubCategoriaViewModel>> GetSubCategoria(Guid IdCategoria)
        {
            var ListSubcategoria = new List<SubCategoriaViewModel>();
            using (var db = new TicketsEntities())
            {
                var result = db.spSelSubCategorias(IdCategoria);
                foreach (var item in result)
                {
                    var subcategoria = new SubCategoriaViewModel();
                    subcategoria.Nombre = item.Nombre;
                    subcategoria.CodigoDescuento = item.CodigoDescuento;
                    subcategoria.Descripcion = item.Descripcion;
                    subcategoria.IdCategoria = item.IdCategoria;
                    subcategoria.IdSubCategoria = item.IdSubCategoria;
                    subcategoria.PrecioDescuento = item.PrecioDescuento;
                    subcategoria.PrecioNormal = item.PrecioNormal;
                    subcategoria.UrlImagen = item.UrlImagen;
                    ListSubcategoria.Add(subcategoria);
                }
            }

            return ListSubcategoria;
        }

        public async Task<bool> InsertSubcategoria(SubCategoriaViewModel subcategoria)
        {
            bool validate = false;
            using (var db = new TicketsEntities())
            {
                var result = db.spInsSubCategoria(subcategoria.IdCategoria, subcategoria.Nombre,
                    subcategoria.Descripcion, subcategoria.UrlImagen, subcategoria.PrecioNormal,
                    subcategoria.PrecioDescuento, subcategoria.CodigoDescuento);
                if (result < 0)
                {
                    validate = true;
                }
                else
                {
                    validate = false;
                }

                return validate;
            }
        }
    }
}