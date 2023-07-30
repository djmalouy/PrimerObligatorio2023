using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class FabricaLogica
    {
        public static ILogicaCompania GetLogicaCompania()
        {
            return (LogicaCompania.GetInstancia());
        }

        public static ILogicaEmpleado GetLogicaEmpleado()
        {
            return (LogicaEmpleado.GetInstancia());
        }

        public static ILogicaTerminal GetLogicaTerminal()
        {
            return (LogicaTerminal.GetInstancia());
        }

        public static ILogicaViaje GetLogicaViaje()
        {
            return (LogicaViaje.GetInstancia());
        }
    }
}
