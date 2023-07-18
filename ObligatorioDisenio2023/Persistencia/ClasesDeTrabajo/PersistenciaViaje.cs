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
    internal class PersistenciaViaje: IPersistenciaViaje
    {
        private static PersistenciaViaje instancia = null;

        private PersistenciaViaje() { }

        public static PersistenciaViaje GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaViaje();
            return instancia;
        }

        public void AltaViaje(Viaje unViaje)
        {
            // @Precio int, @Anden int, @MaximoPermitido int, @FechaYHoraPartida datetime,
            // @FechaYHoraArribo datetime, @NomUsuEmp varchar(8), @Compania varchar(30)

        }

        public List<Viaje> ViajesSinPartir()
        {
            return;
        }

        public List<Viaje> ViajesDelMes()
        {
            return;
        }

    }
}
