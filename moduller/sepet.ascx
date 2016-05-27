<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sepet.ascx.cs" Inherits="moduller_sepet" %>

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
                
        
    .style1
    {
        width: 99%;
    }
        
    

    .auto-style3
    {
        font-size: large;
        font-weight: bold;
        text-align: center;
    }
        
    

    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            ALIŞVERİŞ SEPETİM</td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

            <table style="width:100%;">
                <tr>
                    <td>
                        <table style="width:100%;">
                            <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <tr>
                                <td style="text-align:center"><b>Ürün Resmi</b></td>
                                <td style="text-align:center"><b>Ürün Adı</b></td>
                                <td style="text-align:center"><b>KDV Dahil Fiyatı</b></td>
                                <td style="text-align:center"><b>Adet</b></td>
                                <td style="text-align:center"><b>Sepetten Kaldır</b></td>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align:center"><img src="Urunler/<%#Eval("Resim1")%>" width="70px" height="70px" /></td>
                                    <td style="text-align:center"><%#Eval("UrunAD")%></td>
                                    <td style="text-align:center"><%#Convert.ToDouble(Eval("UrunFiyat"))+ Convert.ToDouble(Eval("UrunFiyat"))/100 * Convert.ToInt32(Eval("KDV")) %> TL</td>
                                    <td style="text-align:center">
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("Adet") %>' Width="20px" Height="20px"></asp:TextBox>
                                        <asp:Label ID="Label1" runat="server" Visible="false" Text='<%#Eval("SepetID") %>' ></asp:Label>
                                    </td>
                                    <td style="text-align:center"><a href='?ad=sepet&islem=sil&id=<%#Eval("SepetID") %>' onclick="return confirm('Seçili Ürünü Sepetinizden Kaldırmak İstediğinize Emin Misiniz?')"><img src="../resimler/btnSil.png" alt="Ürünü Kaldır" /></a></td>
                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>
                        </table>
                    </td>
                    <td style="text-align: center">
                        <asp:Button ID="btnadetdegistir" runat="server" OnClick="btnadetdegistir_Click" Text="Ürün Adet Değişikliğini Kaydet" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<asp:Label ID="lblBilgi" runat="server" style="font-weight: 700; font-size: x-large"></asp:Label>
<br />
<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style3" colspan="2">Sepette Bulunan Ürünlerin Toplam Fiyatı
                <asp:Label ID="lblFiyat" runat="server" style="font-size: x-large"></asp:Label>
                &nbsp;TL</td>
            <td colspan="2" style="text-align: center">
                <a href="Default.aspx?ad=satinal">
                <asp:Image ID="Image1" src="../resimler/satin_al.png" runat="server" /></a>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Panel>
