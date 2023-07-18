using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;

namespace Persistencia
{
    internal class PersistenciaParada: IPersistenciaParada
    {
        private static PersistenciaParada instancia = null;
        private PersistenciaParada() { }
        public static PersistenciaParada GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaParada();
            return instancia;
        }

        public void AgregarParada(Parada unaParada, int pCodViaje,SqlTransaction _pTransaccion)
        {

        }

        public List<Parada> ListarRecorrido(Viaje unViaje)
        {
            return;
        }
    }
}
