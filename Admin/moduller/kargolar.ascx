<%@ Control Language="C#" AutoEventWireup="true" CodeFile="kargolar.ascx.cs" Inherits="Admin_moduller_kargolar" %>
<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">KARGO İŞLEMLERİ</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" Height="109px" Width="466px">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="KargoAdi" HeaderText="KargoAdi" SortExpression="KargoAdi" />
                    <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" SortExpression="Fiyat" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:DetailsView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Kargos">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td><a class="hlink" href="javascript:onClick=window.print()">Yazdır</a></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

