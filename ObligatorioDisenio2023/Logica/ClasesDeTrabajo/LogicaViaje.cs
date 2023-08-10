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
            if (unViaje.FechaYHoraPartida < DateTime.Now)
            {
                throw new Exception("La fecha de partida no puede ser anterior a hoy.");
            }
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
