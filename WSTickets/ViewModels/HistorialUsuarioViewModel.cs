using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModels
{
    public class HistorialUsuarioViewModel : SubCategoriaViewModel
    {
        public Guid IdHistorial { get; set; }
        public Guid IdUsuario { get; set; }
        public Guid IdSubCategoria { get; set; }
    }
}
