using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using WSTickets.Models;
using WSTickets.ViewModels;

namespace WSTickets.BusinessLayer
{
    public class BLLogin
    {
        public async Task<UsuarioViewModel> GetUsuario(string Correo, string password)
        {
            var usuario = new UsuarioViewModel();
            using (var db = new TicketsEntities())
            {
                var result = db.spSelUsuario(Correo, password);
                foreach (var item in result)
                {
                    usuario.Nombre = item.Nombre;
                    usuario.Apellidos = item.Apellidos;
                    usuario.Contrasena = item.Contrasena;
                    usuario.Correo = item.Correo;
                    usuario.IdUsuario = item.IdUsuario;
                    usuario.Sexo = item.Sexo;
                    usuario.TipoLogin = item.Sexo;
                    usuario.UrlImagen = item.UrlImagen;
                }
            }

            return usuario;
        }
        public async Task<bool> UpdateUsuario(UsuarioViewModel usuario)
        {
            bool validate = false;
            using (var db = new TicketsEntities())
            {
                var result = db.spUpdateUsuario(usuario.IdUsuario, usuario.Nombre, usuario.Apellidos, usuario.Sexo,
                    usuario.Correo, usuario.Contrasena, usuario.TipoLogin, usuario.UrlImagen);
                if (result < 0)
                {
                    validate = true;
                }
            }

            return validate;
        }
        public async Task<bool> InsertUsuario(UsuarioViewModel usuario)
        {
            bool validate = false;
            using (var db = new TicketsEntities())
            {
                var result = db.spInsertUsuario(usuario.Nombre, usuario.Apellidos, usuario.Sexo,
                    usuario.Correo, usuario.Contrasena, usuario.TipoLogin, usuario.UrlImagen);
                if (result < 0)
                {
                    validate = true;
                }
            }

            return validate;
        }
    }
}