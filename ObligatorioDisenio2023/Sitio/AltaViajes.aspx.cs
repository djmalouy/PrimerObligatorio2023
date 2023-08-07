using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class AltaViajes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            try
            {
                Limpiar();

                List<Compania> listaCompanias = new List<Compania>();
                List<Terminal> listaTerminales = new List<Terminal>();

                try
                {
                    listaCompanias = FabricaLogica.GetLogicaCompania().ListarCompanias();
                    listaTerminales = FabricaLogica.GetLogicaTerminal().ListarTerminales();
                }
                catch
                {
                    lblError.Text = "Ha ocurrido un error al comunicarse con la base de datos - Intentelo denuevo más tarde.";
                }

                if (listaTerminales.Count() > 0 && listaCompanias.Count() > 0)
                {
                    // Traigo todas las ciudades de las terminales activas
                    Session["ListaTerminales"] = listaTerminales;
                    ddlTerminal.DataSource = Session["ListaTerminales"];
                    ddlTerminal.DataTextField = "Ciudad"; //Lo que muestra
                    ddlTerminal.DataValueField = "CodTerminal";
                    ddlTerminal.DataBind();
                    ddlTerminal.Items.Insert(0, new ListItem("Por favor seleccione...", "Por favor seleccione..."));

                    // Traigo todas las companias
                    Session["ListaCompanias"] = listaCompanias;
                    ddlCompania.DataSource = Session["ListaCompanias"];
                    ddlCompania.DataTextField = "Nombre";
                    ddlCompania.DataBind();
                    ddlCompania.Items.Insert(0, new ListItem("Por favor seleccione...", "Por favor seleccione..."));
                    btnAgregarParada.Enabled = true;
                    btnAgregarParada.Visible = true;
                    btnAlta.Enabled = true;
                    btnAlta.Visible = true;
                }
                else
                {
                    btnAgregarParada.Enabled = false;
                    btnAgregarParada.Visible = false;
                    btnAlta.Enabled = false;
                    btnAlta.Visible = false;
                    throw new Exception("ATENCIÓN: El sistema debe tener al menos una Compañía y al menos una Terminal para poder cargar un viaje.");
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }

    protected void btnAlta_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Viaje unViaje = null;
            Compania unaCompania = null;
            DateTime fechaPartida;
            DateTime fechaArribo;
            int precio;

            if (lbParadas.Items.Count == 0)
            {
                throw new Exception("Debe seleccionar al menos una parada al recorrido del viaje.");
            }

            if(ddlCompania.SelectedIndex != 0)
            {
                unaCompania = ((List<Compania>)Session["ListaCompanias"])[ddlCompania.SelectedIndex];
            }

            try
            {
                fechaArribo = Convert.ToDateTime(txtFechaArribo.Text);
                fechaPartida = Convert.ToDateTime(txtFechaPartida.Text);
            }
            catch (Exception)
            {
                throw new Exception("Revise el formato de la fecha de partida y/o arribo, una de las dos es incorrecta.");
            }

            try
            {
                precio = Convert.ToInt32(txtPrecio.Text.Trim());
            }
            catch (Exception)
            {
                throw new Exception("El precio debe ser numérico.");
            }

            if (precio <= 0)
            {
                throw new Exception("El precio debe ser un número positivo.");
            }

            unViaje = new Viaje(0, fechaPartida, fechaArribo, precio, 
                                    Convert.ToInt32(ddlAnden.SelectedValue), Convert.ToInt32(ddlMaximo.SelectedValue), unaCompania,
                                    (Empleado)Session["Empleado"], CargoListaParadas());
            FabricaLogica.GetLogicaViaje().AltaViaje(unViaje);
            Limpiar();

            lblError.Text = "Alta con Exito";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private List<Parada> CargoListaParadas()
    {
        List<Parada> ListaParadas = new List<Parada>();
        Terminal unaTerminal = null;
        int nroParada = 1;
        foreach (ListItem unaParada in lbParadas.Items)
            try
            {
                unaTerminal = FabricaLogica.GetLogicaTerminal().BuscarActiva(unaParada.Text.Trim());
            }
            catch
            {
                throw new Exception("Ha ocurrido un error con la base de datos. Intentelo denuevo mas tarde.");
            }
            ListaParadas.Add(new Parada(nroParada, unaTerminal));
            nroParada ++;

        return ListaParadas;
    }

    private void Limpiar()
    {
        txtFechaPartida.Text = "";
        txtFechaArribo.Text = "";
        txtPrecio.Text = "";
        ddlAnden.SelectedIndex = -1;
        ddlMaximo.SelectedIndex = -1;
        ddlCompania.SelectedIndex = -1;
        ddlTerminal.SelectedIndex = -1;
        lbParadas.Items.Clear();
    }

    protected void btnAgregarParada_Click(object sender, ImageClickEventArgs e)
    {
        lblError.Text = "";

        // Verifico q se haya seleccionado alguna terminal
        if (ddlTerminal.SelectedValue == "Por favor seleccione...")
        {
            lblError.Text = "Para agregar una terminal, primero tiene que seleccionar una.";
        }
        else
        {
            foreach (ListItem item in lbParadas.Items)
            {
                if (item.Value == ddlTerminal.SelectedValue)
                {
                    lblError.Text = "ERROR: La parada seleccionada ya esta marcada como parte del recorrido. No se agrega";
                    return;
                }
            }
            
            // Si llego hasta aca, agrega la parada porque no esta en la lista
            lbParadas.Items.Add(ddlTerminal.SelectedValue);
            ddlTerminal.SelectedIndex = -1;
        }

    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

    protected void btnQuitarParada_Click(object sender, ImageClickEventArgs e)
    {
        // Verifico que se haya seleccionado una parada
        if (lbParadas.SelectedIndex >= 0)
        {
            lbParadas.Items.RemoveAt(lbParadas.SelectedIndex);
            lblError.Text = "Se eliminó correctamente la parada del recorrido.";
        }
        else
            lblError.Text = "Debe seleccionar qué parada desea eliminar.";
    }
}