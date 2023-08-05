<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ABMTerminalNacional.aspx.cs" Inherits="ABMTerminalNacional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            width: 550px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            color: #FF0000;
        }
        .auto-style8 {
            width: 211px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td colspan="3" class="auto-style6">
                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl="~/Images/ABMTerminalNacional.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong>Código de Terminal:&nbsp;&nbsp;&nbsp; </strong></td>
            <td class="auto-style8">
                <asp:TextBox ID="txtCodTerminal" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="btnBuscar" runat="server" Height="40px" Width="125px" ImageUrl="~/Images/Buscar.png" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong>Ciudad:&nbsp;&nbsp;&nbsp; </strong></td>
            <td class="auto-style8">
                <asp:TextBox ID="txtCiudad" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3"><strong>¿Dispone de servicio de Taxi?&nbsp;&nbsp;&nbsp; </strong></td>
            <td class="auto-style8">
                <asp:DropDownList ID="ddlTaxi" runat="server">
                    <asp:ListItem>Por favor seleccione</asp:ListItem>
                    <asp:ListItem Value="SI">SI</asp:ListItem>
                    <asp:ListItem Value="NO">NO</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="3">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style7"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="3">
                <asp:ImageButton ID="btnAlta" runat="server" Height="40px" ImageUrl="~/Images/Alta.png" OnClick="btnAlta_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnModificar" runat="server" Height="40px" Width="126px" ImageUrl="~/Images/Modificar.png" OnClick="btnModificar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnEliminar" runat="server" Height="40px" Width="124px" ImageUrl="~/Images/Eliminar.png" OnClick="btnEliminar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnLimpiar" runat="server" Height="40px" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

