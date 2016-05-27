<%@ Control Language="C#" AutoEventWireup="true" CodeFile="satinal.ascx.cs" Inherits="moduller_satinal" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
    .auto-style3
    {
        width: 151px;
    }
    .auto-style4
    {
        text-align: center;
    }
    .auto-style7
    {
        height: 23px;
    }
    .auto-style8
    {
        width: 349px;
    }
    .auto-style9
    {
        width: 154px;
    }
    .auto-style10
    {
        width: 171px;
    }
    .auto-style11
    {
        width: 146px;
    }
    .auto-style12
    {
        width: 171px;
        height: 26px;
    }
    .auto-style13
    {
        height: 26px;
        text-align: left;
    }
    .auto-style14
    {
        font-size: medium;
    }
    .auto-style15
    {
        font-size: large;
    }
    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('/temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"> 
            SATIN AL</td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlTeslimat" runat="server"> 
                        <div class="auto-style4">
                            <b><span class="auto-style14">1 TESLİMAT BİLGİLERİ</span></b>
                        </div>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="3" class="auto-style7" style="font-weight: 700; text-align: center">Üye Bilgilerim</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">Ad Soyad:</td>
                                            <td>
                                                <asp:TextBox ID="txtUyeAdSoyad" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUyeAdSoyad" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">Telefon:</td>
                                            <td>
                                                <asp:TextBox ID="txtTelefon" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTelefon" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">Eposta:</td>
                                            <td>
                                                <asp:TextBox ID="txtEposta" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEposta" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">Adres:</td>
                                            <td>
                                                <asp:TextBox ID="txtAdres" runat="server" Height="96px" TextMode="MultiLine" Width="206px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>

                                </td>
                                <td>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="3" style="font-weight: 700; text-align: center">Teslimat Bilgileri</td>
                                        </tr>
                                        <tr>
                                            <td>Ad Soyad:</td>
                                            <td>
                                                <asp:TextBox ID="txtAdSoyad" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAdSoyad" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Telefon:</td>
                                            <td>
                                                <asp:TextBox ID="txtTel" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTel" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Adres:</td>
                                            <td>
                                                <asp:TextBox ID="txtAdres2" runat="server" Height="92px" TextMode="MultiLine" Width="213px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAdres2" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>İl:</td>
                                            <td>
                                                <asp:TextBox ID="txtil" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtil" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>İlçe/Semt:</td>
                                            <td>
                                                <asp:TextBox ID="txtilce" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtilce" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Posta Kodu:</td>
                                            <td>
                                                <asp:TextBox ID="txtPostaKodu" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPostaKodu" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ülke:</td>
                                            <td>
                                                <asp:TextBox ID="txtUlke" runat="server" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtUlke" ErrorMessage="*" ForeColor="Red" ValidationGroup="Teslimat">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                           
                        </table>
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style9">Kargo Notu:</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtKargoNotu" runat="server" Height="96px" TextMode="MultiLine" Width="298px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">Sipariş Notu:</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtSiparisNotu" runat="server" Height="96px" TextMode="MultiLine" Width="298px"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td class="auto-style8">&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnTeslimat" runat="server" Text="İleri Adım&gt;&gt;Ödeme Seçenekleri" ValidationGroup="Teslimat" OnClick="btnTeslimat_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="pnlOdemeSecenekleri" runat="server" Visible="False"> 
                        <div class="auto-style4">
                            <b><span class="auto-style15">2 SİPARİŞ BİLGİLERİ</span></b>
                        </div>
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="3"><strong>Ödeme Seçenekleri<br /> Kredi kartı</strong>&nbsp;<br /> 128 bit SSL üzerinden Visa ve Master Card ile güvenli alışveriş yapma imkanı tanır.
                                    <br />
                                    Bankalar ile gerçekleştirilen antlaşmalar&nbsp;sayesinde, avantajlı taksit fırsatları sunar.<br />
                                    <br />
                                    <strong>Havale / EFT</strong>
                                    <br />
                                    * Havale / EFT&nbsp;ile yaptığınız alışverişlerde, teslimat süresinin başlangıcı,
                                    <br />
                                    siparişi verdiginiz zaman değil; sipariş tutarının havale ile hesaplarımıza geçtiği andır.</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">Ödeme Seçenekleri:</td>
                                <td>

                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                        <asp:ListItem>Havale</asp:ListItem>
                                        <asp:ListItem>Kredi Kartı</asp:ListItem>
                                        <asp:ListItem>Teslimatta Ödeme</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:Panel ID="pnlPuan" runat="server">
                                        PUAN KULLAN:<asp:RadioButton ID="rdbPuan" runat="server" AutoPostBack="True" OnCheckedChanged="rdbPuan_CheckedChanged" />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Panel ID="pnlKargo" runat="server">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="auto-style12">Kargo:</td>
                                                <td class="auto-style13">
                                                    <asp:DropDownList ID="drpKargo" runat="server" DataSourceID="LinqDataSource1" DataTextField="KargoAdi" DataValueField="ID" OnSelectedIndexChanged="drpKargo_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="eticaretDataContext" EntityTypeName="" TableName="Kargos">
                                                    </asp:LinqDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style10">Kargo Ücreti:</td>
                                                <td style="text-align: left">
                                                    <asp:Label ID="lblKargo" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">

                                    <asp:Panel ID="pnlBanka" runat="server">
                                         <table style="width:100%;">
                                            <tr>
                                                <td class="auto-style10">
                                                    <asp:Label ID="lblBanka" runat="server" Text="Banka Hesapları:"></asp:Label>
                                                </td>
                                                <td style="text-align: left">
                                                    <asp:DropDownList ID="drpBankaHesap" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                             </table>
                                    </asp:Panel>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"> <b>Sepetteki Ürünler </b>

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
                                                    <td style="text-align:center">
                                                        <img src="Urunler/<%#Eval("Resim1")%>" width="70px" height="70px" />
                                                    </td>
                                                    <td style="text-align:center"><%#Eval("UrunAD")%></td>
                                                    <td style="text-align:center"><%#Convert.ToDouble(Eval("UrunFiyat"))+ Convert.ToDouble(Eval("UrunFiyat"))/100 * Convert.ToInt32(Eval("KDV")) %>TL</td>
                                                    <td style="text-align:center">
                                                        <asp:TextBox ID="TextBox1" runat="server" Height="20px" Text='<%#Eval("Adet") %>' Width="20px"></asp:TextBox>
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("SepetID") %>' Visible="false"></asp:Label>
                                                    </td>
                                                    <td style="text-align:center"><a href='?ad=sepet&islem=sil&id=<%#Eval("SepetID") %>' onclick="return confirm('Seçili Ürünü Sepetinizden Kaldırmak İstediğinize Emin Misiniz?')">
                                                        <img src="../resimler/btnSil.png" alt="Ürünü Kaldır" />
                                                        </a></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr>
                                            <td  colspan="2">

                                                Sepette Bulunan Ürünlerin Toplam Fiyatı ve Kargo Dahil Fiyatı:
                                                <asp:Label ID="lblFiyat" runat="server" style="font-size: x-large"></asp:Label>
                                                &nbsp;TL</td>
                                        </tr>
                                    </table>

                                    <tr>
                                        <td>
                                            <asp:Button ID="btnGeri" runat="server" OnClick="btnGeri_Click" Text="Teslimat Bilgileri &gt;&gt; Geri" />
                                        </td>
                                        <td></td>
                                        <td>
                                            <asp:Button ID="btnOdemeSecenekleri" runat="server" Text="İleri&gt;&gt;Ödeme Tamamla" OnClick="btnOdemeSecenekleri_Click" />
                                        </td>
                                    </tr>

                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="3">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            
                        </table>

                    </asp:Panel>
                    <asp:Panel ID="pnlOdeme" runat="server" Visible="False">
                                        <div class="auto-style4">
                                            <b><span class="auto-style15">3 ÖDEME</span></b></div>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td colspan="3">Sepetinizde Bulunan Ürünlerin KDV Toplam ve Kargo Dahil Fiyatı
                                                    <asp:Label ID="lblToplam" runat="server"></asp:Label>
                                                    &nbsp;TL</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>Kart Üzerindeki İsim:</td>
                                                <td>
                                                    <asp:TextBox ID="txtKartAd" runat="server" Width="220px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtKartAd" ErrorMessage="*" ForeColor="Red" ValidationGroup="Odeme">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Kart No:</td>
                                                <td>
                                                    <asp:TextBox ID="txtKartNo" runat="server" Width="220px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtKartNo" ErrorMessage="*" ForeColor="Red" ValidationGroup="Odeme">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Son Kullanma Tarihi:</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                                        <asp:ListItem>1</asp:ListItem>
                                                        <asp:ListItem>2</asp:ListItem>
                                                        <asp:ListItem>3</asp:ListItem>
                                                        <asp:ListItem>4</asp:ListItem>
                                                        <asp:ListItem>5</asp:ListItem>
                                                        <asp:ListItem>6</asp:ListItem>
                                                        <asp:ListItem>7</asp:ListItem>
                                                        <asp:ListItem>8</asp:ListItem>
                                                        <asp:ListItem>9</asp:ListItem>
                                                        <asp:ListItem>10</asp:ListItem>
                                                        <asp:ListItem>11</asp:ListItem>
                                                        <asp:ListItem>12</asp:ListItem>
                                                    </asp:DropDownList>
                                                    /<asp:DropDownList ID="DropDownList2" runat="server">
                                                        <asp:ListItem>13</asp:ListItem>
                                                        <asp:ListItem>14</asp:ListItem>
                                                        <asp:ListItem>15</asp:ListItem>
                                                        <asp:ListItem>16</asp:ListItem>
                                                        <asp:ListItem>17</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" ValidationGroup="Odeme">*</asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*" ForeColor="Red" ValidationGroup="Odeme">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>CVC2:</td>
                                                <td>
                                                    <asp:TextBox ID="txtCVC2" runat="server" Width="220px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtCVC2" ErrorMessage="*" ForeColor="Red" ValidationGroup="Odeme">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnOdemeGeri" runat="server" OnClick="btnOdemeGeri_Click" Text="Ödeme Şekli &gt;&gt; Geri" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblBilgi" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnTamamla" runat="server" Text="Ödemeyi Tamamla" ValidationGroup="Odeme" OnClick="btnTamamla_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                       <asp:Panel ID="pnlSiparis" runat="server" Visible="False">
                                        <div class="auto-style4">
                                            <b><span class="auto-style15">4 SİPARİŞ SONUCU</span></b></div>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSonuc" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnOdemeSecenekleri" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnTamamla" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnTeslimat" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="drpKargo" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btnGeri" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnOdemeGeri" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
                                 

        </td>
    </tr>
</table>










