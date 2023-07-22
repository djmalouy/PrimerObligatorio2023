using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class FabricaPersistencia
    {
        public static IPersistenciaCompania GetPersistenciaCompania()
        {
            return (PersistenciaCompania.GetInstancia());
        }

        public static IPersistenciaEmpleado GetPersistenciaEmpleado()
        {
            return (PersistenciaEmpleado.GetInstancia());
        }

        public static IPersistenciaInternacional GetPersistenciaInternacional()
        {
            return (PersistenciaInternacional.GetInstancia());
        }

        public static IPersistenciaNacional GetPersistenciaNacional()
        {
            return (PersistenciaNacional.GetInstancia());
        }

        public static IPersistenciaViaje GetPersistenciaViaje()
        {
            return (PersistenciaViaje.GetInstancia());
        }
    }
}
