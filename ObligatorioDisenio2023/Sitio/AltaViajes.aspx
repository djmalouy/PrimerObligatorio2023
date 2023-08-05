<%@ Page Title="" Language="C#" MasterPageFile="~/MPEmpleado.master" AutoEventWireup="true" CodeFile="AltaViajes.aspx.cs" Inherits="AltaViajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            height: 23px;
            text-align: right;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style8 {
            height: 26px;
            text-align: right;
        }
        .auto-style9 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3" colspan="4">
                <asp:Image ID="Image1" runat="server" Height="60px" ImageUrl="~/Images/AltaViajes.png" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6"><strong>Fecha y Hora de Partida:</strong> </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtFechaPartida" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>Fecha y Hora de Arribo:</strong></td>
            <td class="auto-style5">
                <asp:TextBox ID="txtFechaArribo" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Precio: </strong> </td>
            <td>
                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>Anden: </strong> </td>
            <td class="auto-style5">
                <asp:DropDownList ID="ddlAnden" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style5"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Máximo permitido:</strong></td>
            <td>
                <asp:TextBox ID="txtMaximo" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Compañía: </strong> </td>
            <td>
                <asp:DropDownList ID="ddlCompania" runat="server">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlTerminal" runat="server">
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:ImageButton ID="btnAgregarParada" runat="server" Height="40px" ImageUrl="~/Images/AgregarParada.png" OnClick="btnAgregarParada_Click" />
            </td>
            <td colspan="2" rowspan="2">
                <asp:ListBox ID="lbParadas" runat="server" Height="117px" Width="310px"></asp:ListBox>
                <asp:ImageButton ID="btnQuitarParada" runat="server" Height="40px" ImageUrl="~/Images/QuitarParada.png" OnClick="btnQuitarParada_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4">
                <asp:Label ID="lblError" runat="server" CssClass="auto-style9"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4">&nbsp;<asp:ImageButton ID="btnLimpiar" runat="server" Height="50px" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="btnAlta" runat="server" Height="50px" ImageUrl="~/Images/Alta.png" OnClick="btnAlta_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

