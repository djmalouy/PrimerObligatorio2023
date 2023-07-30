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
    internal class PersistenciaParada
    {
        internal static void AgregarParada(Parada unaParada, int pCodViaje, SqlTransaction _pTransaccion)
        {
            SqlCommand cmd = new SqlCommand("AgregarParada", _pTransaccion.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodViaje", pCodViaje);
            cmd.Parameters.AddWithValue("@CodTerminal", unaParada.TerminalParada.CodTerminal);
            cmd.Parameters.AddWithValue("@Parada", unaParada.NroParada);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cmd.Transaction = _pTransaccion;
                cmd.ExecuteNonQuery();

                if ((int)retorno.Value == -1)
                    throw new Exception("Error : El viaje no existe.");
                else if ((int)retorno.Value == -2)
                    throw new Exception("Error : No se deben repetir Número de Parada ni Terminal.");
                else if ((int)retorno.Value == -3)
                    throw new Exception("Error : La termina que esta intentando cargar no está activa.");
                else if ((int)retorno.Value == -4)
                    throw new Exception("Ha ocurrido un error al intentar agregar las paradas.");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        internal static List<Parada> ListarRecorrido(int pCodViaje)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand cmd = new SqlCommand("ListarRecorridoDeUnViaje", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CodViaje", pCodViaje);

            List<Parada> listado = new List<Parada>();
            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        //busco la terminal
                        Terminal _unaTerminal = null;
                        // Primero internacional
                        _unaTerminal = PersistenciaInternacional.GetInstancia().BuscarI((string)reader["CodTerminal"]);
                        if (_unaTerminal == null)
                            // Si no es internacional, es nacional
                            _unaTerminal = PersistenciaNacional.GetInstancia().BuscarN((string)reader["CodTerminal"]);

                        //Creo la parada
                        Parada _unaParada = new Parada((int)reader["Parada"], _unaTerminal);
                        listado.Add(_unaParada);
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
            return listado;
        }
    }
}
