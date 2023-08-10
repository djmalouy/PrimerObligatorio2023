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
                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl="~/Images/ListadoDeViajes.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Image ID="Image2" runat="server" Height="40px" ImageUrl="~/Images/Filtros.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Compañía:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlCompania" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Destino final:&nbsp;</strong>&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:DropDownList ID="ddlDestinoFinal" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Fecha:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                <asp:ImageButton ID="btnLimpiar" runat="server" Height="40px" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiar_Click" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnFiltrar" runat="server" Height="40px" ImageUrl="~/Images/Filtrar.png" OnClick="btnFiltrar_Click" />
            </td>
        </tr>
    </table>
    <br />
    <table class="auto-style2">
        <tr>
            <td>
                <asp:GridView ID="GVListadoViajes" runat="server" Width="239px" Align="center" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GVListadoViajes_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="CodViaje" HeaderText="CodViaje" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" />
                        <asp:BoundField DataField="Anden" HeaderText="Anden" />
                        <asp:BoundField DataField="MaximoPermitido" HeaderText="MaximoPermitido" />
                        <asp:BoundField DataField="FechaYHoraPartida" HeaderText="FechaYHoraPartida" />
                        <asp:BoundField DataField="FechaYHoraArribo" HeaderText="FechaYHoraArribo" />
                        <asp:BoundField DataField="EmpleadoCrea.NombUsuario" HeaderText="NomUsuEmp" />
                        <asp:BoundField DataField="CompaniaCrea.Nombre" HeaderText="Compania" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

