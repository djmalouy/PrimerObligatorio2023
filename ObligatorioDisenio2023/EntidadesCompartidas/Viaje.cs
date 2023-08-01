using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Viaje
    {
        private int _CodViaje;
        private DateTime _FechaYHoraPartida;
        private DateTime _FechaYHoraArribo;
        private int _Precio;
        private int _Anden;
        private int _MaximoPermitido;
        private Compania _CompaniaCrea;
        private Empleado _EmpleadoCrea;
        private List<Parada> _Paradas;

        public int CodViaje
        {
            get{return _CodViaje;}
            set { _CodViaje = value; }
        }

        public DateTime FechaYHoraPartida
        {
            get{return _FechaYHoraPartida;}
            set{ _FechaYHoraPartida = value;}
        }

        public DateTime FechaYHoraArribo
        {
            get{return _FechaYHoraArribo;}

            set{
                if (value > _FechaYHoraPartida)
                    _FechaYHoraArribo = value;
                else
                    throw new Exception("La hora de arribo no puede ser menor o igual que la hora de partida.");
            }
        }

        public int Precio
        {
            get{return _Precio;}
            set{
                if (value > 0)
                    _Precio = value;
                else
                    throw new Exception("El precio no puede ser negativo ni cero.");
            }
        }

        public int Anden
        {
            get{return _Anden;}
            set{
                if (value > 0 && value <= 35)
                    _Anden = value;
                else
                    throw new Exception("El anden debe ser un número entre 1 y 35.");
            }
        }

        public int MaximoPermitido
        {
            get{return _MaximoPermitido;}
            set{
                if (value > 0 && value <= 50)
                    _MaximoPermitido = value;
                else
                    throw new Exception("El maximo permitido debe ser un número entre 1 y 50.");
            }
        }

        public Compania CompaniaCrea
        {
            get{return _CompaniaCrea;}
            set{
                if (value != null)
                    _CompaniaCrea = value;
                else
                    throw new Exception("La compañía no puede ser nula.");
            }
        }

        public Empleado EmpleadoCrea
        {
            get{return _EmpleadoCrea;}
            set{
                if (value != null)
                    _EmpleadoCrea = value;
                else
                    throw new Exception("El empleado no puede ser nulo.");
            }
        }

        public List<Parada> Paradas
        {
            get{return _Paradas;}
            set{
                if (value != null) { 
                    if (value.Count > 0)
                        _Paradas = value;
                    else
                        throw new Exception("No puede haber un viaje sin paradas en su recorrido.");
                }
                else
                    throw new Exception("No puede haber un viaje sin paradas en su recorrido.");
            }
        }

        public Viaje(int pCodViaje, DateTime pFechaPartida, DateTime pFechaArribo, int pPrecio, int pAnden, int pMaxPermitido,
            Compania pCompania, Empleado pEmpleado, List<Parada> pParadas)
        {
            CodViaje = pCodViaje;
            FechaYHoraPartida = pFechaPartida;
            FechaYHoraArribo = pFechaArribo;
            Precio = pPrecio;
            Anden = pAnden;
            MaximoPermitido = pMaxPermitido;
            CompaniaCrea = pCompania;
            EmpleadoCrea = pEmpleado;
            Paradas = pParadas;
        }
    }
}
