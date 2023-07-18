using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;


namespace Persistencia
{
    internal class PersistenciaEmpleado: IPersistenciaEmpleado
    {
        private static PersistenciaEmpleado instancia = null;
        private PersistenciaEmpleado() { }

        public static PersistenciaEmpleado GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaEmpleado();
            return instancia;
        }

        public Empleado Buscar(string pNombUsu)
        {
            return;
        }

        public Empleado Logueo(string pNomUsu, string pPass)
        {
            return;
        }
    }
}
