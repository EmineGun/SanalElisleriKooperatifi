<%@ Control Language="C#" AutoEventWireup="true" CodeFile="markalar.ascx.cs" Inherits="Admin_moduller_markalar" %>
<style type="text/css">
    .auto-style1
    {
        text-align: left;
        color: #FFFFFF;
        font-weight: bold;
        background-color: #0066FF;
    }
    .auto-style2
    {
        width: 130px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="3">MARKA İŞLEMLERİ</td>
    </tr>
    <tr>
        <td class="auto-style2">Marka Adı:</td>
        <td>
            <asp:TextBox ID="txtMarkaAD" runat="server" Width="165px"></asp:TextBox>
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
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MarkaID" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField HeaderText="Düzenle/Sil" ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="MarkaID" HeaderText="MarkaID" InsertVisible="False" ReadOnly="True" SortExpression="MarkaID" />
        <asp:BoundField DataField="MarkaAD" HeaderText="MarkaAD" SortExpression="MarkaAD" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="Markalars">
</asp:LinqDataSource>

