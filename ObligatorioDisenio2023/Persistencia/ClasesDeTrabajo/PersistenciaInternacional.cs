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
    internal class PersistenciaInternacional: IPersistenciaInternacional
    {
        private static PersistenciaInternacional instancia = null;
        private PersistenciaInternacional() { }
        public static PersistenciaInternacional GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaInternacional();
            return instancia;
        }

        public Internacional BuscarI(string pCodTerminal)
        {
            return;
        }

        public Internacional BuscarIActiva(string pCodTerminal)
        {
            return;
        }

        public void AltaI(Internacional pUnaTerminal)
        {

        }

        public void ModificarI(Internacional pUnaTerminal)
        {

        }

        public void BajaI(Internacional pUnaTerminal)
        {

        }

        public List<Internacional> ListarInternacionales()
        {
            return;
        }
    }
}
