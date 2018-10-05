using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using CapaNegocios;
using ViewModels;

namespace WSTickets.Controllers
{
    [RoutePrefix("api/Categoria")]
    public class CategoriaController : ApiController
    {
        private BLCategorias db = new BLCategorias();
        [HttpGet]
        public async Task<List<CategoriaViewModel>> ListCategoria()
        {
            var result = await db.GetCategorias();
            return result;
        }

        [HttpPost]
        public async Task<bool> InsertCategorias(CategoriaViewModel cat)
        {
            var result = await db.InsertCategoria(cat);
            return result;
        }
    }
}
