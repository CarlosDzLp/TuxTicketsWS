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
    [RoutePrefix("api/Usuario")]
    public class UsuarioController : ApiController
    {
        private BLLogin db = new BLLogin();

        [HttpGet]
        public async Task<UsuarioViewModel> GetUsuario(string Correo, string Password)
        {
            var result = await db.GetUsuario(Correo, Password);
            return result;
        }

        [HttpPut]
        public async Task<bool> UpdateUsuario(UsuarioViewModel usu)
        {
            var result = await db.UpdateUsuario(usu);
            return result;
        }

        [HttpPost]
        public async Task<bool> InsertUsuario(UsuarioViewModel usu)
        {
            var result = await db.InsertUsuario(usu);
            return result;
        }
    }
}
