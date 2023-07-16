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
    public class PersistenciaInternacional: IPersistenciaInternacional
    {
        private static PersistenciaInternacional instancia = null;
        private PersistenciaInternacional() { }
        public static PersistenciaInternacional GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaInternacional();
            return instancia;
        }

        public Internacional BuscarTerminalInternacional(string pCodTerminal)
        {
            return;
        }

        public Internacional BuscarTerminalInternacionalActiva(string pCodTerminal)
        {
            return;
        }

        public void AltaTerminalInternacional(Internacional pUnaTerminal)
        {

        }

        public void ModificarTerminalInternacional(Internacional pUnaTerminal)
        {

        }

        public void BajaTerminalInternacional(Internacional pUnaTerminal)
        {

        }

        public List<Internacional> ListarTerminalesInternacionales()
        {
            return;
        }
    }
}
