using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using EntidadesCompartidas;

namespace Logica
{
    public interface ILogicaViaje
    {

        void AltaViaje(Viaje unViaje);
        List<Viaje> ViajesSinPartir();
        List<Viaje> ViajesDelMes();
    }
}
