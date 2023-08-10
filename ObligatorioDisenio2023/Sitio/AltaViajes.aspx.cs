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
                    ddlTerminal.DataValueField = "CodTerminal"; //Lo que muestra
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

            if (((List<Parada>)Session["ListaParadas"]).Count() == 0)
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
                                    (Empleado)Session["Empleado"], (List<Parada>)Session["ListaParadas"]);
            FabricaLogica.GetLogicaViaje().AltaViaje(unViaje);
            Limpiar();

            lblError.Text = "Alta con Exito";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    private void Limpiar()
    {
        Session["ListaParadas"] = new List<Parada>();
        txtFechaPartida.Text = "";
        txtFechaArribo.Text = "";
        txtPrecio.Text = "";
        ddlAnden.SelectedIndex = -1;
        ddlMaximo.SelectedIndex = -1;
        ddlCompania.SelectedIndex = -1;
        ddlTerminal.SelectedIndex = -1;
        gvParadas.DataBind();
    }

    protected void btnAgregarParada_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            lblError.Text = "";
            List<Parada> listaParadas = (List<Parada>)Session["ListaParadas"];
            int nroParada;

            // Verifico q se haya seleccionado alguna terminal
            if (ddlTerminal.SelectedIndex == 0)
            {
                lblError.Text = "Para agregar una terminal, primero tiene que seleccionar una.";
            }
            else
            {
                if (listaParadas.Count > 0)
                {
                    foreach (Parada P in listaParadas)
                    {
                        if (P.TerminalParada.CodTerminal == ddlTerminal.SelectedValue)
                        {
                            lblError.Text = "ERROR: La parada seleccionada ya esta marcada como parte del recorrido. No se agrega";
                            return;
                        }
                    }
                    //Si listaParadas != null asigno número de parada real
                    nroParada = listaParadas.Count + 1;
                }
                else
                {
                    //Si listaParadas == null asigno número parada 1, inicial
                    nroParada = 1;
                }
                // Es selected index - 1 porque originalmente mis terminales comienzan en 0, pero le agregamos posteriormente el "Por favor seleccione..." en el 0
                Terminal unaTerminal = ((List<Terminal>)Session["ListaTerminales"])[ddlTerminal.SelectedIndex-1];
                Parada unaP = new Parada(nroParada, unaTerminal);

                // Si llego hasta aca, agrega la parada porque no esta en la lista
                listaParadas.Add(unaP);
                gvParadas.DataSource = listaParadas;
                gvParadas.DataBind();
                ddlTerminal.SelectedIndex = -1;
                Session["ListaParadas"] = listaParadas;
            }
        }
        catch (Exception ex)
        {        
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
    }

    protected void gvParadas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        List<Parada> listaParadas = (List<Parada>)Session["ListaParadas"];
        bool bandera = false;
        //Utilizamos una variable bandera para no estar actualizando constantemente si se eliminó la última parada de la grilla.
        if (gvParadas.SelectedIndex != listaParadas.Count - 1)
        {
            bandera = true;
        }
        //Elimino la parada del listado de la session
        //El SelectedIndex es igual a la posición de la parada en la lista (menos 1, porque posterior a armar la lista se agrega el Por favor seleccione)

        listaParadas.RemoveAt(gvParadas.SelectedIndex-1);

        //Actualizo número de parada para que no me queden dispares.
        if (bandera)
        {
            for(int i = 0; i < listaParadas.Count; i++)
            {
                listaParadas[i].NroParada = i + 1;
            }
        }

        Session["ListaParadas"] = listaParadas;
        gvParadas.DataSource = listaParadas;
        gvParadas.DataBind();
    }
}