using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using WSTickets.BusinessLayer;
using WSTickets.ViewModels;

namespace WSTickets.Controllers
{
    [RoutePrefix("api/Historial")]
    public class HistorialController : ApiController
    {
        private BLHistorialUsuario db = new BLHistorialUsuario();

        [HttpGet]
        public async Task<List<HistorialUsuarioViewModel>> GetHistorial(Guid IdUsuario)
        {
            var result = await db.GetHistorialUsuario(IdUsuario);
            return result;
        }

        [HttpPost]
        public async Task<bool> InsertHistorial(HistorialUsuarioViewModel historial)
        {
            var result = await db.InsertAddSubCategoriaHistorial(historial.IdUsuario, historial.IdSubCategoria);
            return result;
        }
    }
}
