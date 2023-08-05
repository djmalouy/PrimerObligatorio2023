<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ABMTerminalInternacional.aspx.cs" Inherits="ABMTerminalInternacional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 23px;
            text-align: center;
        }
        .auto-style4 {
            height: 24px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            color: #FF0000;
        }
        .auto-style8 {
            height: 26px;
            width: 570px;
            text-align: right;
        }
        .auto-style9 {
            height: 24px;
            width: 570px;
        }
        .auto-style10 {
            width: 570px;
            text-align: right;
        }
        .auto-style12 {
            width: 223px;
        }
        .auto-style13 {
            height: 26px;
            width: 223px;
        }
        .auto-style14 {
            height: 24px;
            width: 223px;
        }
        .auto-style15 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl="~/Images/ABMTerminalInternacional.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>Código de Terminal:</strong></td>
            <td class="auto-style12">
                <asp:TextBox ID="txtCodTerminal" runat="server" Width="207px"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="btnBuscar" runat="server" Height="40px" ImageUrl="~/Images/Buscar.png" OnClick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10"><strong>Ciudad:</strong></td>
            <td class="auto-style12">
                <asp:TextBox ID="txtCiudad" runat="server" Width="205px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>País:</strong></td>
            <td class="auto-style13">
                <asp:TextBox ID="txtPais" runat="server" Width="206px"></asp:TextBox>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style14">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style6"></asp:Label>
            </td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="3">
                <asp:ImageButton ID="btnAlta" runat="server" Height="40px" ImageUrl="~/Images/Alta.png" OnClick="btnAlta_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnModificar" runat="server" Height="40px" Width="131px" ImageUrl="~/Images/Modificar.png" OnClick="btnModificar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnEliminar" runat="server" Height="40px" Width="134px" ImageUrl="~/Images/Eliminar.png" OnClick="btnEliminar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnLimpiar" runat="server" Height="40px" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiar_Click" />
&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

