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
    public class PersistenciaNacional: IPersistenciaNacional
    {
        private static PersistenciaNacional instancia = null;
        private PersistenciaNacional() { }
        public static PersistenciaNacional GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaNacional();
            return instancia;
        }

        public Nacional BuscarTerminalNacional(string pCodTerminal)
        {
            return;
        }

        public Nacional BuscarTerminalNacionalActiva(string pCodTerminal)
        {
            return;
        }

        public void AltaTerminalNacional(Nacional pUnaTerminal)
        {

        }

        public void ModificarTerminalNacional(Nacional pUnaTerminal)
        {

        }

        public void BajaTerminalNacional(Nacional pUnaTerminal)
        {

        }

        public List<Nacional> ListarTerminalesNacional()
        {
            return;
        }
    }
}
