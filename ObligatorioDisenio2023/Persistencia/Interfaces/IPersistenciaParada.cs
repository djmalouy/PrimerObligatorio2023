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
    public interface IPersistenciaParada
    {
        void AgregarParada(Parada unaParada, int pCodViaje, SqlTransaction _pTransaccion);

        List<Parada> ListarRecorrido(Viaje unViaje);
    }
}
