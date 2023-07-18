using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Persistencia
{
    public interface IPersistenciaInternacional
    {
        Internacional BuscarI(string pCodTerminal);

        Internacional BuscarIActiva(string pCodTerminal);

        void AltaI(Internacional pUnaTerminal);

        void ModificarI(Internacional pUnaTerminal);

        void BajaI(Internacional pUnaTerminal);

        List<Internacional> ListarInternacionales();
    }
}
