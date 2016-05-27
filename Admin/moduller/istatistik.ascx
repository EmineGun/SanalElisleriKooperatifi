<%@ Control Language="C#" AutoEventWireup="true" CodeFile="istatistik.ascx.cs" Inherits="Admin_moduller_istatistik" %>
<style type="text/css">
    .auto-style1
    {
        font-weight: 700;
    }
    .auto-style2
    {
        width: 272px;
        font-weight: bold;
        font-size: large;
    }
    .auto-style3
    {
        font-size: large;
        font-weight: bold;
    }
    .auto-style4
    {
        font-weight: 700;
        text-align: center;
        font-size: large;
    }
</style>

<body style="text-align: center">

<table style="width:100%;">
    <tr>
        <td colspan="3" style="font-weight: 700; text-align: center; color: #FFFFFF; background-color: #0033CC">İSTATİSTİK BİLGİLERİ</td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">TOPLAM ZİYARETÇİ BİLGİSİ:</td>
        <td>
            <asp:Label ID="lblToplamZiyaretci" runat="server" CssClass="auto-style3"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">GÜNLÜK ZİYARETÇİ BİLGİSİ:</td>
        <td>
            <asp:Label ID="lblGunlukZiyaretci" runat="server" CssClass="auto-style3"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="3">EN ÇOK GİRİŞ YAPILAN SAYFADAN EN AZ GİRİŞ YAPILAN SAYFAYA GÖRE SIRALAMA</td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="3">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="3">EN AZ GİRİŞ YAPILAN SAYFADAN EN ÇOK GİRİŞ YAPILAN SAYFAYA GÖRE SIRALAMA</td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="3">
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

