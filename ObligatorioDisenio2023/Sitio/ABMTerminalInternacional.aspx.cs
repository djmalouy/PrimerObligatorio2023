using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
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
        Session["Internacional"] = null;
        txtCiudad.Text = "";
        txtCodTerminal.Text = "";
        txtPais.Text = "";
        lblError.Text = "";
        txtCodTerminal.Enabled = true;
        txtCiudad.Enabled = false;
        txtPais.Enabled = false;
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
        btnEliminar.Enabled = false;
        txtCodTerminal.Enabled = false;
        txtCiudad.Enabled = true;
        txtPais.Enabled = true;
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
        txtPais.Enabled = true;
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
            else if (unaTerminal is Internacional)
            {
                Session["Internacional"] = unaTerminal; 
                BotonesBajaModifcar();
                txtCiudad.Text = unaTerminal.Ciudad;
                txtPais.Text = ((Internacional)unaTerminal).Pais;
            }
            else if (unaTerminal is Nacional)
            {
                Limpiar();
                lblError.Text = "Usted ha ingresado un código de terminal Nacional (" + unaTerminal.CodTerminal + ")";
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
        DesactivoBotones();
    }

    protected void btnEliminar_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            FabricaLogica.GetLogicaTerminal().Baja((Internacional)Session["Internacional"]);
            Limpiar();
            DesactivoBotones();

            lblError.Text = "Termina eliminada con éxito.";
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
            string pais = txtPais.Text.Trim();

            if (ciudad.Length <= 3 || ciudad.Length > 40)
                throw new Exception("La ciudad debe tener entre 4 y 40 caracteres.");
            if(pais.Length < 4 || pais.Length > 10)
                throw new Exception("El pais debe tener entre 4 y 10.");

            Internacional unaInternacional = (Internacional)Session["Internacional"];
            unaInternacional.Ciudad = ciudad;
            unaInternacional.Pais = pais;

            FabricaLogica.GetLogicaTerminal().Modificar(unaInternacional);
            Limpiar();
            DesactivoBotones();

            lblError.Text = "Termina modificada con éxito.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}