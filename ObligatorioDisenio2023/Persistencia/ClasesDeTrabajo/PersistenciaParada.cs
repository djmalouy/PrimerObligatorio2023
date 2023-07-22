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
    internal class PersistenciaParada
    {
        public void AgregarParada(Parada unaParada, int pCodViaje,SqlTransaction _pTransaccion)
        {

        }

        public List<Parada> ListarRecorrido(Viaje unViaje)
        {
            List<Parada> listado = new List<Parada>();
            return listado;
        }
    }
}
