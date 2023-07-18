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
        Nacional BuscarN(string pCodTerminal);


       Nacional BuscarNActiva(string pCodTerminal);


        void AltaN(Nacional pUnaTerminal);


        void ModificarN(Nacional pUnaTerminal);


        void BajaN(Nacional pUnaTerminal);


        List<Nacional> ListarNacionales();

    }
}
