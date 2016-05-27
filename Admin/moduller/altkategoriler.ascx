<%@ Control Language="C#" AutoEventWireup="true" CodeFile="altkategoriler.ascx.cs" Inherits="Admin_moduller_altkategoriler" %>
<style type="text/css">
    .auto-style1
    {
        text-align: center;
        color: #FFFFFF;
        font-weight: 700;
        background-color: #0033CC;
    }
    .auto-style2
    {
        width: 153px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="3">ALT KATEGORİ İŞLEMLERİ</td>
    </tr>
    <tr>
        <td class="auto-style2">Ana Kategori Adı:</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="AKAD" DataValueField="AKID" OnDataBound="DropDownList1_DataBound">
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AnaKategorilers">
            </asp:LinqDataSource>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">Alt Kategori Adı:</td>
        <td>
            <asp:TextBox ID="txtALTAD" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="btnEkle" runat="server" OnClick="btnEkle_Click" Text="EKLE" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<asp:GridView ID="grdAltKategoriler" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCancelingEdit="grdAltKategoriler_RowCancelingEdit" OnRowEditing="grdAltKategoriler_RowEditing" OnRowUpdating="grdAltKategoriler_RowUpdating" >
    <AlternatingRowStyle BackColor="#F7F7F7" />
    <Columns>
        <asp:TemplateField HeaderText="Alt Kategori ID">
            <ItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%#Eval("ALTID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Alt Kategori AD">
            <EditItemTemplate>
                <asp:TextBox ID="txtAD" runat="server" Text='<%#Eval("ALTAD") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <%#Eval("ALTAD") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ana Kategori AD">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource1" DataTextField="AKAD" DataValueField="AKID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="AnaKategorilers">
                </asp:LinqDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <%#Eval("AKAD") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="SİL">
            <ItemTemplate>
                <asp:ImageButton ID="btnsil" ImageUrl="~/Admin/images/icon_delete.png" runat="server"  CommandArgument='<%#Eval("ALTID") %>' OnClick="AltKategorileriSil" OnClientClick="return confirm('Silmek istiyor musunuz?')"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
    </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <SortedAscendingCellStyle BackColor="#F4F4FD" />
    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
    <SortedDescendingCellStyle BackColor="#D8D8F0" />
    <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>

