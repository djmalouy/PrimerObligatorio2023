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

        internal Internacional BuscarI(string pCodTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Internacional unaI = null;

            SqlCommand cmd = new SqlCommand("BuscarTerminalInternacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unaI = new Internacional(pCodTerminal, (string)reader["Ciudad"], (string)reader["Pais"]);
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
            return unaI;
        }

        public Internacional BuscarIActiva(string pCodTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Internacional unaI = null;

            SqlCommand cmd = new SqlCommand("BuscarTerminalInternacionalActiva", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unaI = new Internacional(pCodTerminal, (string)reader["Ciudad"], (string)reader["Pais"]);
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
            return unaI;
        }

        public void AltaI(Internacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand cmd = new SqlCommand("AltaTerminalInternacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            cmd.Parameters.AddWithValue("@Ciudad", pUnaTerminal.Ciudad);
            cmd.Parameters.AddWithValue("@Pais", pUnaTerminal.Pais);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int ret = Convert.ToInt32(retorno.Value);

                if (ret == -1)
                    throw new Exception("YA EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se crea.");
                else if (ret == -2)
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

        public void ModificarI(Internacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            //PARAMETROS @CodTerminal varchar(6), @Ciudad varchar(40), @Pais varchar(10)
            SqlCommand cmd = new SqlCommand("ModificarTerminalInternacional", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            cmd.Parameters.AddWithValue("@Ciudad", pUnaTerminal.Ciudad);
            cmd.Parameters.AddWithValue("@Pais", pUnaTerminal.Pais);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int ret = Convert.ToInt32(retorno.Value);

                if (ret == -1)
                    throw new Exception("NO EXISTE UNA TERMINAL INERNACIONAL CON DICHO CÓDIGO - No se modifica.");
                else if (ret == -2)
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

        public void BajaI(Internacional pUnaTerminal)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            //PARAMETROS @CodTerminal varchar(6)
            SqlCommand cmd = new SqlCommand("BajaTerminal", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();

                int ret = Convert.ToInt32(retorno.Value);

                if (ret == -1)
                    throw new Exception("NO EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se elimina.");
                else if (ret == -2)
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

        public List<Internacional> ListarInternacionales()
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            List<Internacional> lista = new List<Internacional>();
            Internacional unaI = null;

            SqlCommand cmd = new SqlCommand("ListarTerminalesInternacionales", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        unaI = new Internacional((string)reader["CodTerminal"], (string)reader["Ciudad"], (string)reader["Pais"]);
                        lista.Add(unaI);
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
