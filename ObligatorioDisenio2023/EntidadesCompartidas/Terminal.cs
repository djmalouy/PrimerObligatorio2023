using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace EntidadesCompartidas
{
    public abstract class Terminal
    {
        private string _CodTerminal;
        private string _Ciudad;

        public string CodTerminal
        {
            get{return _CodTerminal;}
            set{
                if (value.Length == 6 && Regex.IsMatch(value, "[a-zA-Z]{6}"))
                    _CodTerminal = value;
                else
                    throw new Exception("CodTerminal debe tener exactamente seis letras.");
            }
        }

        public string Ciudad
        {
            get{ return _Ciudad;}
            set{
                if (value.Length > 3 && value.Length < 40)
                    _Ciudad = value;
                else
                    throw new Exception("La ciudad debe tener mínimo entre cuatro y 40 caracteres.");
            }
        }

        public Terminal(string pCodTerminal, string pCiudad)
        {
            CodTerminal = pCodTerminal;
            Ciudad = pCiudad;
        }
    }
}
