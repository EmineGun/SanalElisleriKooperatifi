<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sepetim.ascx.cs" Inherits="bloklar_sepetim" %>
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
    .auto-style3
    {
        color: #000000;
        font-size: medium;
    }
    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center">ALIŞVERİŞ SEPETİNİZ</td>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top; text-align: center; font-weight: 700;">
            <br />
            <a href="Default.aspx?ad=sepet">
            <span class="auto-style3">Sepetinizde Toplam
            </span>
            <asp:Label ID="lblUrunSayisi" runat="server" CssClass="auto-style3"></asp:Label>
            <span class="auto-style3">&nbsp;Ürün Var..</span></a>
            <br />
            <br />
        </td>
    </tr>
</table>

