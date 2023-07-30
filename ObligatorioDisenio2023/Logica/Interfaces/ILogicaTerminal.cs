using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Logica
{
    public interface ILogicaTerminal
    {
        Terminal BuscarActiva(string pCodTerminal);
        void Alta(Terminal pUnaTerminal);
        void Modificar(Terminal pUnaTerminal);
        void Baja(Terminal pUnaTerminal);
        List<Terminal> ListarTerminales();
    }
}
