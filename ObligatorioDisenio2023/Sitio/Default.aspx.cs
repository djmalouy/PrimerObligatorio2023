using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Empleado"] = null;

        try
        {
            List<Viaje> listaViajes = FabricaLogica.GetLogicaViaje().ViajesSinPartir();
            Session["ViajesSinPartir"] = listaViajes; //Se guarda en Session para la paginacion. 
            GVListadoViajes.DataSource = listaViajes;
            GVListadoViajes.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void GVListadoViajes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVListadoViajes.PageIndex = e.NewPageIndex; // Determino a cual pagina se mueve - dato que da la grilla
        GVListadoViajes.DataSource = Session["ViajesSinPartir"]; //recreo la grilla asi calcula  y mustra los registros de esa pagina
        GVListadoViajes.DataBind();
    }

    protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        try
        {
            string Usu = Login.UserName.Trim();
            string Pass = Login.Password.Trim();
            Empleado unEmp = FabricaLogica.GetLogicaEmpleado().Logueo(Usu, Pass);

            if (unEmp == null)
            {
                lblError.Text = "Usuario o contraseña incorrecto.";
            }
            else
            {
                Session["Empleado"] = unEmp;
                Response.Redirect("~/AltaViajes.aspx");
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}