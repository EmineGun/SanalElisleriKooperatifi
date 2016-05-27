<%@ Control Language="C#" AutoEventWireup="true" CodeFile="urunguncellesil.ascx.cs" Inherits="Admin_moduller_urunguncellesil" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<style type="text/css">

    .auto-style1
    {
        text-align: center;
        color: #FFFFFF;
        font-weight: bold;
        background-color: #0033CC;
    }
    .auto-style2
    {
        width: 212px;
    }
</style>

<asp:DataList ID="DataList1" runat="server">
    <HeaderTemplate>
        <table style="width: 100%;">
            <tr>
                <td><b>Ürün ID</b></td>
                <td><b>Ürün Resmi</b></td>
                <td><b>Ürün Adı</b></td>
                <td><b>Ürün Markası</b></td>
                <td><b>Güncelle</b></td>
                <td><b>Sil</b></td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%#Eval("UrunID") %></td>
            <td><img src="../Urunler/<%#Eval("Resim1") %>" width="70" height="70" alt="Ürün Resmi" /></td>
            <td><%#Eval("UrunAD") %></td>
            <td><%#Eval("MarkaAD") %></td>
            <td><a href="Yonetim.aspx?ad=urunguncellesil&islem=guncelle&id=<%#Eval("UrunID") %>"><img src="images/guncelle.gif" /></a></td>
            <td><a href="Yonetim.aspx?ad=urunguncellesil&islem=sil&id=<%#Eval("UrunID") %>"><img src="images/btn_sil.gif" /></a></td>
        </tr>

    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:DataList>

<cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" FirstText="İlk" LastText="Son" MaxPages="10" NextText="Sonraki »" PageSize="3" ResultsFormat="Sonuçlar{0}-{1} (of {2})" SectionPadding="10">
</cc1:CollectionPager>
<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="3">ÜRÜN GÜNCELLEME İŞLEMİ</td>
        </tr>
        <tr>
            <td class="auto-style2">Ana Kategori Adı:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LinqDataSource1" DataTextField="AKAD" DataValueField="AKID" OnDataBound="DropDownList1_DataBound1">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AnaKategorilers">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Alt Kategori Adı:</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="LinqDataSource2" DataTextField="ALTAD" DataValueField="ALTID" OnDataBound="DropDownList4_DataBound1">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AltKategorilers" Where="AKID == @AKID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="AKID" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Marka Adı:</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="LinqDataSource3" DataTextField="MarkaAD" DataValueField="MarkaID" OnDataBound="DropDownList3_DataBound1">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="Markalars">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Adı:</td>
            <td>
                <asp:TextBox ID="txtUrunAD" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Detay:</td>
            <td>
                <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../Admin/editor/">
                </FCKeditorV2:FCKeditor>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Ürün Fiyatı :</td>
            <td>
                <asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">KDV:</td>
            <td>
                <asp:TextBox ID="txtKDV" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Taksit:</td>
            <td>
                <FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="../Admin/editor/">
                </FCKeditorV2:FCKeditor>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Resim1:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Resim2:</td>
            <td>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Resim3:</td>
            <td>
                <asp:FileUpload ID="FileUpload3" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Resim4:</td>
            <td>
                <asp:FileUpload ID="FileUpload4" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Resim5:</td>
            <td>
                <asp:FileUpload ID="FileUpload5" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Video:</td>
            <td>
                <asp:FileUpload ID="FileUpload6" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Kampanya:</td>
            <td>
                <asp:CheckBox ID="CheckKampanya" runat="server" Text="KAMPANYALI ÜRÜN" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Yayın Durumu:</td>
            <td>
                <asp:CheckBox ID="CheckYayin" runat="server" Text="YAYINLANSIN" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click" Text="ÜRÜN GÜNCELLE" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>


