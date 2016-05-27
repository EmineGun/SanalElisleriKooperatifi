<%@ Control Language="C#" AutoEventWireup="true" CodeFile="icerikler.ascx.cs" Inherits="Admin_moduller_icerikler" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
</style>

<table style="width:100%;">
      <tr>
        <td colspan="3">
            <asp:DataList ID="DataList1" runat="server" Width="100%">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>İçerik Başlık</td>
                            <td>Düzenle</td>
                            <td>Sil</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("IcerikBaslik") %></td>
                        <td><a href="Yonetim.aspx?ad=icerikler&islem=duzenle&id=<%#Eval("ID") %>"><img src="images/guncelle.gif" alt="Düzenle" border="0" /></a></td>
                        <td><a href="Yonetim.aspx?ad=icerikler&islem=sil&id=<%#Eval("ID") %>"><img src="images/btn_sil.gif" alt="Sil" border="0" /></a></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
          </td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">İÇERİK EKLE/DÜZENLE</td>
    </tr>
    <tr>
        <td>İçerik Başlık:</td>
        <td>
            <asp:TextBox ID="txticerikAd" runat="server" Width="244px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txticerikAd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>İçerik:</td>
        <td>
            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../Admin/editor/">
            </FCKeditorV2:FCKeditor>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/icon_approve.png" OnClick="ImageButton1_Click" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

