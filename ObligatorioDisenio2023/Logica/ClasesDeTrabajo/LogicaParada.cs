using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaParada : ILogicaParada
    {
        private static LogicaParada instancia = null;
        private LogicaParada() { }
        public static LogicaParada GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaParada();
            return instancia;
        }

        public void AgregarParada(Parada unaParada, int pCodViaje, SqlTransaction _pTransaccion)
        {
            FabricaPersistencia.GetPersistenciaParada().AgregarParada(unaParada, pCodViaje, _pTransaccion);
        }

        public List<Parada> ListarRecorrido(Viaje unViaje)
        {
            return FabricaPersistencia.GetPersistenciaParada().ListarRecorrido(unViaje);
        }
    }
}
