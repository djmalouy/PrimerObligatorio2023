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

        public Nacional BuscarN(string pCodTerminal)
        {
            return;
        }

        public Nacional BuscarNActiva(string pCodTerminal)
        {
            return;
        }

        public void AltaN(Nacional pUnaTerminal)
        {

        }

        public void ModificarN(Nacional pUnaTerminal)
        {

        }

        public void BajaN(Nacional pUnaTerminal)
        {

        }

        public List<Nacional> ListarNacionales()
        {
            return;
        }
    }
}
