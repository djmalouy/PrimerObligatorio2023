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
    internal class PersistenciaViaje: IPersistenciaViaje
    {
        private static PersistenciaViaje instancia = null;

        private PersistenciaViaje() { }

        public static PersistenciaViaje GetInstancia()
        {
            if (instancia == null)
                instancia = new PersistenciaViaje();
            return instancia;
        }

        public void AltaViaje(Viaje unViaje)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);

            /*Parametros en BBDD
            @Precio int, @Anden int, @MaximoPermitido int, @FechaYHoraPartida datetime,
            @FechaYHoraArribo datetime, @NomUsuEmp varchar(8), @Compania varchar(30)*/

            SqlCommand cmd = new SqlCommand("AltaViaje", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Precio", unViaje.Precio);
            cmd.Parameters.AddWithValue("@Anden", unViaje.Anden);
            cmd.Parameters.AddWithValue("@MaximoPermitido", unViaje.MaximoPermitido);
            cmd.Parameters.AddWithValue("@FechaYHoraPartida", unViaje.FechaYHoraPartida);
            cmd.Parameters.AddWithValue("@FechaYHoraArribo", unViaje.FechaYHoraArribo);
            cmd.Parameters.AddWithValue("@NomUsuEmp", unViaje.EmpleadoCrea.NombUsuario);
            cmd.Parameters.AddWithValue("@Compania", unViaje.CompaniaCrea.Nombre);

            SqlParameter retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(retorno);

            SqlTransaction miTransaccion = null;

            try
            {
                cnn.Open();
                //Acá se determina que se va a trabajar en una única transacción
                miTransaccion = cnn.BeginTransaction();

                //El comando de AltaViaje se ejecuta dentro de la transacción
                cmd.Transaction = miTransaccion;
                cmd.ExecuteNonQuery();
                int codViaje = (int)retorno.Value;

                if (codViaje == -1)
                    throw new Exception("ERROR - El empleado no existe, no se crea.");
                else if (codViaje == -2)
                    throw new Exception("NO EXISTE UNA COMPAÑÍA CON ESE NOMBRE - No se crea.");
                else if (codViaje == -3)
                    throw new Exception("LOS VIAJES QUE PARTEN DEL MISMO ANDEN DEBEN TENER 30 MINUTOS DE DIFERENCIA EN SU PARTIDA - No se crea..");
                else if (codViaje == -4)
                    throw new Exception("NO SE PUDO CREAR EL VIAJE.");

                //Genero alta para las paradas (recorrido)
                foreach (Parada unaParada in unViaje.Paradas)
                {
                    PersistenciaParada.AgregarParada(unaParada, codViaje, miTransaccion);
                }

                //Si llega acá no hubo problema en agregar las paradas por lo que hago commit.
                miTransaccion.Commit();
            }
            catch (Exception ex)
            {
                miTransaccion.Rollback();
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }

        }

        public List<Viaje> ViajesSinPartir()
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            List<Viaje> lista = new List<Viaje>();
            Viaje unViaje = null;

            SqlCommand cmd = new SqlCommand("ViajesSinPartir", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Compania unaC = null;
                    Empleado unEmp = null;
                    List<Parada> listaParadas = new List<Parada>();
                    while (reader.Read())
                    {
                        unaC = PersistenciaCompania.GetInstancia().Buscar((string)reader["Nombre"]);
                        unEmp = PersistenciaEmpleado.GetInstancia().Buscar((string)reader["NombUsuario"]);
                        listaParadas = PersistenciaParada.ListarRecorrido((int)reader["CodViaje"]);

                        unViaje = new Viaje((int)reader["CodViaje"], (DateTime)reader["FechaYHoraPartida"], (DateTime)reader["FechaYHoraArribo"],(int)reader["Precio"],
                            (int)reader["Anden"], (int)reader["MaximoPermitido"], unaC, unEmp, listaParadas);

                        lista.Add(unViaje);
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

        public List<Viaje> ViajesDelMes()
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            List<Viaje> lista = new List<Viaje>();
            Viaje unViaje = null;

            SqlCommand cmd = new SqlCommand("ViajesDelMes", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                cnn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Compania unaC = null;
                    Empleado unEmp = null;
                    List<Parada> listaParadas = new List<Parada>();

                    while (reader.Read())
                    {
                        unaC = PersistenciaCompania.GetInstancia().Buscar((string)reader["Nombre"]);
                        unEmp = PersistenciaEmpleado.GetInstancia().Buscar((string)reader["NombUsuario"]);
                        listaParadas = PersistenciaParada.ListarRecorrido((int)reader["CodViaje"]);

                        unViaje = new Viaje((int)reader["CodViaje"], (DateTime)reader["FechaYHoraPartida"], (DateTime)reader["FechaYHoraArribo"], (int)reader["Precio"],
                            (int)reader["Anden"], (int)reader["MaximoPermitido"], unaC, unEmp, listaParadas);

                        lista.Add(unViaje);
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
