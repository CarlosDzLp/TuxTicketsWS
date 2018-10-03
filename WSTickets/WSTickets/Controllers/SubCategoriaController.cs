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
    [RoutePrefix("api/SubCategoria")]
    public class SubCategoriaController : ApiController
    {
        private BLSubCategorias db = new BLSubCategorias();

        [HttpGet]
        public async Task<List<SubCategoriaViewModel>> GetSubCategoria(Guid IdCategoria)
        {
            var result = await db.GetSubCategoria(IdCategoria);
            return result;
        }

        [HttpPost]
        public async Task<bool> InsertSubCategoria(SubCategoriaViewModel sub)
        {
            var result = await db.InsertSubcategoria(sub);
            return result;
        }
    }
}
