using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_yoneticiler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    // datacontext baglantımızı kurduk.

    protected void Page_Load(object sender, EventArgs e)
    {
        var yoneticiler = et.YoneticileriGetir();//Veritabanındaki bilgileri aldık.
        rptYoneticiler.DataSource = yoneticiler; //veriyi nerden çekeceğini gösterdik.
        rptYoneticiler.DataBind(); // veriye Bağlandık.

        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil();
        //adres çubuğunda işlem = sil ise ve id si boş değil ise Sil işlemini yap.
        if (Request.QueryString["islem"] == "guncelle" && Request.QueryString["id"] != null) BilgiGetir();
        
    }

    public void Sil() // Fonksiyon tanımladık.
    {
        et.YoneticiSil(int.Parse(Request.QueryString["id"])); // adres çubugundaki id li olan yöneticiyi sil.
        Response.Redirect("Yonetim.aspx?ad=yoneticiler"); // sayfamızıda güncelledik.
    
    }
    public void yenikayit()
    { 
        et.YoneticiEkle(txtYoneticiAd.Text,FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text,"sha1"));
        //yeni yönetici ekleme işlemi gerçekleştirildi stored procedure oluşturularak.
        Response.Redirect("Yonetim.aspx?ad=yoneticiler"); // sayfa güncellendi.
    
    }
    public void BilgiGetir()
    { 
        var yoneticiler = et.YoneticileriGetir().Where(v=>v.YoneticiID == int.Parse(Request.QueryString["id"]));
        var yonet = yoneticiler.FirstOrDefault();
        txtYoneticiAd.Text = yonet.YoneticiAd;
    }

    public void Duzenle()
    { 
        et.YoneticiDuzenle(int.Parse(Request.QueryString["id"]),txtYoneticiAd.Text,FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text,"sha1"));
        Response.Redirect("Yonetim.aspx?ad=yoneticiler");
    
    }


    protected void btnEkleGuncelle_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["islem"] == null) yenikayit(); // adres çubugunda işlem boş ise yeni kayıta git.
        else Duzenle();
    }
}