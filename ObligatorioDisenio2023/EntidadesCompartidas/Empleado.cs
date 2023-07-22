using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Empleado
    {
        private string _NombUsuario;
        private string _Contrasenia;
        private string _NombCompleto;

        public string NombUsuario
        {
            get{return _NombUsuario;}
            set{
                if (value.Length == 8)
                    _NombUsuario = value;
                else
                    throw new Exception("El nombre de usuario debe tener exactamente ocho caracteres.");
            }
        }

        public string Contrasenia
        {
            get{return _Contrasenia;}
            set{
                if (value.Length == 6)
                {
                    int numero = 0;
                    int letra = 0;
                    foreach (char ch in value)
                    {
                        if (char.IsLetter(ch))
                            letra++;
                        else if (char.IsNumber(ch))
                            numero++;
                    }
                    if (numero == 3 && letra == 3)
                        _Contrasenia = value;
                    else
                        throw new Exception("La contraseña debe tener exactamentre tres números y tres letras.");
                }
                else
                    throw new Exception("La contraseña debe tener exactamente seis caracteres: tres números y tres letras.");
            }
        }

        public string NombCompleto
        {
            get{return _NombCompleto;}
            set{
                if(value.Length > 7 && value.Length <= 50)
                    _NombCompleto = value;
                else
                    throw new Exception("El nombre de completo debe tener entre ocho y cincuenta caracteres.");
            }
        }

        public Empleado(string pNomUsu, string pContr, string pNomCom)
        {
            NombUsuario = pNomUsu;
            Contrasenia = pContr;
            NombCompleto = pNomCom;
        }
    }
}
