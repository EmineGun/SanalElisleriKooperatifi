<%@ Control Language="C#" AutoEventWireup="true" CodeFile="urundetay.ascx.cs" Inherits="moduller_urundetay" %>

<script type="text/javascript" src="highslide/highslide-with-gallery.js"></script>
<script type="text/javascript" src="highslide/highslide.config.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="highslide/highslide.css" />

<link href="template1/tabcontent.css" rel="stylesheet" type="text/css" />
<script src="template1/tabcontent.js" type="text/javascript"></script> 

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
    .auto-style3
    {
        text-align: right;
        font-weight: bold;
        width: 197px;
    }
    .auto-style4
    {
        text-align: left;
        width: 203px;
    }


    .auto-style5
    {
        width: 209px;
    }


    .auto-style6
    {
        height: 23px;
        font-weight: bold;
        text-align: center;
    }
    


    .auto-style7
    {
        height: 176px;
    }
    


    </style>
<table cellpadding="0" cellspacing="0" style="width: 100%;">
    <tr>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_left.png" /></td>
        <td class="auto-style2" style="background-image: url('temalar/resim/dmt_bg.gif'); background-repeat: repeat-x; vertical-align: middle; text-align: center"><b>
            <asp:Label ID="lblAD" runat="server" Text='<%#Eval("UrunAD") %>'></asp:Label>
            &nbsp;AİT ÜRÜN DETAYI</b></td>
        <td class="auto-style1">
            <img alt="" src="temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color: #CCFFFF; vertical-align: top;">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style7">
            <asp:FormView ID="FormView1" runat="server">
                <ItemTemplate>
                  <table style="width:100%;">
                        <tr>
                            <td class="auto-style5" rowspan="6">
                                <a href='Urunler/<%#Eval("Resim1") %>' class="highslide" onclick="return hs.expand(this)" style="float:right;margin:0 0 10px 15px">
                                 <img src='Urunler/<%#Eval("Resim1")%>'  alt="" style="width: 150px;height:150px;" />
                                 </a>
                            </td>
                            <td class="auto-style3">Ürün Adı:</td>
                            <td class="auto-style4"> <%#Eval("UrunAd")%> </td>
                            <td rowspan="6" style="text-align: center">
                              
                                <br />
                                <br />
                                <div class="addthis_toolbox addthis_default_style">
<a class="addthis_button_facebook_like" ></a>
<a class="addthis_button_tweet"></a>
<a class="addthis_counter addthis_pill_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4cbefdd4299ff9e6"></script>
<!-- AddThis Button END -->
                       </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Ürün Markası:</td>
                            <td class="auto-style4"><%#Eval("MarkaAd") %></td>
                        </tr>
                        <tr>
                            <td class="auto-style3" >Ürün Fiyatı:</td>
                            <td class="auto-style4"><%#Eval("UrunFiyat") %></td>
                        </tr>
                        
                        <tr>
                            <td class="auto-style3">KDV:</td>
                            <td class="auto-style4"><%#Convert.ToDouble(Eval("UrunFiyat")) %> TL + <%#Convert.ToDouble(Eval("KDV")) %> %</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Toplam Fiyat:</td>
                            <td style="color: #FF0000" class="auto-style4"><b> <%#Convert.ToDouble(Eval("UrunFiyat"))+ Convert.ToDouble(Eval("UrunFiyat"))/100 * Convert.ToInt32(Eval("KDV"))%> TL </b></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
                    </td>
                    <td class="auto-style7">
                        <asp:FormView ID="FormView6" runat="server">
                            <ItemTemplate>
                            <a href="Default.aspx?ad=sepet&islem=ekle&id=<%#Eval("UrunID") %>"><img src="/resimler/sepete-ekle.jpg" border="0" alt="Sepete At" /></a>
                                
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:Label ID="lblStok" runat="server" ForeColor="Red" style="font-weight: 700; font-size: xx-large" Text="STOKTA YOK!"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" style="font-size: large; color: #FF0000" Text="Satın Almak için Ödemelerinizi Yapmalısınız." Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            
            <br />
            <asp:FormView ID="FormView2" runat="server">
                <ItemTemplate>
                    <a href='Urunler/<%#Eval("Resim2") %>' class="highslide" onclick="return hs.expand(this)" style="float:right;margin:0 0 10px 15px">
                    <img src="Urunler/<%#Eval("Resim2") %>" style="width:90px;height:100px" />
                    </a>
                    <a href='Urunler/<%#Eval("Resim3") %>' class="highslide" onclick="return hs.expand(this)" style="float:right;margin:0 0 10px 15px">
                    <img src="Urunler/<%#Eval("Resim3") %>" style="width:90px;height:100px" />
                    </a>
                    <a href='Urunler/<%#Eval("Resim4") %>' class="highslide" onclick="return hs.expand(this)" style="float:right;margin:0 0 10px 15px">
                    <img src="Urunler/<%#Eval("Resim4") %>" style="width:90px;height:100px" />
                    </a>
                    <a href='Urunler/<%#Eval("Resim5") %>' class="highslide" onclick="return hs.expand(this)" style="float:right;margin:0 0 10px 15px">
                    <img src="Urunler/<%#Eval("Resim5") %>" style="width:90px;height:100px" />
                    </a>


                </ItemTemplate>
            </asp:FormView>
            <br />
            <ul class="tabs"> 
                <li>
                    <a href="#" rel="view1">Ürün Detay</a>

                </li> 
                <li>
                    <a href="#" rel="view2">Ürün Yorumları</a>

                </li> 
                <li>
                    <a href="#" rel="view3">Ürün Taksit Seçeneği</a>
                </li> 
                <li>
                    <a href="#" rel="view4">Ürün Videosu</a>

                </li> 

            </ul> 
            <div class="tabcontents"> 
                <div id="view1" class="tabcontent"> 
                    <asp:FormView ID="FormView3" runat="server">
                        <ItemTemplate>
                            <%#Eval("UrunDetay") %>
                        </ItemTemplate>
                    </asp:FormView>

                </div> 
                <div id="view2" class="tabcontent"> 
                    <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <fieldset>
                                             <legend><strong> <%#Eval("Baslik") %></strong></legend>
                                            <%#Eval("Yorum") %>
                                        </fieldset>
                                    </td></tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style6" colspan="3">Ürün Yorumu Ekle</td>
                        </tr>
                        <tr>
                            <td class="auto-style7"><b>Yorum Başlığı:</b></td>
                            <td>
                                <asp:TextBox ID="txtBaslik" runat="server" Width="228px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBaslik" ErrorMessage="*Boş Geçilemez.." Font-Bold="True" ForeColor="Red" ValidationGroup="aa"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"><b>Yorum :</b></td>
                            <td>
                                <asp:TextBox ID="txtYorum" runat="server" Height="104px" TextMode="MultiLine" Width="232px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYorum" ErrorMessage="*Boş Geçilemez.." Font-Bold="True" ForeColor="Red" ValidationGroup="aa"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnEkle" runat="server" Text="YORUM EKLE" ValidationGroup="aa" OnClientClick="return confirm('Yorumunuz Yönetici Onayından Sonra Aktif Olacaktır..');" OnClick="btnEkle_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                      

                </div> 
                <div id="view3" class="tabcontent"> 
                     <asp:FormView ID="FormView4" runat="server">
                        <ItemTemplate>
                            <%#Eval("Taksit") %>
                        </ItemTemplate>
                    </asp:FormView>
                </div> 
                <div id="view4" class="tabcontent"> 
                     <asp:FormView ID="FormView5" runat="server">
                        <ItemTemplate>
                            <object id="media" height="200" width="200" type="video/x-ms-wmv">
                                <param name="filename" value='Urunler/<%#Eval("Video") %>' />

                            </object>
                           
                        </ItemTemplate>
                    </asp:FormView>
                </div> 

            </div>
            
            
        </td>
    </tr>
</table>











  






   
