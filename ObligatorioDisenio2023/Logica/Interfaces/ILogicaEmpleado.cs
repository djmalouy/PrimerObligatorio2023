using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;

namespace Logica
{
    public interface ILogicaEmpleado
    {
        Empleado Buscar(string pNombUsu);
        void Alta(Empleado pUnEmp);
        Empleado Logueo(string pNomUsu, string pPass);
    }
}
