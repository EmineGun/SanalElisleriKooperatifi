<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifremiunuttum.ascx.cs" Inherits="moduller_sifremiunuttum" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<style type="text/css">
    .auto-style1
    {
        height: 23px;
        text-align: left;
    }
    .auto-style2
    {
        height: 23px;
        width: 930px;
        text-align: center;
        font-weight: bold;
    }
    .auto-style7
    {
    }
    .auto-style8
    {
        width: 197px;
        text-align: left;
    }
    .auto-style9
    {
        height: 26px;
        text-align: left;
    }
    .auto-style10
    {
        width: 197px;
        height: 26px;
        text-align: left;
    }
    .auto-style11
    {
        height: 23px;
        text-align: left;
        width: 15px;
    }
    .auto-style4
    {
        height: 23px;
        width: 289px;
        text-align: center;
    }
    .auto-style6
    {
        height: 30px;
    }
    .auto-style5
    {
        width: 289px;
        text-align: left;
        height: 30px;
    }
    .auto-style12
    {
        height: 23px;
        width: 254px;
        text-align: right;
        font-weight: bold;
    }
    .auto-style13
    {
        height: 30px;
        width: 254px;
    }
    .auto-style14
    {
        width: 197px;
        height: 30px;
        text-align: left;
    }
    .auto-style15
    {
        height: 30px;
        text-align: right;
        width: 255px;
    }
    .auto-style17
    {
        height: 26px;
        text-align: right;
        width: 255px;
    }
    .auto-style18
    {
        text-align: left;
    }
    .auto-style20
    {
        text-align: right;
        width: 244px;
    }
    .auto-style21
    {
        text-align: right;
        width: 255px;
    }
</style>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style11">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; "> 
            ŞİFREMİ UNUTTUM </td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style12">Üye Eposta:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEposta" runat="server" Width="269px" style="text-align: center"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:Button ID="btngonder0" runat="server" OnClick="btngonder_Click" Text="Şifre Gönder" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style5">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEposta" ErrorMessage="Geçersiz Eposta!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEposta" ErrorMessage="Boş Geçmeyiniz." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:Label ID="lblDurum" runat="server" ForeColor="Red" style="text-align: left" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style21">Üye Ad Soyad :</td>
            <td class="auto-style8">
                <asp:Label ID="lblAd" runat="server"></asp:Label>
            </td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">Üye Eposta:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtMail" runat="server" Width="186px"></asp:TextBox>
            </td>
            <td class="auto-style18">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMail" ErrorMessage="Geçersiz E-Posta" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMail" ErrorMessage="Boş Geçmeyiniz" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">Yeni Şifre:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtSifre1" runat="server" TextMode="Password" Width="184px"></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSifre1" ErrorMessage="Boş Geçmeyiniz" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">Yeni Şifre Tekrar:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtSifre2" runat="server" TextMode="Password" Width="184px"></asp:TextBox>
            </td>
            <td class="auto-style18">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSifre2" ErrorMessage="Boş Geçmeyiniz" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15"></td>
            <td class="auto-style14">
                <asp:Button ID="btndegistir" runat="server" OnClick="btndegistir_Click" Text="Şifre Değiştir" />
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3">
                <asp:Label ID="lblDurum2" runat="server" ForeColor="Red" style="text-align: left" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>

        </td>
    </tr>
</table>












