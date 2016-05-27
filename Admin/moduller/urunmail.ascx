<%@ Control Language="C#" AutoEventWireup="true" CodeFile="urunmail.ascx.cs" Inherits="Admin_moduller_urunmail" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
    .auto-style2
    {
    }
    .auto-style3
    {
        width: 258px;
    }
    .auto-style4
    {
        width: 157px;
        height: 23px;
    }
    .auto-style5
    {
        width: 258px;
        height: 23px;
    }
</style>

<table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">ÜRÜN MAİL GÖNDERME</td>
    </tr>
    <tr>
        <td class="auto-style2">Ürün Adı:</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtAra" runat="server" Width="413px"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnAra" runat="server" OnClick="btnAra_Click" Text="Ara" />
        </td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="837px">
                <Columns>
                    <asp:BoundField DataField="UrunID" HeaderText="UrunID" SortExpression="UrunID" />
                    <asp:BoundField DataField="UrunAD" HeaderText="Urun AD" SortExpression="UrunAD" />
                    <asp:BoundField DataField="UrunFiyat" HeaderText="Urun Fiyat" SortExpression="UrunFiyat" />
                    <asp:BoundField DataField="KDV" HeaderText="KDV" SortExpression="KDV" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Ürün Mail" ShowHeader="True" Text="Mail Gönder" />
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
        </td>
    </tr>
    <tr>
        <td colspan="3" style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #0033CC">MAİL GÖNDER</td>
    </tr>
    <tr>
        <td class="auto-style4">UrunID</td>
        <td class="auto-style5">
            <asp:Label ID="lblID" runat="server"></asp:Label>
        </td>
        <td class="auto-style1"></td>
    </tr>
    <tr>
        <td class="auto-style2">Mailin Konusu:</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtBaslik" runat="server" Width="400px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Mesajınız:</td>
        <td class="auto-style3">
            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../Admin/editor/">
            </FCKeditorV2:FCKeditor>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">
            <asp:Button ID="btnGonder" runat="server" OnClick="btnGonder_Click" Text="MAİL GÖNDER" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" colspan="3">
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
        </td>
    </tr>
</table>

