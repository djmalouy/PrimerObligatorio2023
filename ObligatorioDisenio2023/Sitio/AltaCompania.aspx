<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="AltaCompania.aspx.cs" Inherits="AltaCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
            width: 594px;
            text-align: right;
        }
        .auto-style6 {
            width: 594px;
            text-align: right;
        }
        .auto-style7 {
            color: #FF0000;
        }
        .auto-style8 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td colspan="2" class="auto-style8">
                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl="~/Images/AltaCompania.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>Nombre:</strong></td>
            <td class="auto-style3">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6"><strong>Dirección:</strong></td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6"><strong>Teléfono:</strong></td>
            <td>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style7"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <asp:ImageButton ID="btnAlta" runat="server" Height="40px" ImageUrl="~/Images/Alta.png" OnClick="btnAlta_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnLimpiar" runat="server" Height="40px" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

