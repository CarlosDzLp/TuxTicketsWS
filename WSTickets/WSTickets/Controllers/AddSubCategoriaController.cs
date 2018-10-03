using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using WSTickets.BusinessLayer;
using WSTickets.ViewModels;

namespace WSTickets.Controllers
{
    public class AddSubCategoriaController : Controller
    {
        // GET: AddSubCategoria
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.ListadoCategoria = ObtenerListado();
            return View();
        }

        public List<SelectListItem> ObtenerListado()
        {
            BLCategorias bd = new BLCategorias();
            var result = bd.GetCategorias().Result;
            List<SelectListItem> lista = new List<SelectListItem>();
            foreach (var item in result)
            {
                lista.Add(new SelectListItem
                {
                    Text = item.Nombre,
                    Value = item.IdCategoria.ToString()
                });
            }
            return lista;
        }
        [HttpPost]
        public ActionResult InsertSubCategoria(SubCategoriaViewModel subcategoria, HttpPostedFileBase file,string idcat)
        {
            var generateGuid = Guid.NewGuid();
            string ruta = $"Image/{generateGuid}{System.IO.Path.GetExtension(file.FileName)}";
            string filePath = Path.Combine(Server.MapPath($"~/Image/{generateGuid}{Path.GetExtension(file.FileName)}"));
            file.SaveAs(filePath);

            BLSubCategorias db = new BLSubCategorias();
            subcategoria.UrlImagen = ruta;
            subcategoria.IdCategoria = Guid.Parse(idcat);
            var result = db.InsertSubcategoria(subcategoria).Result;

            return View("Index");
        }
    }
}