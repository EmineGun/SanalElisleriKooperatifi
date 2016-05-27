<%@ Control Language="C#" AutoEventWireup="true" CodeFile="altkategoriurun.ascx.cs" Inherits="moduller_altkategoriurun" %>
<%@ Register assembly="CollectionPager" namespace="SiteUtils" tagprefix="cc1" %>


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
            <asp:Label ID="lblALTAD" runat="server"></asp:Label>
&nbsp;Alt Kategorisine Ait Ürünlerimiz</td>
        <td class="auto-style1">
            <img alt="" src="/temalar/resim/dmt_right.png" style="height: 34px" /></td>
    </tr>
    <tr>
        <td colspan="3" style="background-color:#CCFFFF ; vertical-align: top;">

            <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatColumns="3">
                <ItemTemplate>
                    <fieldset style="padding-left:0;padding-right:0;"><legend style="color:red;text-align:center">
                         <a href="Default.aspx?ad=urundetay&id=<%#Eval("UrunID") %>"><b><%#Eval("UrunAD") %></b></a></legend>
                        <table style="width:100%">
                            <tr style="text-align:center">
                                <td style="vertical-align:top">
                                     <a href="Default.aspx?ad=urundetay&id=<%#Eval("UrunID") %>">
                                         <img src="Urunler/<%#Eval("Resim1") %>" alt="<%#Eval("UrunAD") %>" style="border:0px;height:100px;width:100px;" />
                                         </a></td>
                            </tr>
                            <tr><td style="text-align:center">MARKA: <%#Eval("MarkaAD") %></td>
                                
                            </tr>

                            <tr><td style="text-align:center">FİYAT: <%#Convert.ToDouble(Eval("UrunFiyat")) %>TL</td>
                            </tr>
                            <tr><td style="text-align:center"> <a href="Default.aspx?ad=sepet&islem=ekle&id=<%#Eval("UrunID") %>"> <img src="/resimler/sepet.png" style="border:0px;" alt="Sepet Ekle" /> </a> </td></tr>
                            <tr><td style="text-align:center">  <a href="Default.aspx?ad=urundetay&id=<%#Eval("UrunID") %>"><img src="/resimler/urundetay.gif" style="border:0px;" alt="Ürün Detay" /> </a> </td></tr>
                            
                        </table>
                    </fieldset>
                </ItemTemplate>

            </asp:DataList>
        </td>
    </tr>
</table>









<cc1:CollectionPager ID="CollectionPager1" runat="server" BackText="« Geri" LabelText="Sayfa:" NextText="Sonraki »" PageSize="6" ResultsFormat="Sonuçlar {0}-{1} (of {2})">
</cc1:CollectionPager>

