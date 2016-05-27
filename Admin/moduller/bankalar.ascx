<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bankalar.ascx.cs" Inherits="Admin_moduller_bankalar" %>
<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td colspan="3" style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #0033CC">BANKA İŞLEMLERİ</td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="3">
            <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" Height="50px" Width="473px">
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Banka" HeaderText="Banka" SortExpression="Banka" />
                    <asp:BoundField DataField="SubeAdi" HeaderText="SubeAdi" SortExpression="SubeAdi" />
                    <asp:BoundField DataField="SubeKodu" HeaderText="SubeKodu" SortExpression="SubeKodu" />
                    <asp:BoundField DataField="HesapTuru" HeaderText="HesapTuru" SortExpression="HesapTuru" />
                    <asp:BoundField DataField="HesapNo" HeaderText="HesapNo" SortExpression="HesapNo" />
                    <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:DetailsView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Hesapnumaralaris">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

