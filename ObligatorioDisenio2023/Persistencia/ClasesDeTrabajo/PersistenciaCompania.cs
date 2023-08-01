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
    internal class PersistenciaCompania: IPersistenciaCompania
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

            cmd.Parameters.AddWithValue("@Nombre", pNombre);
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
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand cmd = new SqlCommand("AltaCompania", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", unaC.Nombre);
            cmd.Parameters.AddWithValue("@Direccion", unaC.Direccion);
            cmd.Parameters.AddWithValue("@Telefono", unaC.Telefono);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int ret = Convert.ToInt32(retorno.Value);

                if (ret == -1)
                    throw new Exception("Ya existe una Compañia con dicho nombre.");
                else if (ret == -2)
                    throw new Exception("Error en Alta Compañia");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
        }
        public List<Compania> ListarCompanias()
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            List<Compania> lista = new List<Compania>();
            Compania unaC = null;

            SqlCommand cmd = new SqlCommand("ListarCompanias", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        unaC = new Compania((string)reader["Nombre"], (string)reader["Direccion"], (string)reader["Telefono"]);
                        lista.Add(unaC);
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
            return lista;
        }
    }
}
