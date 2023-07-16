using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public class FabricaPersistencia
    {
        public static IPersistenciaCompania GetPersitenciaCompania()
        {
            return (PersistenciaCompania.GetInstancia());
        }

        public static IPersistenciaEmpleado GetPersitenciaEmpleado()
        {
            return (PersistenciaEmpleado.GetInstancia());
        }

        public static IPersistenciaInternacional GetPersitenciaInternacional()
        {
            return (PersistenciaInternacional.GetInstancia());
        }

        public static IPersistenciaNacional GetPersitenciaNacional()
        {
            return (PersistenciaNacional.GetInstancia());
        }

        public static IPersistenciaParada GetPersitenciaParada()
        {
            return (PersistenciaParada.GetInstancia());
        }

        public static IPersistenciaViaje GetPersitenciaViaje()
        {
            return (PersistenciaViaje.GetInstancia());
        }
    }
}
