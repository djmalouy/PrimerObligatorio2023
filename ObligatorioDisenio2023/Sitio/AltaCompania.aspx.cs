using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class AltaCompania : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Limpiar();
        }
    }

    protected void btnAlta_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Compania unaC = new Compania(txtNombre.Text.Trim(), txtDireccion.Text.Trim(), txtTelefono.Text.Trim());
            FabricaLogica.GetLogicaCompania().AltaCompania(unaC);
            Limpiar();
            lblError.Text = "La compañía ha sido dada de alta con éxito.";
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

    private void Limpiar()
    {
        txtNombre.Text = "";
        txtDireccion.Text = "";
        txtTelefono.Text = "";
        lblError.Text = "";
    }
}