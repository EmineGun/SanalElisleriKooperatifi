<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uyekayit.ascx.cs" Inherits="moduller_uyekayit" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>
<style type="text/css">
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
    .auto-style10
    {
        width: 154px;
        text-align: left;
    }
    .auto-style11
    {
        width: 154px;
        height: 26px;
        text-align: left;
    }



    .auto-style1
    {
        height: 34px;
    }
    .auto-style2
    {
        width: 100%;
        height: 34px;
    }
    </style>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            ÜYE KAYIT </td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

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
        <td class="auto-style10">Üye E-posta:</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtEposta" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEposta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEposta" ErrorMessage="Geçersiz E-Posta !" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style10">Sifre:</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSifre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style10">Sifre Tekrar:</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtSifre2" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSifre2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifre2" ErrorMessage="Şifreler Uyuşmuyor!" ForeColor="Red"></asp:CompareValidator>
        </td>
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
        <td class="auto-style10">Şehir:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="drpSehir" runat="server" DataSourceID="LinqDataSource1" DataTextField="Ad" DataValueField="ID">
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="illers">
            </asp:LinqDataSource>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpSehir" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style10">İlçe:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="drpilce" runat="server" DataSourceID="LinqDataSource2" DataTextField="Ad" DataValueField="IlceID">
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="ilcelers">
            </asp:LinqDataSource>
        </td>
        <td class="auto-style4">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="drpilce" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <asp:Button ID="btnkayit" runat="server" OnClick="btnkayit_Click" style="text-align: left" Text="KAYIT OL" />
            <asp:Label ID="lblDurum" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </td>
        <td class="auto-style4">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

        </td>
    </tr>
</table>











