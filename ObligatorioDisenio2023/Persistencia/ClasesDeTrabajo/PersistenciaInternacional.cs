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
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Internacional _unaInter = null;

            SqlCommand _comando = new SqlCommand("BuscarTerminalInternacional", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaInter = new Internacional(pCodTerminal, (string)_lector["Ciudad"], (string)_lector["Pais"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _unaInter;
        }

        public Internacional BuscarIActiva(string pCodTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Internacional _unaInter = null;

            SqlCommand _comando = new SqlCommand("BuscarTerminalInternacionalActiva", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodTerminal", pCodTerminal);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unaInter = new Internacional(pCodTerminal, (string)_lector["Ciudad"], (string)_lector["Pais"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
            return _unaInter;
        }

        public void AltaI(Internacional pUnaTerminal)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaTerminalInternacional", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@CodTerminal", pUnaTerminal.CodTerminal);
            _comando.Parameters.AddWithValue("@Ciudad", pUnaTerminal.Ciudad);
            _comando.Parameters.AddWithValue("@Pais", pUnaTerminal.Pais);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("YA EXISTE UNA TERMINAL CON DICHO CÓDIGO - No se crea.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("NO SE PUDO CREAR LA TERMINAL.");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                _cnn.Close();
            }
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
