<%@ Control Language="C#" AutoEventWireup="true" CodeFile="odemetalep.ascx.cs" Inherits="moduller_odemetalep" %>

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
    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            &nbsp;Ödeme Talep Formu</td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Başlık:</td>
                    <td>
                        <asp:TextBox ID="txtBaslik" runat="server" Width="265px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="qq"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Açıklama:</td>
                    <td>
                        <asp:TextBox ID="txtAciklama" runat="server" Height="198px" TextMode="MultiLine" Width="343px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAciklama" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="qq"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btngonder" runat="server" Text="GÖNDER" ValidationGroup="qq" OnClick="btngonder_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lblBilgi" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>










