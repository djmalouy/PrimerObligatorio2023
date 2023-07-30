using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaEmpleado:ILogicaEmpleado
    {
        private static LogicaEmpleado instancia = null;
        private LogicaEmpleado() { }
        public static LogicaEmpleado GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaEmpleado();
            return instancia;
        }

        public Empleado Buscar(string pNombUsu)
        {
            return FabricaPersistencia.GetPersistenciaEmpleado().Buscar(pNombUsu);
        }
        public void Alta(Empleado pUnEmp)
        {
            FabricaPersistencia.GetPersistenciaEmpleado().Alta(pUnEmp);
        }

        public Empleado Logueo(string pNomUsu, string pPass)
        {
            return FabricaPersistencia.GetPersistenciaEmpleado().Logueo(pNomUsu, pPass);
        }


    }
}
