<%@ Control Language="C#" AutoEventWireup="true" CodeFile="kategoriler.ascx.cs" Inherits="bloklar_kategoriler" %>

<style type="text/css">

    .auto-style1
    {
        height: 34px;
    }
    .auto-style2
    {
        width: 100%;
        height: 34px;
        font-weight: bold;
    }
    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center">KATEGORİLER</td>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

<table>
<asp:Repeater ID="rptAnaKategoriler" runat="server" OnItemDataBound="rptAnaKategoriler_ItemDataBound">
    <ItemTemplate>
        <tr><td><a href="Default.aspx?ad=anakategoriurun&id=<%#Eval("AKID") %>"><b> <%#Eval("AKAD") %> </b></a></td></tr>

        <tr>
            <td>

            <asp:Repeater ID="rptAltKategoriler" runat="server">
                <ItemTemplate>
                    <table>
                    <tr><td><img src="../temalar/resim/dot.gif"</td><td><a href="Default.aspx?ad=altkategoriurun&id=<%#Eval("ALTID") %>"><%#Eval("ALTAD") %></a></td></tr>

                    </table>
                </ItemTemplate>

            </asp:Repeater>

            </td>

        </tr>
    </ItemTemplate>
</asp:Repeater>

</table>
        </td>
    </tr>
</table>
