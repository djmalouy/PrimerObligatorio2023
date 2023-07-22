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
                    <asp:Login ID="Login" runat="server" DisplayRememberMe="False" RenderOuterTable="False">
                    </asp:Login>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GVListadoViajes" runat="server" AllowPaging="True" Align="center">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
