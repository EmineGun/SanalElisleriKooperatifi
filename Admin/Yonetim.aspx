<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Yonetim.aspx.cs" Inherits="Admin_Yonetim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>YÖNETİCİ PANELİ</title>
<!-- Calendar Styles -->
<link href="styles/fullcalendar.css" rel="stylesheet" type="text/css" />
<!-- Fancybox/Lightbox Effect -->
<link href="styles/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
<!-- WYSIWYG Editor -->
<link href="styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<!-- Main Controlling Styles -->
<link href="styles/main.css" rel="stylesheet" type="text/css" />
<!-- Theme Styles -->
<link href="styles/styles.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="http://dwpe.googlecode.com/svn/trunk/_shared/EnhanceJS/enhance.js"></script>	
   		<script type='text/javascript' src='http://dwpe.googlecode.com/svn/trunk/charting/js/excanvas.js'></script>
        <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js'></script>
        <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js'></script>
        <script type='text/javascript' src="js/jquery.fancybox-1.3.4.pack.js"></script>
        <script type='application/javascript' src="js/fullcalendar.min.js"></script>
        <script type='text/javascript' src="js/jquery.wysiwyg.js"></script>
        <script type='text/javascript' src="js/visualize.jQuery.js"></script>
        <script type='application/javascript' src="js/functions.js"></script>
</head>
<body>
   
    <form id="form1" runat="server">
   
<!-- Top header/black bar start -->
	<div id="header">
    	<img src="images/logo.png" alt="AdminCP" class="logo" />
    </div>
 <!-- Top header/black bar end -->   
    
<!-- Left side bar start -->
        <div id="left">
<!-- Left side bar start -->

<!-- Toolbox dropdown start -->
        	<div id="openCloseIdentifier"></div>
            <div id="slider">
                <ul id="sliderContent">
                    <li><a href="#" title="">Change Username</a></li>
                    <li class="alt"><a href="#" title="">Change Password</a></li>
                    <li><a href="#" title="">Change Address</a></li>
                    <li class="alt"><a href="#" title="">Payment Details</a></li>
                    <li><a href="#" title="">Log Out</a></li>
                </ul>
                <div id="openCloseWrap">
                    <div id="toolbox">
            			<a href="#" title="Toolbox Dropdown" class="toolboxdrop">Toolbox <img src="images/icon_expand_grey.png" alt="Expand" /></a>
            		</div>
                </div>
            </div>
<!-- Toolbox dropdown end -->   
    	
<!-- Userbox/logged in start -->
            <div id="userbox">
            	<p>Welcome</p>
                <p><span>You are logged in as Admin</span></p>
                <ul>
                	<li><a href="Yonetim.aspx?ad=cikis" title="Logout"><img src="images/icon_unlock.png" alt="Logout" /></a></li>
                </ul>
            </div>
<!-- Userbox/logged in end -->  

<!-- Main navigation start -->         
            <ul id="nav">
                <li>
                    <a class="collapsed heading">KATEGORİ İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=anakategoriler" title=""><b>Ana Kategori</b></a></li>
                        <li><a href="Yonetim.aspx?ad=altkategoriler" title=""><b>Alt Kategori</b></a></li>
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">BANNER/FOOTER</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=temalar" title=""><b>Temalar</b></a></li>
                         <li><a href="Yonetim.aspx?ad=icerikler" title=""><b>İçerik Ekle/Düzenle</b></a></li>
                      
                    </ul>
                </li> 
                  <li>
                    <a class="collapsed heading">PUAN</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=puan" title=""><b>Puan Güncelle</b></a></li>
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">ÜRÜN İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=markalar" title=""><b>Marka Ekle/Düzenle/Sil</b></a></li>
                        <li><a href="Yonetim.aspx?ad=urunler" title=""><b>Ürün Ekle</b></a></li>
                        <li><a href="Yonetim.aspx?ad=urunguncellesil" title=""><b>Ürün Güncelle/Sil</b></a></li>
                         <li><a href="Yonetim.aspx?ad=stokguncelle" title=""><b>Stok Ekle/Çıkar</b></a></li>
                        <li><a href="Yonetim.aspx?ad=siparisler" title=""><b>Siparişler</b></a></li>
                        <li><a href="Yonetim.aspx?ad=odemetalep" title=""><b>Ödeme Bildirimi</b></a></li>
                       
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">KARGO/BANKA İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=kargolar" title=""><b>Kargo Ekle/Güncelle/Sil</b></a></li>
                         <li><a href="Yonetim.aspx?ad=bankalar" title=""><b>Banka Ekle/Güncelle/Sil</b></a></li>
                         <li><a href="Yonetim.aspx?ad=bankahareket" title=""><b>Banka Hareket</b></a></li>
                     
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">YORUM İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=urunyorumlari" title=""><b>Yorum Onayla/Sil</b></a></li>
                     
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">VİTRİN İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=Vitrin" title=""><b>Vitrin Ekle/Sil</b></a></li>
                    
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">ÜYE İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=uyeler" title=""><b>Üye Ekle/Düzenle/Sil</b></a></li>
                        <li><a href="Yonetim.aspx?ad=uyelikonay" title=""><b>Üyelik Talep</b></a></li>
                    
                    </ul>
                </li> 
            	<li>
                    <a class="collapsed heading">YÖNETİCİ İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=yoneticiler" title=""><b>Yönetici Ekle/Düzenle/Sil</b></a></li>
                         <li><a href="Yonetim.aspx?ad=cikis" title=""><b>ÇIKIŞ</b></a></li>
                    
                    </ul>
                </li>

                <li>
                    <a class="collapsed heading">MAİL İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=toplumail" title=""><b>Toplu Mail Gönder</b></a></li>
                          <li><a href="Yonetim.aspx?ad=seciliuyemail" title=""><b>Üyeye Mail Gönder</b></a></li>
                         <li><a href="Yonetim.aspx?ad=urunmail" title=""><b>Ürün Mail Gönder</b></a></li>
                         <li><a href="Yonetim.aspx?ad=disaritoplumail" title=""><b>Dışarı Mail Gönder</b></a></li>
                    
                    </ul>
                </li> 
                <li>
                    <a class="collapsed heading">REKLAM İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=reklamlar" title=""><b>Reklam Ekle/Düzenle/Sil</b></a></li>

                    </ul>
                </li> 
                <li>
                    <a class="collapsed heading">CARİ İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=cari" title=""><b>CARİ HAREKETLER</b></a></li>
                    </ul>
                </li> 
                 <li>
                    <a class="collapsed heading">FATURA İŞLEMLERİ</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=fatura" title=""><b>Fatura</b></a></li>
                    </ul>
                </li> 
                <li>
                    <a class="collapsed heading">İSTATİSTİK</a>
                     <ul class="navigation">
                        <li><a href="Yonetim.aspx?ad=istatistik" title=""><b>İstatistik</b></a></li>
                    </ul>
                </li> 
                 
            </ul>
        </div>      
<!-- Main navigation end --> 

<!-- Left side bar start end -->   

<!-- Right side start -->     
        <div id="right">

<!-- Breadcrumb start -->  
            <div id="breadcrumb">
                <ul>	
        			<li><img src="images/icon_breadcrumb.png" alt="Location" /></li>
                    <li><a href="#" title="">Sub Section</a></li>
                    <li>/</li>
                    <li class="current">Control Panel</li>
                </ul>
            </div>
<!-- Breadcrumb end -->  

<!-- Top/large buttons start -->  
<!-- Top/large buttons end -->  

 <!-- Main content start -->      
            <div id="content">

<!-- Charts box start -->          
                
<!-- Website stats start -->               
<!-- Website stats end -->  
               
                <!-- Clear finsih for all floated content boxes --> 
                
<!-- Form elements start -->                 
                
<!-- Form elements end -->  
 
<!-- Gallery start -->   
 <!-- Gallery end -->
 
<!-- Generic style tabbing start -->                 
<!-- Generic style tabbing start -->  
                
                <!-- Clear finsih for all floated content boxes -->
                
<!-- Calendar start -->             
<!-- Calendar end -->
    
<!-- Table styles start -->           
<!-- Table styles end -->  
                
                <!-- Status Bar Start -->
                <!-- Status Bar End -->
                
                 <!-- Red Status Bar Start -->
                <!-- Red Status Bar End -->
                
                <!-- Green Status Bar Start -->
                <!-- Green Status Bar End -->
                
                <!-- Blue Status Bar Start -->
                <!-- Blue Status Bar End -->   
        	    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                <asp:Label ID="lblDurum" runat="server" Visible="False"></asp:Label>
        	</div>
            
<%--<!-- Footer start --> 
            <p id="footer">&copy; <a href="">TOPRAKLI</a></p>
<!-- Footer end --> --%>     
     
        </div>
<!-- Right side end --> 


    </form>


</body>
</html>
