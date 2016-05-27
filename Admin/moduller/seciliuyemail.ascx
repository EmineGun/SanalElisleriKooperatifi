<%@ Control Language="C#" AutoEventWireup="true" CodeFile="seciliuyemail.ascx.cs" Inherits="Admin_moduller_seciliuyemail" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">SEÇİLİ ÜYELER MAİL GÖNDERME</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="LinqDataSource1" Height="234px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="986px">
                <Columns>
                    <asp:BoundField DataField="UyeAdSoyad" HeaderText="Ad Soyad" ReadOnly="True" SortExpression="UyeAdSoyad" />
                    <asp:BoundField DataField="UyeEposta" HeaderText="Eposta" ReadOnly="True" SortExpression="UyeEposta" />
                    <asp:BoundField DataField="GSM" HeaderText="GSM" ReadOnly="True" SortExpression="GSM" />
                    <asp:BoundField DataField="Onay" HeaderText="Onay" ReadOnly="True" SortExpression="Onay" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" ShowHeader="True" Text="MAİL GÖNDER" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" Select="new (UyeAdSoyad, UyeEposta, GSM, Onay)" TableName="Uyelers">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center; color: #FFFFFF; font-weight: 700; background-color: #0033CC">MAİL İŞLEMİ</td>
    </tr>
    <tr>
        <td>Gönderilecek Mail:</td>
        <td>
            <asp:Label ID="lblMail" runat="server"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Mailin Konusu:</td>
        <td>
            <asp:TextBox ID="txtMailBaslik" runat="server" Width="349px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMailBaslik" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>Mesajınız:</td>
        <td>
            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../Admin/editor/">
            </FCKeditorV2:FCKeditor>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="btnGonder" runat="server" OnClick="btnGonder_Click" Text="MAİL GÖNDER" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
        </td>
    </tr>
</table>

