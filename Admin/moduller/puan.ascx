<%@ Control Language="C#" AutoEventWireup="true" CodeFile="puan.ascx.cs" Inherits="Admin_moduller_puan" %>
<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">PUAN DEĞİŞTİR</td>
    </tr>
    <tr>
        <td class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Puan" HeaderText="Puan" SortExpression="Puan" />
                    <asp:BoundField DataField="OdemeSekli" HeaderText="OdemeSekli" SortExpression="OdemeSekli" />
                    <asp:BoundField DataField="Alan" HeaderText="Alan" SortExpression="Alan" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" ShowHeader="True" Text="PUAN DEĞİŞTİR" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="PuanYoneticis">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                <table style="width:100%;">
                    <tr>
                        <td>ID:</td>
                        <td>
                            <asp:Label ID="lblid" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Ödeme Şekli:</td>
                        <td>
                            <asp:Label ID="lblodeme" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Alan:</td>
                        <td>
                            <asp:Label ID="lblalan" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Puan:</td>
                        <td>
                            <asp:TextBox ID="txtPuan" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>

