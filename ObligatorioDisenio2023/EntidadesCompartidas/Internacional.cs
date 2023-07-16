using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Internacional : Terminal
    {
        private string _Pais;

        public string Pais
        {
            get{ return Pais; }
            set{
                if (value.Length >= 4 && value.Length <= 10)
                    Pais = value;
                else
                    throw new Exception("El país debe tener entre cuatro y diez caracteres.");
            }
        }

        public Internacional(string pCodTerminal, string pCiudad, string pPais)
            :base(pCodTerminal, pCiudad)
        {
            Pais = pPais;
        }
    }
}
