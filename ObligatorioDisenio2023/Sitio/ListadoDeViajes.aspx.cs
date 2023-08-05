using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class ListadoDeViajes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //obtengo todos los viajes sin filtrar
                List<Viaje> listaViajes = FabricaLogica.GetLogicaViaje().ViajesDelMes();
                Session["ListaViajes"] = listaViajes;
                GVListadoViajes.DataSource = Session["ListaViajes"];
                GVListadoViajes.DataBind();

                //traigo todas las companias
                Session["ListaCompanias"] = FabricaLogica.GetLogicaCompania().ListarCompanias();
                ddlCompania.DataSource = Session["ListaCompanias"];
                ddlCompania.DataTextField = "Nombre";
                ddlCompania.DataBind();

                //traigo todas las ciudades de las terminales activas
                Session["ListaTerminales"] = FabricaLogica.GetLogicaTerminal().ListarTerminales();
                ddlDestinoFinal.DataSource = Session["ListaTerminales"];
                ddlDestinoFinal.DataTextField = "Ciudad"; //Lo que muestra
                ddlDestinoFinal.DataBind();

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }

    private void Limpiar()
    {
        ddlCompania.SelectedIndex = -1;
        ddlDestinoFinal.SelectedIndex = -1;
        txtFecha.Text = "";
        lblError.Text = "";
    }

    protected void GVListadoViajes_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVListadoViajes.PageIndex = e.NewPageIndex; 
        GVListadoViajes.DataSource = Session["ListaViajes"]; 
        GVListadoViajes.DataBind();
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

    protected void btnFiltrar_Click(object sender, ImageClickEventArgs e)
    {
        List<Viaje> ListaTotal = (List<Viaje>)Session["ListaViajes"];

        try
        {
            if (ddlCompania.SelectedValue != "Por favor seleccione...")
            {
                //Se debera tener en cuenta Compania para filtrar
                ListaTotal = (from unV in ListaTotal
                              where unV.CompaniaCrea.Nombre == ddlCompania.SelectedValue
                              select unV).ToList<Viaje>();
                

            }

            if (ddlDestinoFinal.SelectedValue != "Por favor seleccione...")
            {
                //Se debera tener en cuenta Destino para filtrar
                ListaTotal = (from unV in ListaTotal
                              from unaP in unV.Paradas
                              where unaP.TerminalParada == ddlCompania.SelectedValue
                              select unV).ToList<Viaje>();


            }

            GVListadoViajes.DataSource = ListaTotal;
            GVListadoViajes.DataBind();
        }
        catch (Exception)
        {

            throw;
        }
    }
}
