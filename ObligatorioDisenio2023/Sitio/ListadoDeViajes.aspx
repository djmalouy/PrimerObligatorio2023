<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ListadoDeViajes.aspx.cs" Inherits="ListadoDeViajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style6 {
            color: #FF0000;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">
                <asp:Image ID="Image1" runat="server" Height="60px" Width="289px" ImageUrl="~/Images/ListadoDeViajes.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/Images/Filtros.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Compañía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlCompania" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Destino final:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:DropDownList ID="ddlDestinoFinal" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style6"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:ImageButton ID="btnLimpiar" runat="server" Height="40px" ImageUrl="~/Images/Limpiar.png" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnFiltrar" runat="server" Height="40px" ImageUrl="~/Images/Filtrar.png" />
            </td>
        </tr>
    </table>
    <br />
    <table class="auto-style2">
        <tr>
            <td>
                <asp:GridView ID="GVListadoViajes" runat="server" Width="239px" Align="center" AllowPaging="True">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

