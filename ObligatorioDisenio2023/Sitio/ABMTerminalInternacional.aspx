<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="ABMTerminalInternacional.aspx.cs" Inherits="ABMTerminalInternacional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 23px;
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
            width: 682px;
            text-align: right;
        }
        .auto-style9 {
            height: 24px;
            width: 682px;
        }
        .auto-style10 {
            width: 682px;
            text-align: right;
        }
        .auto-style11 {
            text-align: center;
            width: 146px;
        }
        .auto-style12 {
            width: 146px;
        }
        .auto-style13 {
            height: 26px;
            width: 146px;
        }
        .auto-style14 {
            height: 24px;
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3" colspan="3"></td>
        </tr>
        <tr>
            <td class="auto-style10">Código de Terminal:</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" Width="138px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Ciudad:</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">País:</td>
            <td class="auto-style13">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
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
            <td class="auto-style10">
                <asp:ImageButton ID="ImageButton2" runat="server" Height="50px" ImageUrl="~/Images/Alta.png" />
            </td>
            <td class="auto-style11">
                <asp:ImageButton ID="ImageButton3" runat="server" Height="32px" Width="131px" />
            </td>
            <td>
                <asp:ImageButton ID="ImageButton4" runat="server" Height="41px" Width="134px" />
            </td>
        </tr>
    </table>
</asp:Content>

