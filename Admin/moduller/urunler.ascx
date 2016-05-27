<%@ Control Language="C#" AutoEventWireup="true" CodeFile="urunler.ascx.cs" Inherits="Admin_moduller_urunler" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

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

<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="3">ÜRÜN EKLEME İŞLEMİ</td>
        </tr>
        <tr>
            <td class="auto-style2">Ana Kategori Adı:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="LinqDataSource1" DataTextField="AKAD" DataValueField="AKID" OnDataBound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AnaKategorilers">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Alt Kategori Adı:</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="LinqDataSource2" DataTextField="ALTAD" DataValueField="ALTID" OnDataBound="DropDownList4_DataBound">
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
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="LinqDataSource3" DataTextField="MarkaAD" DataValueField="MarkaID" OnDataBound="DropDownList3_DataBound">
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
                <asp:Button ID="btnEkle" runat="server" OnClick="btnEkle_Click" Text="ÜRÜN EKLE" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" Visible="False">
    <table style="width:100%;">
        <tr>
            <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">STOK EKLEME BÖLÜMÜ</td>
        </tr>
        <tr>
            <td>İşlem Türü:</td>
            <td>
                <asp:Label ID="lblGiris" runat="server" Text="Giriş"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Miktar:</td>
            <td>
                <asp:TextBox ID="txtMiktar" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMiktar" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Fiyat:</td>
            <td>
                <asp:TextBox ID="txtStokFiyat" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFiyat" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>KDV:</td>
            <td>
                <asp:TextBox ID="txtStokKDV" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKDV" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Stok Türü:</td>
            <td>
                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="LinqDataSource4" DataTextField="KategoriAdi" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="StokTurus">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Stok Birimi:</td>
            <td>
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="LinqDataSource5" DataTextField="BirimAdi" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="StokBirimis">
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUT" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Son Kullanma Tarihi:</td>
            <td>
                <asp:TextBox ID="txtSKT" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSKT" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Ambalaj Şekli:</td>
            <td>
                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="LinqDataSource6" DataTextField="AmbalajSekli1" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource6" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AmbalajSeklis">
                </asp:LinqDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Mensei:</td>
            <td>
                <asp:DropDownList ID="DropDownList8" runat="server">
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTS" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Ortalama Günlük Satış:</td>
            <td>
                <asp:TextBox ID="txtOGS" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtOGS" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Açıklama:</td>
            <td>
                <asp:TextBox ID="txtAciklama" runat="server" Height="126px" TextMode="MultiLine" Width="266px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnStok" runat="server" OnClick="btnStok_Click" Text="STOK EKLE" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>


