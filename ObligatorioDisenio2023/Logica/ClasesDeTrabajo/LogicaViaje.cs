using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaViaje:ILogicaViaje
    {
        private static LogicaViaje instancia = null;
        private LogicaViaje() { }
        public static LogicaViaje GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaViaje();
            return instancia;
        }

        public void AltaViaje(Viaje unViaje)
        {
            FabricaPersistencia.GetPersistenciaViaje().AltaViaje(unViaje);
        }

        public List<Viaje> ViajesSinPartir()
        {
            return FabricaPersistencia.GetPersistenciaViaje().ViajesSinPartir();
        }

        public List<Viaje> ViajesDelMes()
        {
            return FabricaPersistencia.GetPersistenciaViaje().ViajesDelMes();
        }
    }
}
