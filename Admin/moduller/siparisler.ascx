<%@ Control Language="C#" AutoEventWireup="true" CodeFile="siparisler.ascx.cs" Inherits="Admin_moduller_siparisler" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<table style="width:100%;">
    <tr>
        <td colspan="2" style="text-align: center; color: #FFFFFF; background-color: #0033CC">SİPARİŞLER</td>
    </tr>
    <tr>
        <td>ONAYLANMAYAN SİPARİŞLER</td>
        <td>ONAYLANAN SİPARİŞLER</td>
    </tr>
    <tr>
        <td>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>IP</td>
                            <td>Gönderen Kişi</td>
                            <td>Ödeme Şekli</td>
                            <td>OKU</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("IP") %></td>
                        <td><%#Eval("UyeEposta") %></td>
                        <td><%#Eval("OdemeSekli") %></td>
                        <td><a href="Yonetim.aspx?ad=siparisler&islem=oku&id=<%#Eval("ID") %>">OKU</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
            <cc1:CollectionPager ID="CollectionPager1" runat="server" PageSize="10">
            </cc1:CollectionPager>
        </td>
        <td style="vertical-align: text-top">
            <asp:Repeater ID="Repeater2" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>IP</td>
                            <td>Gönderen Kişi</td>
                            <td>Ödeme Şekli</td>
                            <td>OKU</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("IP") %></td>
                        <td><%#Eval("UyeEposta") %></td>
                        <td><%#Eval("OdemeSekli") %></td>
                        <td><a href="Yonetim.aspx?ad=siparisler&islem=onaylanmis&id=<%#Eval("ID") %>">OKU</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
            <cc1:CollectionPager ID="CollectionPager2" runat="server" PageSize="10">
            </cc1:CollectionPager>
        </td>
    </tr>
</table>

<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:FormView ID="FormView1" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr><td>IP:</td><td><%#Eval("IP") %></td></tr>
                            <tr><td>Ad Soyad:</td><td><%#Eval("AdSoyad") %></td></tr>
                            <tr><td>Adres:</td><td><%#Eval("Adres") %></td></tr>
                            <tr><td>Ülke:</td><td><%#Eval("Ulke") %></td></tr>
                            <tr><td>İl:</td><td><%#Eval("il") %></td></tr>
                            <tr><td>İlçe:</td><td><%#Eval("ilce") %></td></tr>
                            <tr><td>Telefon:</td><td><%#Eval("GSM") %></td></tr>
                            <tr><td>PostaKodu:</td><td><%#Eval("PostaKodu") %></td></tr>
                            <tr><td>Eposta:</td><td><%#Eval("UyeEposta") %></td></tr>
                            <tr><td>Kargo:</td><td><%#Eval("Kargo") %></td></tr>
                            <tr><td>Kargo Notu:</td><td><%#Eval("KargoNotu") %></td></tr>
                            <tr><td>Sipariş Notu:</td><td><%#Eval("SiparisNotu") %></td></tr>
                            <tr><td>Yatıracağı Banka Hesabı:</td><td><%#Eval("BankaHesap") %></td></tr>
                            <tr><td>Toplam Tutar:</td><td><%#Eval("ToplamTutar") %></td></tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="FormView2" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr><td>UrunID</td><td><%#Eval("UrunID") %></td></tr>
                            <tr><td>Adet:</td><td><%#Eval("Adet") %></td></tr>
                            <tr><td>Sipariş Tarihi:</td><td><%#Eval("EklenmeTarihi") %></td></tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnOnayla" runat="server" OnClick="btnOnayla_Click" Text="Sipariş Onayla" Visible="False" />
            </td>
        </tr>
    </table>
</asp:Panel>


