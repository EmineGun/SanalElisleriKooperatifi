<%@ Control Language="C#" AutoEventWireup="true" CodeFile="temalar.ascx.cs" Inherits="Admin_moduller_temalar" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<table style="width:100%;">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td>Üst (BANNER):</td>
        <td>
            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../Admin/editor/">
            </FCKeditorV2:FCKeditor>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>ALT(FOOTER):</td>
        <td>
            <FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="../Admin/editor/">
            </FCKeditorV2:FCKeditor>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="Değişiklikleri Kaydet" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>

