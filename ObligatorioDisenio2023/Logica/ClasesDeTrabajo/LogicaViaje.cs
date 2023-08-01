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
            List<Viaje> lista = ViajesSinPartir();
            foreach(Viaje V in lista)
            {
                if (V.FechaYHoraPartida >= unViaje.FechaYHoraPartida.AddMinutes(-29)
                    && V.FechaYHoraPartida <= unViaje.FechaYHoraPartida.AddMinutes(29)
                    && V.Anden == unViaje.Anden)
                    throw new Exception("LA FECHA Y HORA DE PARTIDA DEBE TENER MINIMO 30 MINUTOS DE DIFERENCIA CON EL VIAJE ANTERIOR/POSTERIOR DEL MISMO ANDÉN - No se crea.");
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
