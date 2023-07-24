using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using EntidadesCompartidas;


namespace Persistencia
{
    internal class PersistenciaEmpleado: IPersistenciaEmpleado
    {
        private static PersistenciaEmpleado instancia = null;
        private PersistenciaEmpleado() { }

        public static PersistenciaEmpleado GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaEmpleado();
            return instancia;
        }

        public Empleado Buscar(string pNombUsu)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Empleado _unEmpleado = null;

            SqlCommand _comando = new SqlCommand("BuscarEmpleado", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@NombUsuario", pNombUsu);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unEmpleado = new Empleado(pNombUsu, (string)_lector["Contrasenia"], (string)_lector["NombCompleto"]);
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
            return _unEmpleado;
        }

        public Empleado Logueo(string pNomUsu, string pPass)
        {
            SqlConnection _cnn = new SqlConnection(Conexion.Cnn);
            Empleado _unEmpleado = null;

            SqlCommand _comando = new SqlCommand("LogueoEmpleado", _cnn);
            _comando.CommandType = System.Data.CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@NombUsuario", pNomUsu);
            _comando.Parameters.AddWithValue("@Contrasenia", pPass);

            try
            {
                _cnn.Open();
                SqlDataReader _lector = _comando.ExecuteReader();
                if (_lector.HasRows)
                {
                    _lector.Read();
                    _unEmpleado = new Empleado(pNomUsu, (string)_lector["Contrasenia"], (string)_lector["NombCompleto"]);
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
            return _unEmpleado;
        }
    }
}
