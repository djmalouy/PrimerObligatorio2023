<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ListadoDeViajes.aspx.cs" Inherits="ListadoDeViajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style5 {
            width: 1260px;
        }
        .auto-style6 {
            color: #FF0000;
        }
        .auto-style7 {
            width: 1534px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Image ID="Image1" runat="server" Height="50px" Width="289px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Image ID="Image2" runat="server" Height="33px" Width="173px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Compañía:</td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlCompania" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Destino final:&nbsp; </td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlDestinoFinal" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Fecha: </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtFecha" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style6"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:ImageButton ID="ImageButton1" runat="server" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" />
            </td>
        </tr>
    </table>
    <br />
    <table class="auto-style2">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" Width="239px" Align="center" AllowPaging="True">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

