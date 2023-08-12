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
            width: 223px;
        }
        .auto-style7 {
            text-align: right;
            width: 223px;
        }
        .auto-style8 {
            height: 26px;
            text-align: right;
            width: 223px;
        }
        .auto-style9 {
            color: #FF0000;
        }
        .auto-style10 {
            height: 23px;
            width: 319px;
        }
        .auto-style11 {
            height: 26px;
            width: 319px;
        }
        .auto-style12 {
            width: 319px;
        }
        .auto-style13 {
            width: 223px;
        }
        .auto-style14 {
            text-align: right;
            width: 223px;
            height: 83px;
        }
        .auto-style15 {
            width: 319px;
            height: 83px;
        }
        .auto-style16 {
            height: 23px;
            width: 307px;
        }
        .auto-style17 {
            height: 26px;
            width: 307px;
        }
        .auto-style18 {
            width: 307px;
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
            <td class="auto-style10">
                <asp:TextBox ID="txtFechaPartida" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style16">&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>Fecha y Hora de Arribo:</strong></td>
            <td class="auto-style11">
                <asp:TextBox ID="txtFechaArribo" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style17"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Precio: </strong> </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"><strong>Anden: </strong> </td>
            <td class="auto-style11">
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
            <td class="auto-style17"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Máximo pasajeros permitido:</strong></td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlMaximo" runat="server">
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
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>41</asp:ListItem>
                    <asp:ListItem>42</asp:ListItem>
                    <asp:ListItem>43</asp:ListItem>
                    <asp:ListItem>44</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>46</asp:ListItem>
                    <asp:ListItem>47</asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                    <asp:ListItem>49</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"><strong>Compañía: </strong> </td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlCompania" runat="server">
                </asp:DropDownList>
            </td>
            <td class="auto-style18">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14"><strong>Seleccionar terminal:</strong></td>
            <td class="auto-style15">
                <asp:DropDownList ID="ddlTerminal" runat="server">
                </asp:DropDownList>
&nbsp;&nbsp;
                <asp:ImageButton ID="btnAgregarParada" runat="server" Height="27px" ImageUrl="~/Images/AgregarParada.png" OnClick="btnAgregarParada_Click" />
            </td>
            <td colspan="2" rowspan="2">
                <asp:GridView ID="gvParadas" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvParadas_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="NroParada" HeaderText="Parada"></asp:BoundField>
                        <asp:BoundField DataField="TerminalParada.Ciudad" HeaderText="Ciudad" />
                        <asp:CommandField SelectText="Quitar Parada" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
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

