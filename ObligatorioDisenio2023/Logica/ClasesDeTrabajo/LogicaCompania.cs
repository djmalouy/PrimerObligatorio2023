using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaCompania:ILogicaCompania
    {
        private static LogicaCompania instancia = null;
        private LogicaCompania() { }
        public static LogicaCompania GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaCompania();
            return instancia;
        }

        public Compania Buscar(string pNombre) {
            return FabricaPersistencia.GetPersistenciaCompania().Buscar(pNombre);
        }

        public void AltaCompania(Compania unaC)
        {
            FabricaPersistencia.GetPersistenciaCompania().AltaCompania(unaC);
        }

        public List<Compania> ListarCompanias()
        {
            return FabricaPersistencia.GetPersistenciaCompania().ListarCompanias();
        }
    }
}
