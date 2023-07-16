using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace EntidadesCompartidas
{
    public class Compania
    {
        //atributos
        private string _Nombre;
        private string _Direccion;
        private string _Telefono;

        //propiedades
        public string Nombre
        {
            get { return _Nombre;}
            set{
                if (value.Length >= 3 && value.Length <= 30)
                    _Nombre = value;
                else
                    throw new Exception("El nombre de la compañía debe tener entre tres y treinta caracteres.");
            }
        }

        public string Direccion
        {
            get{ return _Direccion;}
            set{
                if(value.Length > 10 && value.Length <= 50)
                    _Direccion = value;
                else
                    throw new Exception("La dirección de la compañía debe tener entre diez y cincuenta caracteres.");
            }
        }

        public string Telefono
        {
            get{return _Telefono;}
            set{
                if(Regex.IsMatch(value, "[0-9]{4,20}") && !Regex.IsMatch(value, "[a-zA-Z]"))
                    _Telefono = value;
                else
                    throw new Exception("El telefono de la compañía debe tener mínimo cuatro y máximo veinte dígitos.");
            }
        }

        public Compania(string pNombre, string pDireccion, string pTelefono)
        {
            Nombre = pNombre;
            Direccion = pDireccion;
            Telefono = pTelefono;
        }
    }
}
