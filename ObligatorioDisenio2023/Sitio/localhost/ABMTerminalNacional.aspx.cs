using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntidadesCompartidas;
using Logica;

public partial class ABMTerminalNacional : System.Web.UI.Page
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
        Session["Nacional"] = null;
        txtCiudad.Text = "";
        txtCodTerminal.Text = "";
        ddlTaxi.SelectedIndex = 0;
        lblError.Text = "";
        txtCodTerminal.Enabled = true;
        txtCiudad.Enabled = false;
        ddlTaxi.Enabled = false;
    }

    private void DesactivoBotones()
    {
        btnAlta.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;

        btnAlta.Visible = false;
        btnEliminar.Visible = false;
        btnModificar.Visible = false;
    }

    private void BotonesAlta()
    {
        btnAlta.Enabled = true;
        btnAlta.Visible = true;

        btnEliminar.Enabled = false;
        btnEliminar.Visible = false;

        btnModificar.Enabled = false;
        btnModificar.Visible = false;

        txtCodTerminal.Enabled = false;
        txtCiudad.Enabled = true;
        ddlTaxi.Enabled = true;
    }

    private void BotonesBajaModifcar()
    {
        btnAlta.Enabled = false;
        btnAlta.Visible = false;

        btnEliminar.Enabled = true;
        btnEliminar.Visible = true;

        btnModificar.Enabled = true;
        btnModificar.Visible = true;

        txtCodTerminal.Enabled = false;
        txtCiudad.Enabled = true;
        ddlTaxi.Enabled = true;
    }

    protected void btnLimpiar_Click(object sender, ImageClickEventArgs e)
    {
        Limpiar();
        DesactivoBotones();
    }

    protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string codTerminal = txtCodTerminal.Text.Trim();
            if (codTerminal.Length != 6 || !Regex.IsMatch(codTerminal, "[a-zA-Z]{6}"))
                throw new Exception("El CodTerminal no cuenta con el formato correcto, deben ser 6 letras.");

            Terminal unaTerminal = FabricaLogica.GetLogicaTerminal().BuscarActiva(codTerminal);

            if (unaTerminal == null)
            {
                BotonesAlta();
                lblError.Text = "La terminal no existe, puede proceder a crearla.";
            }
            else if (unaTerminal is Nacional)
            {
                Session["Nacional"] = unaTerminal;
                BotonesBajaModifcar();
                txtCiudad.Text = unaTerminal.Ciudad;
                if (((Nacional)unaTerminal).Taxi)
                    ddlTaxi.SelectedValue = "SI";
                else
                    ddlTaxi.SelectedValue = "NO";
            }
            else if (unaTerminal is Internacional)
            {
                Limpiar();
                lblError.Text = "Usted ha ingresado un código de terminal Internacional (" + unaTerminal.CodTerminal + ")";
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            FabricaLogica.GetLogicaTerminal().Baja((Nacional)Session["Nacional"]);
            Limpiar();
            DesactivoBotones();

            lblError.Text = "Terminal eliminada con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string ciudad = txtCiudad.Text.Trim();
            bool taxi;

            if (ciudad.Length <= 3 || ciudad.Length > 40)
                throw new Exception("La ciudad debe tener entre 4 y 40 caracteres.");

            if (ddlTaxi.SelectedIndex == 0)
                throw new Exception("Debe especificar si la terminal dispone de serivico de taxi.");
            else if (ddlTaxi.SelectedValue == "SI")
                taxi = true;
            else
                taxi = false;

            Nacional unaNacional = (Nacional)Session["Nacional"];
            unaNacional.Ciudad = ciudad;
            unaNacional.Taxi = taxi;

            FabricaLogica.GetLogicaTerminal().Modificar(unaNacional);
            Limpiar();
            DesactivoBotones();

            lblError.Text = "Terminal modificada con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnAlta_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string ciudad = txtCiudad.Text.Trim();
            bool taxi;

            if (ciudad.Length <= 3 || ciudad.Length > 40)
                throw new Exception("La ciudad debe tener entre 4 y 40 caracteres.");

            if (ddlTaxi.SelectedIndex == 0)
                throw new Exception("Debe especificar si la terminal dispone de serivico de taxi.");
            else if (ddlTaxi.SelectedValue == "SI")
                taxi = true;
            else
                taxi = false;

            Nacional unaNacional = new Nacional(txtCodTerminal.Text.Trim(), ciudad, taxi);

            FabricaLogica.GetLogicaTerminal().Alta(unaNacional);
            Limpiar();
            DesactivoBotones();

            lblError.Text = "Terminal creada con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}