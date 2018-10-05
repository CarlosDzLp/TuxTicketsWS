using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using ViewModels;

namespace CapaNegocios
{
    public class BLCategorias
    {
        public async Task<List<CategoriaViewModel>> GetCategorias()
        {
            var ListCategoria = new List<CategoriaViewModel>();
            using (var db = new TicketsEntities())
            {
                var result = db.spSelCategorias();
                foreach (var item in result)
                {
                    var categoria = new CategoriaViewModel();
                    categoria.Descripcion = item.Descripcion;
                    categoria.IdCategoria = item.IdCategoria;
                    categoria.Nombre = item.Nombre;
                    categoria.UrlImagen = item.UrlImagen;
                    ListCategoria.Add(categoria);
                }
            }

            return ListCategoria;
        }

        public async Task<bool> InsertCategoria(CategoriaViewModel cat)
        {
            bool validate = false;
            using (var db = new TicketsEntities())
            {
                var result = db.spInsCategoria(cat.IdCategoria, cat.Nombre, cat.Descripcion, cat.UrlImagen);
                if (result < 0)
                {
                    validate = true;
                }
            }

            return validate;
        }
    }
}
