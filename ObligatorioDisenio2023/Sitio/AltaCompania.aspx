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
            width: 670px;
            text-align: right;
        }
        .auto-style6 {
            width: 670px;
            text-align: right;
        }
        .auto-style7 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Nombre:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Dirección:</td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Teléfono:</td>
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
            <td class="auto-style6">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="41px" ImageUrl="~/Images/Alta.png" Width="81px" />
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" Height="50px" ImageUrl="~/Images/Limpiar.png" />
            </td>
        </tr>
    </table>
</asp:Content>

