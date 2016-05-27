<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uyeler.ascx.cs" Inherits="Admin_moduller_uyeler" %>


<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>


<style type="text/css">
    .auto-style1
    {
        height: 23px;
    }
    .auto-style2
    {
        height: 23px;
        width: 117px;
    }
    .auto-style3
    {
        width: 117px;
    }
    .auto-style4
    {
        height: 23px;
        width: 257px;
    }
    .auto-style5
    {
        width: 257px;
    }
    .auto-style6
    {
        width: 117px;
        height: 26px;
    }
    .auto-style7
    {
        width: 257px;
        height: 26px;
    }
    .auto-style8
    {
        height: 26px;
    }
    .auto-style9
    {
        text-align: left;
        font-weight: 700;
    }
    .auto-style10
    {
        text-align: left;
        font-weight: bold;
    }
    .auto-style11
    {
        width: 113px;
    }
    .auto-style12
    {
        width: 306px;
    }
    .auto-style13
    {
        width: 113px;
        height: 23px;
    }
    .auto-style14
    {
        width: 306px;
        height: 23px;
    }
    .auto-style15
    {
        width: 117px;
        height: 124px;
    }
    .auto-style16
    {
        width: 257px;
        height: 124px;
    }
    .auto-style17
    {
        height: 124px;
    }
</style>


<asp:Repeater ID="rptUyeler" runat="server">
    <HeaderTemplate>
        <table style="width:100%">
            <tr>
                <td><b>Üye Ad Soyad</b></td>
                <td style="text-align:center"><b>Üye Eposta</b></td>
                <td style="text-align:center"><b>Güncelle</b></td>
                <td style="text-align:center"><b>Şifre Değiştir</b></td>
                <td style="text-align:center"><b>Sil</b></td>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%#Eval("UyeAdSoyad") %></td>
            <td style="text-align:center"><%#Eval("UyeEposta") %></td>
            <td style="text-align:center"><a href="yonetim.aspx?ad=uyeler&islem=guncelle&id=<%#Eval("UyeID") %>"><img src="images/guncelle.gif" alt="Guncelle" /></a></td>
            <td style="text-align:center"><a href="yonetim.aspx?ad=uyeler&islem=sifredegistir&id=<%#Eval("UyeID") %>"><img src="images/but_sifredegistir.gif" alt="Şifre Değiştir"/></a></td>
            <td style="text-align:center"><a href="yonetim.aspx?ad=uyeler&islem=sil&id=<%#Eval("UyeID") %>"><img src="images/btn_sil.gif"/></a></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>



<asp:Panel ID="Panel1" runat="server" Visible="False">
    <table style="width:100%;">
        <tr>
            <td colspan="3" class="auto-style10">ÜYE GÖRÜNTÜLEME / GÜNCELLEME</td>
        </tr>
        <tr>
            <td class="auto-style2">Üye Ad Soyad :</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtAd" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Üye E-Posta</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtEposta" runat="server" Width="201px"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEposta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEposta" ErrorMessage="Geçersiz E-Posta" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">GSM :</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtGsm" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtGsm" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Adres:</td>
            <td class="auto-style16">
                <asp:TextBox ID="txtAdres" runat="server" Width="206px" Height="114px" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="auto-style17">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Şehir:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtSehir" runat="server" Width="202px"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSehir" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">İlçe:</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtilce" runat="server" style="margin-right: 0px" Width="202px"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtilce" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Eklenme Tarihi:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtEklenme" runat="server" Width="208px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEklenme" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" Width="154px" OnClick="btnGuncelle_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>




<asp:Panel ID="Panel2" runat="server" Visible="False">
    <table style="width:100%;">
        <tr>
            <td class="auto-style9" colspan="3">ÜYE ŞİFRE DEĞİŞTİRME </td>
        </tr>
        <tr>
            <td class="auto-style13">Üye Ad Soyad:</td>
            <td class="auto-style14">
                <asp:Label ID="lblAdSoyad" runat="server"></asp:Label>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style11">Üye Eposta:</td>
            <td class="auto-style12">
                <asp:Label ID="lblEposta" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">Şifre:</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" Width="188px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSifre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Şifre Tekrar:</td>
            <td class="auto-style12">
                <asp:TextBox ID="txtSifre2" runat="server" TextMode="Password" Width="188px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSifre2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifre2" ErrorMessage="Şifreler Uyuşmuyor!" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style12">
                <asp:Button ID="btnSifre" runat="server" OnClick="btnSifre_Click" Text="Şifre Değiştir" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>





