using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Nacional: Terminal
    {
        private bool _Taxi;

        public bool Taxi
        {
            get{return _Taxi;}
            set{ _Taxi = value;}
        }

        public Nacional(string pCodTerminal, string pCiudad, bool pTaxi)
            :base(pCodTerminal, pCiudad)
        {
            Taxi = pTaxi;
        }
    }
}
