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
        public void AgregarParada(Parada unaParada, int pCodViaje, SqlTransaction _pTransaccion)
        {
            SqlCommand _comando = new SqlCommand("AgregarParada", _pTransaccion.Connection);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodViaje", pCodViaje);
            _comando.Parameters.AddWithValue("@CodTerminal", unaParada.TerminalParada.CodTerminal);
            //_comando.Parameters.AddWithValue("@Parada", unaParada.TerminalParada.CodTerminal); ????
            SqlParameter _ParmRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _ParmRetorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_ParmRetorno);


            try
            {
                _comando.Transaction = _pTransaccion;
                _comando.ExecuteNonQuery();

                int retorno = Convert.ToInt32(_ParmRetorno.Value);

                if (retorno == -1)
                    throw new Exception("Error : El viaje no existe");
                else if (retorno == -2)
                    throw new Exception("Error : No se deben repetir Número de Parada ni Terminal");
                else if (retorno == -3)
                    throw new Exception("Error : La termina que esta intentando cargar no está activa");
                else if (retorno == -4)
                    throw new Exception("Error No Especificado");

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }

        public List<Parada> ListarRecorrido(Viaje unViaje)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("ListarRecorridoDeUnViaje", _cnn);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodViaje", unViaje.CodViaje);

            List<Parada> listado = new List<Parada>();
            try
            {
                _cnn.Open();

                SqlDataReader _lector = _comando.ExecuteReader();

                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        //busco la terminal
                        Terminal _unaTerminal = null;
                        // Primero internacional
                        _unaTerminal = PersistenciaInternacional.GetInstancia().BuscarI((string)_lector["CodTerminal"]);
                        if (_unaTerminal == null)
                            // Si no es internacional, es nacional
                            _unaTerminal = PersistenciaNacional.GetInstancia().BuscarN((string)_lector["CodTerminal"]);

                        //Creo la parada
                        Parada _unaParada = new Parada((int)_lector["Parada"], _unaTerminal);
                        listado.Add(_unaParada);
                    }
                }

                _lector.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }

            return listado;
        }
    }
}
