using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Persistencia
{
    public interface IPersistenciaEmpleado
    {
        Empleado Buscar(string pNomUsu);
        Empleado Logueo(string pNomUsu, string pPass);
        void Alta(Empleado pUnEmp);
    }
}
