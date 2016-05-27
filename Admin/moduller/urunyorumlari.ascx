<%@ Control Language="C#" AutoEventWireup="true" CodeFile="urunyorumlari.ascx.cs" Inherits="Admin_moduller_urunyorumlari" %>
<table style="width:100%;">
    <tr>
        <td style="text-align: center; color: #FFFFFF; background-color: #0033CC"><b>ONAY BEKLEYEN YORUMLAR</b></td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="997px">
                <Columns>
                    <asp:BoundField DataField="YorumID" HeaderText="YorumID">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Baslik" HeaderText="Başlık">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Yorum" HeaderText="Yorum">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:ButtonField ButtonType="Image" CommandName="Select" HeaderText="Onayla" ImageUrl="~/Admin/images/icon_tick_sq.png" Text="Button">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">YORUM SİL</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="YorumID" DataSourceID="LinqDataSource1" Width="1001px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="YorumID" HeaderText="YorumID" InsertVisible="False" ReadOnly="True" SortExpression="YorumID" />
                    <asp:BoundField DataField="UrunID" HeaderText="UrunID" SortExpression="UrunID" />
                    <asp:BoundField DataField="Baslik" HeaderText="Baslik" SortExpression="Baslik" />
                    <asp:BoundField DataField="Yorum" HeaderText="Yorum" SortExpression="Yorum" />
                    <asp:BoundField DataField="Durum" HeaderText="Durum" SortExpression="Durum" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EnableDelete="True" EntityTypeName="" TableName="Yorumlars">
            </asp:LinqDataSource>
        </td>
    </tr>
</table>

