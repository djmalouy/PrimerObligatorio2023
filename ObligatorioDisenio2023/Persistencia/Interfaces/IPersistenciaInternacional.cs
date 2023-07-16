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
        Internacional BuscarTerminalInternacional(string pCodTerminal);

        Internacional BuscarTerminalInternacionalActiva(string pCodTerminal);

        void AltaTerminalInternacional(Internacional pUnaTerminal);

        void ModificarTerminalInternacional(Internacional pUnaTerminal);

        void BajaTerminalInternacional(Internacional pUnaTerminal);

        List<Internacional> ListarTerminalesInternacionales();
    }
}
