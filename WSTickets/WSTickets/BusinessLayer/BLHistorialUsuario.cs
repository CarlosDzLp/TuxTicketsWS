using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using WSTickets.Models;
using WSTickets.ViewModels;

namespace WSTickets.BusinessLayer
{
    public class BLHistorialUsuario
    {
        public async Task<List<HistorialUsuarioViewModel>> GetHistorialUsuario(Guid IdUsuario)
        {
            var listhistorial = new List<HistorialUsuarioViewModel>();
            using (var db = new TicketsEntities())
            {
                var result = db.spSelHistorialUsuario(IdUsuario);
                foreach (var item in result)
                {
                    var historial = new HistorialUsuarioViewModel();
                    historial.IdSubCategoria = item.IdSubCategoria;
                    historial.Nombre = item.Nombre;
                    historial.Descripcion = item.Descripcion;
                    historial.UrlImagen = item.UrlImagen;
                    historial.PrecioNormal = item.PrecioNormal;
                    historial.PrecioDescuento = item.PrecioDescuento;
                    historial.CodigoDescuento = item.CodigoDescuento;
                    listhistorial.Add(historial);
                }
            }

            return listhistorial;
        }

        public async Task<bool> InsertAddSubCategoriaHistorial(Guid IdUsuario,Guid IdSubCategoria)
        {
            bool validate = false;
            using (var db = new TicketsEntities())
            {
                var result = db.spInsHistorialUsuario(IdUsuario, IdSubCategoria);
                if (result < 0)
                {
                    validate = true;
                }
            }

            return validate;
        }
    }
}