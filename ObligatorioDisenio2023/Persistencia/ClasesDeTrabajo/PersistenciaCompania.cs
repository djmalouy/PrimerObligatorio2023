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
    public class PersistenciaCompania: IPersistenciaCompania
    {
        private static PersistenciaCompania instancia = null;
        private PersistenciaCompania() { }
        public static PersistenciaCompania GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaCompania();
            return instancia;
        }
        public Compania Buscar(string pNombre)
        {
            string direccion;
            string telefono;
            Compania unaC = null;

            SqlDataReader reader;
            SqlConnection con = new SqlConnection(Conexion.Cnn);
            SqlCommand cmd = new SqlCommand("BuscarCompania", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //PARAMETROS DEL SP EN LA BBDD
            //@Nombre varchar(30)

            cmd.Parameters.AddWithValue("@CodigoInterno", pNombre);

            try
            {
                con.Open();
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    direccion = reader["Direccion"].ToString();
                    telefono = reader["Telefono"].ToString();

                    unaC = new Compania(pNombre, direccion, telefono);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return unaC;
        }
        public void AltaCompania (Compania unaC)
        {

        }
        public List<Compania> ListarCompanias()
        {
            return;
        }
    }
}
