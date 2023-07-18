using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using Persistencia;

namespace Logica
{
    internal class LogicaTerminal: ILogicaTerminal
    {
        private static LogicaTerminal instancia = null;
        private LogicaTerminal() { }
        public static LogicaTerminal GetInstancia()
        {
            if (instancia == null)
                instancia = new LogicaTerminal();
            return instancia;
        }

        public Terminal Buscar(string pCodTerminal)
        {
            Terminal unaTerminal = null;
            unaTerminal = FabricaPersistencia.GetPersistenciaNacional().BuscarN(pCodTerminal);
            if (unaTerminal == null)
                unaTerminal = FabricaPersistencia.GetPersistenciaInternacional().BuscarI(pCodTerminal);
            return unaTerminal;
        }

        public Terminal BuscarActiva(string pCodTerminal)
        {
            Terminal unaTerminal = null;
            unaTerminal = FabricaPersistencia.GetPersistenciaNacional().BuscarNActiva(pCodTerminal);
            if (unaTerminal == null)
                unaTerminal = FabricaPersistencia.GetPersistenciaInternacional().BuscarIActiva(pCodTerminal);
            return unaTerminal;
        }

        public void Alta(Terminal pUnaTerminal)
        {
            if (pUnaTerminal is Nacional)
                FabricaPersistencia.GetPersistenciaNacional().AltaN((Nacional)pUnaTerminal);
            else
                FabricaPersistencia.GetPersistenciaInternacional().AltaI((Internacional)pUnaTerminal);
        }

        public void Modificar(Terminal pUnaTerminal)
        {
            if (pUnaTerminal is Nacional)
                FabricaPersistencia.GetPersistenciaNacional().ModificarN((Nacional)pUnaTerminal);
            else
                FabricaPersistencia.GetPersistenciaInternacional().ModificarI((Internacional)pUnaTerminal);
        }

        public void Baja(Terminal pUnaTerminal)
        {
            if (pUnaTerminal is Nacional)
                FabricaPersistencia.GetPersistenciaNacional().BajaN((Nacional)pUnaTerminal);
            else
                FabricaPersistencia.GetPersistenciaInternacional().BajaI((Internacional)pUnaTerminal);
        }

        public List<Terminal> ListarTerminales()
        {
            List<Terminal> _lista = new List<Terminal>();
            _lista.AddRange(FabricaPersistencia.GetPersistenciaNacional().ListarNacionales());
            _lista.AddRange(FabricaPersistencia.GetPersistenciaInternacional().ListarInternacionales());
            return _lista;
        }
    }
}
