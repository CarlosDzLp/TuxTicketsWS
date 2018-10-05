using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaNegocios;
using ViewModels;

namespace WSTickets.Controllers
{
    public class AddCategoriaController : Controller
    {
        // GET: AddCategoria
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult InsertCategoria(CategoriaViewModel categoria, HttpPostedFileBase file)
        {
            var generateGuid = Guid.NewGuid();
            string ruta = $"Image/{generateGuid}{System.IO.Path.GetExtension(file.FileName)}";
            string filePath = Path.Combine(Server.MapPath($"~/Image/{generateGuid}{Path.GetExtension(file.FileName)}"));
            file.SaveAs(filePath);

            BLCategorias db = new BLCategorias();
            categoria.UrlImagen = ruta;
            var result = db.InsertCategoria(categoria).Result;

            return View("Index");
        }
    }
}