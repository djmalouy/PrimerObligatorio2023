using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Persistencia
{
    public interface IPersistenciaCompania
    {
        Compania Buscar(string pNombre);
        void AltaCompania(Compania unaC);
        List<Compania> ListarCompanias();
    }
}
