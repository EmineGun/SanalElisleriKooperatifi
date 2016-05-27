<%@ Control Language="C#" AutoEventWireup="true" CodeFile="stokguncelle.ascx.cs" Inherits="Admin_moduller_stokguncelle" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<style type="text/css">
    .auto-style1
    {
        height: 26px;
    }
</style>
<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; color: #FFFFFF; font-weight: 700; background-color: #0033CC">STOK GÜNCELLEME BÖLÜMÜ</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:DataList ID="DataList1" runat="server" Width="100%">
                <HeaderTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td><b>Ürün ID</b></td>
                            <td><b>Ürün Resmi</b></td>
                            <td><b>Stok Adı</b></td>
                            <td><b>Mevcut Miktar</b></td>
                            <td><b>Güncelle</b></td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("UrunID") %></td>
                        <td><img src="../Urunler/<%#Eval("UrunResmi") %>" width="70" height="70" alt="Ürün Resmi" /></td>
                        <td><%#Eval("StokAdi") %></td>
                        <td><%#Eval("MevcutMiktar") %></td>
                        <td><a href="Yonetim.aspx?ad=stokguncelle&islem=guncelle&id=<%#Eval("UrunID") %>"><img src="images/guncelle.gif" /></a></td>
        
                         </tr>

                </ItemTemplate>
                <FooterTemplate>
                     </table>
                </FooterTemplate>
            </asp:DataList>
            <br />
            <cc1:CollectionPager ID="CollectionPager1" runat="server">
            </cc1:CollectionPager>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

<asp:Panel ID="Panel1" runat="server" Visible="False">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center; color: #FFFFFF; font-weight: 700; background-color: #0033CC">ÜRÜNE AİT STOK İŞLEMİ</td>
        </tr>
        <tr>
            <td class="auto-style1">İşlem Türü:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Giriş</asp:ListItem>
                    <asp:ListItem>Çıkış</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td>Miktar:</td>
            <td>
                <asp:TextBox ID="txtMiktar" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMiktar" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Fiyat:</td>
            <td>
                <asp:TextBox ID="txtStokFiyat" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStokFiyat" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>KDV:</td>
            <td>
                <asp:TextBox ID="txtStokKDV" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStokKDV" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Stok Türü:</td>
            <td>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="LinqDataSource2" DataTextField="KategoriAdi" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="StokTurus">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Stok Birimi:</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="LinqDataSource3" DataTextField="BirimAdi" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="StokBirimis">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Üretim Tarihi:</td>
            <td>
                <asp:TextBox ID="txtUT" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Son Kullanma Tarihi:</td>
            <td>
                <asp:TextBox ID="txtSKT" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSKT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Ambalaj Şekli:</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="LinqDataSource1" DataTextField="AmbalajSekli1" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AmbalajSeklis">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Mensei:</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>İthal Mal</asp:ListItem>
                    <asp:ListItem>Yerli Mal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Tedarik Süresi:</td>
            <td>
                <asp:TextBox ID="txtTS" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTS" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Ortalama Günlük Satış:</td>
            <td>
                <asp:TextBox ID="txtOGS" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtOGS" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Açıklama:</td>
            <td>
                <asp:TextBox ID="txtAciklama" runat="server" Height="97px" TextMode="MultiLine" Width="270px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnStok" runat="server" Text="STOK GUNCELLE" OnClick="btnStok_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>



