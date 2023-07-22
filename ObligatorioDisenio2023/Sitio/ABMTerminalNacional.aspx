<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ABMTerminalNacional.aspx.cs" Inherits="ABMTerminalNacional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            width: 634px;
        }
        .auto-style4 {
            width: 12px;
        }
        .auto-style5 {
            width: 12px;
            text-align: center;
        }
        .auto-style6 {
            text-align: center;
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
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Código de Terminal:</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" Width="125px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Ciudad:</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Dispone de servicio de Taxi?</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>SI</asp:ListItem>
                    <asp:ListItem>NO</asp:ListItem>
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
            <td class="auto-style3">
                <asp:ImageButton ID="ImageButton2" runat="server" Height="50px" ImageUrl="~/Images/Alta.png" />
            </td>
            <td class="auto-style5">
                <asp:ImageButton ID="ImageButton3" runat="server" Height="36px" Width="126px" />
            </td>
            <td>
                <asp:ImageButton ID="ImageButton4" runat="server" Height="34px" Width="124px" />
            </td>
        </tr>
    </table>
</asp:Content>

