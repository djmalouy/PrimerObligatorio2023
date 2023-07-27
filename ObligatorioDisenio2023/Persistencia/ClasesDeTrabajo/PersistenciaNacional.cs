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
    internal class PersistenciaNacional: IPersistenciaNacional
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
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Nacional unaN = null;

            SqlCommand cmd = new SqlCommand("BuscarTerminalNacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unaN = new Nacional(pCodTerminal, (string)reader["Ciudad"], (bool)reader["Taxi"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
            return unaN;
        }

        public Nacional BuscarNActiva(string pCodTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Nacional unaN = null;

            SqlCommand cmd = new SqlCommand("BuscarTerminalNacionalActiva", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unaN = new Nacional(pCodTerminal, (string)reader["Ciudad"], (bool)reader["Taxi"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
            return unaN;
        }

        public void AltaN(Nacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand cmd = new SqlCommand("AltaTerminalNacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            cmd.Parameters.AddWithValue("@Ciudad", pUnaTerminal.Ciudad);
            cmd.Parameters.AddWithValue("@Taxi", pUnaTerminal.Taxi);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                if ((int)retorno.Value == -1)
                    throw new Exception("YA EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se crea.");
                else if ((int)retorno.Value == -2)
                    throw new Exception("NO SE PUDO CREAR LA TERMINAL.");
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

        public void ModificarN(Nacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            //PARAMETROS @CodTerminal varchar(6), @Ciudad varchar(40), @Pais varchar(10)
            SqlCommand cmd = new SqlCommand("ModificarTerminalNacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            cmd.Parameters.AddWithValue("@Ciudad", pUnaTerminal.Ciudad);
            cmd.Parameters.AddWithValue("@Taxi", pUnaTerminal.Taxi);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                if ((int)retorno.Value == -1)
                    throw new Exception("NO EXISTE UNA TERMINAL NACIONAL CON DICHO CÓDIGO - No se modifica.");
                else if ((int)retorno.Value == -2)
                    throw new Exception("NO SE PUDO MODIFICAR LA TERMINAL.");
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

        public void BajaN(Nacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            //PARAMETROS @CodTerminal varchar(6)
            SqlCommand cmd = new SqlCommand("ModificarTerminalNacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                if ((int)retorno.Value == -1)
                    throw new Exception("NO EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se elimina.");
                else if ((int)retorno.Value == -2)
                    throw new Exception("NO SE PUDO ELIMINAR LA TERMINAL.");
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

        public List<Nacional> ListarNacionales()
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            List<Nacional> lista = new List<Nacional>();
            Nacional unaN = null;

            SqlCommand cmd = new SqlCommand("ListarTerminalesNacionales", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        unaN = new Nacional((string)reader["CodTerminal"], (string)reader["Ciudad"], (bool)reader["Taxi"]);
                        lista.Add(unaN);
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
