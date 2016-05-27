<%@ Control Language="C#" AutoEventWireup="true" CodeFile="fatura.ascx.cs" Inherits="Admin_moduller_fatura" %>
<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
    .auto-style2
    {
        height: 23px;
        width: 300px;
    }
    .auto-style3
    {}
    .auto-style5
    {
        width: 310px;
    }
    .auto-style6
    {
        height: 23px;
        width: 310px;
    }
    .auto-style7
    {
        width: 300px;
    }
    .auto-style8
    {
        height: 27px;
    }
</style>
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <table style="width:100%">
            <tr>
                <td style="text-align:center"><b>AD SOYAD</b></td>
                <td style="text-align:center"><b>EPOSTA</b></td>
                <td style="text-align:center"><b>ÖDEME ŞEKLİ</b></td>
                <td style="text-align:center"><b>FATURA</b></td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td style="text-align:center"><%#Eval("AdSoyad") %></td>
            <td style="text-align:center"><%#Eval("UyeEposta") %></td>
            <td style="text-align:center"><%#Eval("OdemeSekli") %></td>
            <td style="text-align:center"><a href="FaturaDetay.aspx?ad=fatura&islem=oku&id=<%#Eval("ID") %>"> FATURA </a></td>
        </tr>

    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

<asp:Panel ID="Panel1" runat="server" Visible="False">
    <table style="width:100%;">
        <tr>
            <td class="auto-style2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/logo.png" />
            </td>
            <td class="auto-style6"></td>
            <td class="auto-style1">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/adres.png" />
            </td>
        </tr>
        <tr>
            <td style="border-style: groove; border-width: thin" class="auto-style7">Sayın,
                <asp:Label ID="lblAdSoyad" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblAdres" runat="server"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>Düzenlenme Tarihi:
                <asp:Label ID="lblGun" runat="server"></asp:Label>
                <br />
                Düzenlenme Saati:
                <asp:Label ID="lblSaat" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DataList ID="DataList1" runat="server" Width="100%">
                    <HeaderTemplate>
                        <table style="border-style: groove; border-width: thin; width:100%">
                            <tr>
                                <td style="border-style: groove; border-width: thin; text-align:center"><b>ÜRÜN KODU</b></td>
                                <td style="border-style: groove; border-width: thin; text-align:center"><b>ÜRÜN ADI</b></td>
                                <td style="border-style: groove; border-width: thin; text-align:center"><b>MİKTARI</b></td>
                                <td style="border-style: groove; border-width: thin; text-align:center""><b>BİRİM FİYATI</b></td>
                                <td style="border-style: groove; border-width: thin; text-align:center"><b>TUTAR</b></td>
                            </tr>
                    </HeaderTemplate>
                  <ItemTemplate>
                        <tr>
                            <td style="text-align:center"><%#Eval("UrunID") %></td>
                            <td style="text-align:center"><%#Eval("UrunAD") %></td>
                            <td style="text-align:center"><%#Eval("Adet") %></td>
                            <td style="text-align:center"><%#Eval("UrunFiyat") %></td>
                            <td style="text-align:center"><%#Convert.ToDouble(Eval("UrunFiyat"))*Convert.ToInt32(Eval("Adet"))%></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:DataList>
                <table style="width:100%;">
                    <tr style="border-style: groove; border-width: thin">
                        <td class="auto-style8"></td>
                        <td class="auto-style8" style="border-style: groove; border-width: thin">TOPLAM</td>
                        <td class="auto-style8" style="border-style: groove; border-width: thin">
                            <asp:Label ID="lbltoplam" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="border-style: groove; border-width: thin">İSKONTO&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbliskonto" runat="server"></asp:Label>
                        </td>
                        <td style="border-style: groove; border-width: thin">
                            <asp:TextBox ID="TextBox1" runat="server" Width="48px"></asp:TextBox>
                            <asp:Button ID="btniskonto" runat="server" OnClick="btniskonto_Click" Text="iskonto" />
                            <asp:Label ID="lbliskontotutar" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="border-style: groove; border-width: thin">NET TUTAR</td>
                        <td style="border-style: groove; border-width: thin">
                            <asp:Label ID="lblNetTutar" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="border-style: groove; border-width: thin">KDV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="8%"></asp:Label>
                        </td>
                        <td style="border-style: groove; border-width: thin">
                            <asp:Label ID="lblKDV" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="border-style: groove; border-width: thin">KARGO</td>
                        <td style="border-style: groove; border-width: thin">
                            <asp:Label ID="lblKargo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="border-style: groove; border-width: thin">ÖDENECEK TUTAR</td>
                        <td style="border-style: groove; border-width: thin">
                            <asp:Label ID="lblode" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="border-style: groove; border-width: thin">
                        <td colspan="3" style="border-style: groove; border-width: thin">
                            <br />
                            YALNIZ<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/faturasarti.png" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">&nbsp;</td>
        </tr>
    </table>
    
    <div style="text-align: center">
        <a class="hlink" href="javascript:onClick=window.print()">Fatura Yazdır</a>
    </div>

</asp:Panel>



