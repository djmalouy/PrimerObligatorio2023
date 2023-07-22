<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="AltaEmpleado.aspx.cs" Inherits="AltaEmpleado" %>

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
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 582px;
            text-align: right;
        }
        .auto-style8 {
            width: 582px;
            text-align: right;
            height: 26px;
        }
        .auto-style11 {
            height: 22px;
            text-align: center;
        }
        .auto-style12 {
            height: 25px;
            text-align: center;
        }
        .auto-style13 {
            height: 26px;
        }
        .auto-style14 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl="~/Images/AltaEmpleado.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Nombre de Usuario:&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtNombUsuario" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Contraseña:&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style13">
                <asp:TextBox ID="txtContrasenia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Nombre Completo:&nbsp;&nbsp;&nbsp; </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtNombCompleto" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="2">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style14"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11" colspan="2">
                &nbsp;<asp:ImageButton ID="btnLimpiar" runat="server" Height="50px" ImageUrl="~/Images/Limpiar.png" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnAlta" runat="server" Height="50px" ImageUrl="~/Images/Alta.png" />
            </td>
        </tr>
    </table>
</asp:Content>

