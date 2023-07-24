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
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);

            SqlCommand _comando = new SqlCommand("AltaCompania", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@Nombre", unaC.Nombre);
            _comando.Parameters.AddWithValue("@Direccion", unaC.Direccion);
            _comando.Parameters.AddWithValue("@Telefono", unaC.Telefono);
            SqlParameter _retorno = new SqlParameter("@Retorno", System.Data.SqlDbType.Int);
            _retorno.Direction = System.Data.ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_retorno);

            try
            {
                _cnn.Open();
                _comando.ExecuteNonQuery();
                if ((int)_retorno.Value == -1)
                    throw new Exception("Ya existe una Compañia con dicho nombre.");
                else if ((int)_retorno.Value == -2)
                    throw new Exception("Error en Alta Compañia");
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
        public List<Compania> ListarCompanias()
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            List<Compania> _lista = new List<Compania>();
            Compania _unaCompania = null;

            SqlCommand _comando = new SqlCommand("ListarCompanias", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    while (_lector.Read())
                    {
                        _unaCompania = new Compania((string)_lector["Nombre"], (string)_lector["Direccion"], (string)_lector["Telefono"]);
                        _lista.Add(_unaCompania);
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
            return _lista;
        }
    }
}
