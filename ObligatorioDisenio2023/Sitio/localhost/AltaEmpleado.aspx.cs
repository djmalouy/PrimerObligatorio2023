using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class AltaEmpleado : System.Web.UI.Page
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
            Empleado unEmp = new Empleado(txtNombUsuario.Text.Trim(), txtContrasenia.Text, txtNombCompleto.Text.Trim());
            FabricaLogica.GetLogicaEmpleado().Alta(unEmp);
            Limpiar();
            lblError.Text = "El empleado ha sido dado de alta con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void Limpiar()
    {
        txtNombCompleto.Text = "";
        txtNombUsuario.Text = "";
        txtContrasenia.Text = "";
        lblError.Text = "";
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

}