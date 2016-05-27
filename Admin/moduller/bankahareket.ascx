<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bankahareket.ascx.cs" Inherits="Admin_moduller_bankahareket" %>
<style type="text/css">
    .auto-style1
    {
        width: 194px;
    }
</style>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Banka" HeaderText="Banka" SortExpression="Banka" />
        <asp:BoundField DataField="SubeAdi" HeaderText="SubeAdi" SortExpression="SubeAdi" />
        <asp:BoundField DataField="SubeKodu" HeaderText="SubeKodu" SortExpression="SubeKodu" />
        <asp:BoundField DataField="HesapTuru" HeaderText="HesapTuru" SortExpression="HesapTuru" />
        <asp:BoundField DataField="HesapNo" HeaderText="HesapNo" SortExpression="HesapNo" />
        <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN" />
        <asp:ButtonField ButtonType="Button" CommandName="Select" ShowHeader="True" Text="Banka Hareket" />
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
<asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="Hesapnumaralaris">
</asp:LinqDataSource>
<table style="width:100%;">
    <tr>
        <td class="auto-style1">ID:</td>
        <td>
            <asp:Label ID="lblid" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">Borç:</td>
        <td>
            <asp:TextBox ID="txtborc" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtborc" ErrorMessage="Boş Geçmeyiniz" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">Alacak</td>
        <td>
            <asp:TextBox ID="txtalacak" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtalacak" ErrorMessage="Boş Geçmeyiniz" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td>
            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Kaydet" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">Hesaba Ait Toplam Alacak :</td>
        <td>
            <asp:Label ID="lblalacak" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1">Hesaba Ait Toplam Borç:</td>
        <td>
            <asp:Label ID="lblborc" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

