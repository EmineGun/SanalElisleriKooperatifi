<%@ Control Language="C#" AutoEventWireup="true" CodeFile="yoneticiler.ascx.cs" Inherits="Admin_moduller_yoneticiler" %>




<style type="text/css">
    .auto-style1
    {
        width: 135px;
    }
    .auto-style2
    {
        width: 236px;
    }
</style>




<asp:Repeater ID="rptYoneticiler" runat="server">
    <HeaderTemplate>
        <table style="width: 100%;">
            <tr>
                <td><b>Yönetici Ad</b></td>
                <td><b>Düzenle</b></td>
                <td><b>Sil</b></td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%#Eval("YoneticiAd") %></td>
            <td><a href="Yonetim.aspx?ad=yoneticiler&islem=guncelle&id=<%#Eval("YoneticiID") %>"><img src="images/guncelle.gif" alt="Güncelle" /></a></td>
            <td><a href="Yonetim.aspx?ad=yoneticiler&islem=sil&id=<%#Eval("YoneticiID")%>"><img src="images/btn_sil.gif" alt="Sil"/></a></td>



        </tr>

    </ItemTemplate>

    <FooterTemplate>
        </table>
    </FooterTemplate>

</asp:Repeater>





<table style="width:100%;">
    <tr>
        <td colspan="3" style="font-weight: 700; background-color: #FF99FF">YÖNETİCİ EKLE/GÜNCELLE</td>
    </tr>
    <tr>
        <td class="auto-style1">Yönetici Ad:</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtYoneticiAd" runat="server" Width="196px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYoneticiAd" ErrorMessage="Boş Geçmeyiniz!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">Şifre:</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" Width="199px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSifre" ErrorMessage="Boş Geçmeyiniz!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">Şifre Tekrar:</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtSifre2" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSifre2" ErrorMessage="Boş Geçmeyiniz!" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifre2" ErrorMessage="Şifreler Aynı Değil!!" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style1">&nbsp;</td>
        <td class="auto-style2">
            <asp:Button ID="btnEkleGuncelle" runat="server" Text="Yönetici Ekle/Güncelle" OnClick="btnEkleGuncelle_Click" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>






