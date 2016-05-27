<%@ Control Language="C#" AutoEventWireup="true" CodeFile="reklamlar.ascx.cs" Inherits="Admin_moduller_reklamlar" %>
<table style="width:100%;">
    <tr>
        <td colspan="3" style="text-align: center; color: #FFFFFF; font-weight: 700; background-color: #0033CC">REKLAMLAR</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:DataList ID="DataList1" runat="server" Width="100%">
                <HeaderTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align:center"><b>Reklam Adı</b></td>
                            <td style="text-align:center"><b>Reklam Türü</b></td>
                            <td style="text-align:center"><b>Pozisyon</b></td>
                            <td style="text-align:center"><b>Düzenle</b></td>
                            <td style="text-align:center"><b>Sil</b></td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="text-align:center"><%#Eval("ReklamAdi") %></td>
                        <td style="text-align:center"><%#Eval("ReklamTuru") %></td>
                        <td style="text-align:center"><%#Eval("Pozisyon") %></td>
                        <td style="text-align:center"><a href="Yonetim.aspx?ad=reklamlar&islem=duzenle&id=<%#Eval("id") %>"><img src="images/guncelle.gif" border="0" alt="Düzenle" /></a></td>
                        <td style="text-align:center"><a onclick="return confirm('Seçili Reklamı Silmek İstediğinizden Emin misiniz?');" href="Yonetim.aspx?ad=reklamlar&islem=sil&id=<%#Eval("id") %>"><img src="images/btn_sil.gif" border="0" alt="Sil" /></a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center; font-weight: 700; color: #FFFFFF; background-color: #0033CC">REKLAM EKLE/DÜZENLE</td>
    </tr>
    <tr>
        <td>Reklam Adı:</td>
        <td>
            <asp:TextBox ID="txtReklamAdi" runat="server" Width="283px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Reklam Türü</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Resim</asp:ListItem>
                <asp:ListItem>Animasyon</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Pozisyon</td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Sağ</asp:ListItem>
                <asp:ListItem>Sol</asp:ListItem>
                <asp:ListItem>Orta</asp:ListItem>
                <asp:ListItem>Üst</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Reklam</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>URL</td>
        <td>
            <asp:TextBox ID="txtURL" runat="server" Width="283px"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" Text="REKLAM KAYDET" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
        </td>
    </tr>
</table>

