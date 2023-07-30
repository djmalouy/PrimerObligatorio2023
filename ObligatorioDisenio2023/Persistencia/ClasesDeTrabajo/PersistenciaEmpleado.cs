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
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Empleado unE = null;

            SqlCommand cmd = new SqlCommand("BuscarEmpleado", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NombUsuario", pNombUsu);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unE = new Empleado(pNombUsu, (string)reader["Contrasenia"], (string)reader["NombCompleto"]);
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
            return unE;
        }

        public Empleado Logueo(string pNomUsu, string pPass)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            Empleado unE = null;

            SqlCommand cmd = new SqlCommand("LogueoEmpleado", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NombUsuario", pNomUsu);
            cmd.Parameters.AddWithValue("@Contrasenia", pPass);

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    unE = new Empleado(pNomUsu, (string)reader["Contrasenia"], (string)reader["NombCompleto"]);
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
            return unE;
        }

        public void Alta(Empleado pUnEmp)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            /*Parámetros en BBDD
            @NombUsuario varchar(8), @Contrasenia varchar(6), @NombCompleto varchar(50) */

            SqlCommand cmd = new SqlCommand("AltaEmpleado", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NombUsuario",pUnEmp.NombUsuario);
            cmd.Parameters.AddWithValue("@Contrasenia", pUnEmp.Contrasenia);
            cmd.Parameters.AddWithValue("@NombCompleto", pUnEmp.NombCompleto);
            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
                if ((int)retorno.Value == -1)
                    throw new Exception("EL NOMBRE DE USUARIO YA EXISTE - No se crea.");
                else if ((int)retorno.Value == -2)
                    throw new Exception("NO SE PUDO CREAR EL EMPLEADO.");
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
    }
}
