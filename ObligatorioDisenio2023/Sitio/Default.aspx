<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 1328px;
            text-align: center;
            margin-left: 40px;
        }
        .auto-style3 {
            width: 264px;
            height: 111px;
            }
        .auto-style5 {
            width: 533px;
            height: 94px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            color: #FF0000;
        }
        .auto-style8 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <img alt="" class="auto-style5" src="Images/RuedaMagica.png" /></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INICIO DE SESIÓN<br />
                    Usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="txtUsuario" runat="server" CssClass="auto-style8"></asp:TextBox>
                    <br />
                    Contraseña:&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="121px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Logueo" runat="server" OnClick="Logueo_Click" Text="Login" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GVListadoViajes" runat="server" AllowPaging="True" Align="center" OnPageIndexChanging="GVListadoViajes_PageIndexChanging">
                    </asp:GridView>
                    <br />
                    <asp:Label ID="lblError" runat="server" CssClass="auto-style7"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
