using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class ABMTerminalInternacional : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Limpiar();
            DesactivoBotones();
        }
    }

    private void Limpiar()
    {
        txtCiudad.Text = "";
        txtCodTerminal.Text = "";
        txtCodTerminal.Enabled = true;
        txtPais.Text = "";
        lblError.Text = "";
    }

    private void DesactivoBotones()
    {
        btnAlta.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
    }

    private void BotonesAlta()
    {
        btnAlta.Enabled = true;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
    }

    private void BotonesBajaModifcar()
    {
        btnAlta.Enabled = false;
        btnEliminar.Enabled = true;
        btnModificar.Enabled = true;
    }

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Internacional unaTerminalInternacional = null;
            Terminal unaTerminal = FabricaLogica.GetLogicaTerminal().BuscarActiva(txtCodTerminal.Text.Trim());

            if (unaTerminal is Internacional)
                unaTerminalInternacional = (Internacional)unaTerminal;
        }
        catch
        {

        }
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        DesactivoBotones();
    }
}