<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uyegiris.ascx.cs" Inherits="bloklar_uyegiris" %>
<style type="text/css">
    .auto-style1
    {
        height: 34px;
    }
    .auto-style2
    {
        width: 100%;
        height: 34px;
        font-weight: bold;
    }
    .auto-style5
    {
        text-align: center;
    }
    .auto-style6
    {
        width: 174px;
    }
    .auto-style7
    {
        width: 103px;
    }
    .auto-style8
    {
        height: 23px;
    }
    </style>

 <asp:Panel ID="pnlUyeGiris" runat="server">
     <table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center">ÜYE PANELİ</td>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style7">Üye E-Posta:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtEposta" runat="server" ValidationGroup="aa"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7">Şifre:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" ValidationGroup="aa"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7">&nbsp;</td>
                        <td class="auto-style6">
                            <asp:Button ID="btnGiris" runat="server" Text="Giriş" OnClick="btnGiris_Click" ValidationGroup="aa" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="2"><b><a href="Default.aspx?ad=uyekayit">Üyemiz Olun </a>| <a href="Default.aspx?ad=sifremiunuttum">Şifremi Unuttum</a></b>
                            <br />
                            <asp:Label ID="lblDurum" runat="server" ForeColor="Red" Visible="False" style="font-weight: 700"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </td>
             </tr>
            </table>
       </asp:Panel>
            <asp:Panel ID="pnlUye" runat="server" Visible="False">
                 <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                         <td class="auto-style1">
                             <img alt="" src="temalar/resim/dmt_left.png" /></td>
                         <td class="auto-style2" style="background-image: url('temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center">ÜYE PANELİ</td>
                         <td class="auto-style1">
                                <img alt="" src="temalar/resim/dmt_right.png" style="height: 34px" /></td>
                     </tr>
                   
                     <tr>
                     
                         <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">
                              <table style="width:100%;">
                    <tr>
                        <td class="auto-style8">
                            <asp:Label ID="lblAd" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="Default.aspx?ad=uyelikbilgi">Üyelik Bilgilerim</a></td>
                    </tr>
                    <tr>
                        <td><a href="Default.aspx?ad=sepet">Sepetim</a></td>
                    </tr>
                    <tr>
                        <td><a href="Default.aspx?ad=odemetalep">Ödeme Talep</a></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnCikis" runat="server" OnClick="btnCikis_Click" Text="Güvenli Çıkış" />
                        </td>
                    </tr>
                </table>

                         </td>
                 
                     </tr>
                </table>
            </asp:Panel>

