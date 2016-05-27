<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uyelikonay.ascx.cs" Inherits="Admin_moduller_uyelikonay" %>
<style type="text/css">
    .auto-style1
    {
        color: #FFFFFF;
        font-weight: bold;
        text-align: center;
    }
    .auto-style2
    {
        width: 434px;
    }
    .auto-style4
    {
    }
    </style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="2" style="background-color: #0033CC">ÜYE TALEP TAKİP BÖLÜMÜ</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table style="width:100%">
                        <tr><td><b>ONAY BEKLEYEN ÜYELER</b></td></tr>
                        <tr>
                            <td><b>Ad Soyad</b></td>
                            <td><b>E-Posta</b></td>
                            <td><b>Bilgileri Oku</b></td>
                            <td><b>Talep Sil</b></td>
                        </tr>
                        
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("UyeAdSoyad") %></td>
                        <td><%#Eval("UyeEposta") %></td>
                        <td><a href="Yonetim.aspx?ad=uyelikonay&islem=oku&id=<%#Eval("UyeID") %>">OKU</a></td>
                        <td><a href="Yonetim.aspx?ad=uyelikonay&islem=sil&id=<%#Eval("UyeID") %>">SİL</a></td>

                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </td>
        <td>
            <asp:Repeater ID="Repeater2" runat="server">
                <HeaderTemplate>
                    <table style="width:100%">
                        <tr><td><b>ONAYLANAN ÜYELER</b></td></tr>
                        <tr>
                            <td><b>Ad Soyad</b></td>
                            <td><b>E-Posta</b></td>
                            <td><b>Bilgileri Oku</b></td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("UyeAdSoyad") %></td>
                        <td><%#Eval("UyeEposta") %></td>
                        <td><a href="Yonetim.aspx?ad=uyelikonay&islem=onaylanmis&id=<%#Eval("UyeID") %>">Oku</a></td>


                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>

<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style4" colspan="2">
                <asp:FormView ID="FormView1" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr><td>Ad Soyad :</td><td><%#Eval("UyeAdSoyad") %></td></tr>
                            <tr><td>E-Posta:</td><td><%#Eval("UyeEposta") %></td></tr>
                            <tr><td>Adres:</td><td><%#Eval("Adres") %></td></tr>
                            <tr><td>İl:</td><td><%#Eval("Sehir") %></td></tr>
                            <tr><td>İlçe:</td><td><%#Eval("ilce") %></td></tr>
                            <tr><td>Telefon:</td><td><%#Eval("GSM") %></td></tr>
                            <tr><td>Eklenme Tarihi:</td><td><%#Eval("EklenmeTarihi") %></td></tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="btnOnay" runat="server" OnClick="btnOnay_Click" Text="TALEP ONAY" Visible="False" />
                <asp:Button ID="btniptal" runat="server" Text="ÜYELİK İPTAL ET" OnClick="btniptal_Click" Visible="False" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Panel>


