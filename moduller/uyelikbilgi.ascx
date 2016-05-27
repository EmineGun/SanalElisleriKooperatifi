<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uyelikbilgi.ascx.cs" Inherits="moduller_uyelikbilgi" %>
<style type="text/css">




    .auto-style1
    {
        height: 34px;
    }
    .auto-style2
    {
        width: 100%;
        height: 34px;
    }
    .auto-style10
    {
        width: 154px;
        text-align: left;
    }
    .auto-style3
    {
        width: 156px;
        text-align: left;
    }
    .auto-style4
    {
        width: 12px;
        text-align: left;
    }
    .auto-style11
    {
        width: 154px;
        height: 26px;
        text-align: left;
    }



    .auto-style7
    {
        width: 156px;
        height: 26px;
        text-align: left;
    }
    .auto-style8
    {
        width: 12px;
        text-align: left;
        height: 26px;
    }
    .auto-style9
    {
        height: 26px;
    }
    .auto-style12
    {
        text-align: left;
    }
    </style>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            ÜYELİK BİLGİ GÜNCELLE </td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

            <asp:Panel ID="Panel1" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style10">Üye Ad Soyad:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtUyeAd" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUyeAd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Adres:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtAdres" runat="server" Height="72px" Width="187px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style9"></td>
                    </tr>
                    <tr>
                        <td class="auto-style10">İl:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtil" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtil" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">İlçe:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtilce" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtilce" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Telefon:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTel" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">&nbsp;</td>
                        <td class="auto-style3">
                            <asp:Button ID="btnguncelle" runat="server" Text="ÜYELİK GÜNCELLE" />
                        </td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">Şifre Değiştirmek için:</td>
                        <td class="auto-style3">
                            <asp:Button ID="btnDegistir" runat="server" OnClick="btnDegistir_Click" Text="ŞİFRE DEĞİŞTİR" />
                        </td>
                        <td class="auto-style4">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                <table style="width:100%;">
                    <tr>
                        <td>Yeni Şifreniz:</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtSifre1" runat="server" TextMode="Password" ValidationGroup="q" Width="176px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSifre1" ErrorMessage="*" ForeColor="Red" ValidationGroup="q"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Şifre Tekrar:</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtSifre2" runat="server" TextMode="Password" ValidationGroup="q" Width="178px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSifre2" ErrorMessage="*" ForeColor="Red" ValidationGroup="q"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSifre1" ControlToValidate="txtSifre2" ErrorMessage="Şifreler Aynı Değil" ForeColor="Red" ValidationGroup="q"></asp:CompareValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="text-align: left">
                            <asp:Button ID="btnsifre" runat="server" OnClick="btnsifre_Click" Text="ŞİFRE DEĞİŞTİR" ValidationGroup="q" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblBilgi" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </td>
    </tr>
</table>












