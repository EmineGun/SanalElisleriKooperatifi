<%@ Control Language="C#" AutoEventWireup="true" CodeFile="odemetalep.ascx.cs" Inherits="Admin_moduller_odemetalep" %>
<table style="width:100%;">
    <tr>
        <td colspan="3" style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #0033CC">ÖDEME BİLDİRİMİ</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="UyeEposta" HeaderText="UyeEposta" SortExpression="UyeEposta" />
                    <asp:BoundField DataField="Baslik" HeaderText="Baslik" SortExpression="Baslik" />
                    <asp:BoundField DataField="Aciklama" HeaderText="Aciklama" SortExpression="Aciklama" />
                    <asp:BoundField DataField="TalepTarihi" HeaderText="TalepTarihi" SortExpression="TalepTarihi" />
                    <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EntityTypeName="" TableName="OdemeTaleps">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

