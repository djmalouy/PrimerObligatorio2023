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
                List<Viaje> listaViajes = new List<Viaje>();
                List<Compania> listaCompanias = new List<Compania>();
                List<Terminal> listaTerminales = new List<Terminal>();

                try
                {
                    listaViajes = FabricaLogica.GetLogicaViaje().ViajesDelMes();
                    listaCompanias = FabricaLogica.GetLogicaCompania().ListarCompanias();
                    listaTerminales = FabricaLogica.GetLogicaTerminal().ListarTerminales();
                }
                catch
                {
                    lblError.Text = "Ha ocurrido un error al comunicarse con la base de datos - Intentelo denuevo más tarde.";
                }
                // Obtengo todos los viajes sin filtrar
                // No se controla que listaViajes sea nula porque la operacion ViajesDelMes retorna siempre una lista vacía en caso que no hayan viajes
                if (listaViajes.Count() > 0)
                {
                    Session["ListaViajes"] = listaViajes;
                    GVListadoViajes.DataSource = Session["ListaViajes"];
                    GVListadoViajes.DataBind();
                }
                else
                {
                    btnFiltrar.Enabled = false;
                    throw new Exception("ATENCIÓN: No hay viajes para el mes actua.");
                }

                // Traigo todas las companias
                Session["ListaCompanias"] = listaCompanias;
                ddlCompania.DataSource = Session["ListaCompanias"];
                ddlCompania.DataTextField = "Nombre";
                ddlCompania.DataBind();
                ddlCompania.Items.Insert(0, new ListItem("Por favor seleccione...", "Por favor seleccione..."));

                // Traigo todas las ciudades de las terminales activas
                Session["ListaTerminales"] = listaTerminales;
                ddlDestinoFinal.DataSource = Session["ListaTerminales"];
                ddlDestinoFinal.DataTextField = "Ciudad"; //Lo que muestra
                ddlDestinoFinal.DataValueField = "CodTerminal";
                ddlDestinoFinal.DataBind();
                ddlDestinoFinal.Items.Insert(0, new ListItem("Por favor seleccione...", "Por favor seleccione..."));

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
            // Si seleccionan algo en el primer drop
            if (ddlCompania.SelectedValue != "Por favor seleccione...")
            {
                //Se debera tener en cuenta Compania para filtrar
                ListaTotal = (from unV in ListaTotal
                              where unV.CompaniaCrea.Nombre == ddlCompania.SelectedValue
                              select unV).ToList<Viaje>();
            }

            // Si seleccionan algo en el segundo drop
            if (ddlDestinoFinal.SelectedValue != "Por favor seleccione...")
            {
                //Se debera tener en cuenta Destino para filtrar
                ListaTotal = (from viaje in ListaTotal
                              where viaje.Paradas.Last().TerminalParada.CodTerminal == ddlDestinoFinal.SelectedValue
                              select viaje).ToList();
            }

            // Si ingresan una fecha
            if (txtFecha.Text != "")
            {
                DateTime fechaPartida = new DateTime();

                try
                {
                    fechaPartida = Convert.ToDateTime(txtFecha.Text);
                }
                catch
                {
                    throw new Exception("Error al convertir la fecha.");
                }
                //Se debera tener en cuenta la fecha de partida
                ListaTotal = (from viaje in ListaTotal
                              where viaje.FechaYHoraPartida == Convert.ToDateTime(fechaPartida)
                              select viaje
                                ).ToList();
            }

            GVListadoViajes.DataSource = ListaTotal;
            GVListadoViajes.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}