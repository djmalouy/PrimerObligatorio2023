using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntidadesCompartidas
{
    public class Parada
    {
        private int _NroParada;
        private Terminal _TerminalParada;

        public int NroParada
        {
            get{return _NroParada;}
            set{
                if (value > 0)
                    _NroParada = value;
                else
                    throw new Exception("La parada no puede ser negativa ni cero.");
            }
        }

        public Terminal TerminalParada
        {
            get{return _TerminalParada;}
            set{
                if (value != null)
                    _TerminalParada = value;
                else
                    throw new Exception("La terminal asignada no puede ser nula.");
            }
        }

        public Parada(int pNroParada, Terminal pTerminal)
        {
            _NroParada = pNroParada;
            _TerminalParada = pTerminal;
        }
    }
}
