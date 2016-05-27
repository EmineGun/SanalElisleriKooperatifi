<%@ Control Language="C#" AutoEventWireup="true" CodeFile="anakategoriler.ascx.cs" Inherits="Admin_moduller_anakategoriler" %>
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
        width: 145px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="3">ANA KATEGORİ İŞLEMLERİ</td>
    </tr>
    <tr>
        <td class="auto-style2">Ana Kategori Adı:</td>
        <td>
            <asp:TextBox ID="txtAKAD" runat="server" Width="221px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="btnEkle" runat="server" OnClick="btnEkle_Click" Text="EKLE" Width="100px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<asp:GridView ID="grdAnaKategoriler" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="grdAnaKategoriler_RowCancelingEdit" OnRowEditing="grdAnaKategoriler_RowEditing" OnRowUpdating="grdAnaKategoriler_RowUpdating">
    <Columns>
        <asp:TemplateField HeaderText="Ana Kategori ID">
            <ItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%#Eval("AKID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ana Kategori ADI">
            <EditItemTemplate>
                <asp:TextBox ID="txtAD" runat="server" Text='<%#Eval("AKAD") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <%#Eval("AKAD") %>
            </ItemTemplate>

        </asp:TemplateField>
        <asp:TemplateField HeaderText="SİL">
            <ItemTemplate>
            <asp:ImageButton ID="btnSil" ImageUrl="~/Admin/images/icon_delete.png" runat="server" CommandArgument='<%#Eval("AKID") %>' OnClick="AnaKategoriSil" OnClientClick="return confirm('Silmek istiyor musunuz?')" />
            </ItemTemplate>

        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
    </Columns>
</asp:GridView>

