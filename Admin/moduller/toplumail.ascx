<%@ Control Language="C#" AutoEventWireup="true" CodeFile="toplumail.ascx.cs" Inherits="Admin_moduller_toplumail" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">TOPLU MAİL GÖNDERME</td>
    </tr>
    <tr>
        <td>Mailin Konusu:</td>
        <td>
            <asp:TextBox ID="txtKonu" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKonu" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <asp:Button ID="btngonder" runat="server" OnClick="btngonder_Click" Text="MAİL GÖNDER" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
        </td>
    </tr>
</table>

