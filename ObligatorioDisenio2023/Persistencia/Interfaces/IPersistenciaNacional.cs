using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Persistencia
{
    public interface IPersistenciaNacional
    {
        Nacional BuscarTerminalNacional(string pCodTerminal);


       Nacional BuscarTerminalNacionalActiva(string pCodTerminal);


        void AltaTerminalNacional(Nacional pUnaTerminal);


        void ModificarTerminalNacional(Nacional pUnaTerminal);


        void BajaTerminalNacional(Nacional pUnaTerminal);


        List<Nacional> ListarTerminalesNacional();

    }
}
