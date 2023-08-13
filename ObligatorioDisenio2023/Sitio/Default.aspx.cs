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
        catch (Exception)
        {
            lblError.Text = "Ha ocurrido un error al comunicarse con la Base de Datos, por favor intetelo más tarde.";
        }
    }

    protected void GVListadoViajes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVListadoViajes.PageIndex = e.NewPageIndex; // Determino a cual pagina se mueve - dato que da la grilla
        GVListadoViajes.DataSource = Session["ViajesSinPartir"]; //recreo la grilla asi calcula  y mustra los registros de esa pagina
        GVListadoViajes.DataBind();
    }

    protected void Logueo_Click(object sender, EventArgs e)
    {
        try
        {
            string Usu = txtUsuario.Text.Trim();
            string Pass = txtPass.Text.Trim();
            Empleado unEmp = null;

            try
            {
                unEmp = FabricaLogica.GetLogicaEmpleado().Logueo(Usu, Pass);
            }
            catch
            {
                throw new Exception("Ha ocurrido un error al comunicarse con la base de datos. Intentelo mas tarde.");
            }
            

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