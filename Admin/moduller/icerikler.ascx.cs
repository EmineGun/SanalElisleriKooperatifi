using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_icerikler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext Nesnemizi oluşturduk.

    protected void Page_Load(object sender, EventArgs e)
    {
        getir();
        if (Request.QueryString["islem"] == "duzenle" && Request.QueryString["id"] != null) bilgilerigetir(); // Eğer islem=duzenle ise ve ID boş değil ise bilgileri getir fonksiyonuna git.
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil(); // eğer islem = sil ise ve ID boş değil ise Sil Fonksiyonuna git dedik.
    }

    public void icerikekle() // Yeni İçerik Eklemek İçin Fonksiyon Oluşturduk.
    {
        et.icerikekle(txticerikAd.Text, FCKeditor1.Value); // Stored Procedure kullanarak veritabanına bilgi ekledik.
        Response.Redirect("Yonetim.aspx?ad=icerikler"); // sayfamızı yeniledik.
    
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.QueryString["islem"] == null) icerikekle(); // eğer islem = boş ise yeni veri ekleme işlemine git.
        else duzenle(); // islem boş değil ise düzenle işlemine git dedik.
    }
    public void getir()
    {
        var icerik = from v in et.iceriklers
                     select v;
        DataList1.DataSource = icerik;
        DataList1.DataBind();
    
    }

    public void bilgilerigetir()
    {
        // Seçilmiş olan içeiğin veritabanındaki bilgilerini ilgili textbox ve FCKeditore getirdik.
       
        var icerik = et.icerikgetir(int.Parse(Request.QueryString["id"])).FirstOrDefault();
        txticerikAd.Text = icerik.IcerikBaslik;
        FCKeditor1.Value = icerik.Icerik;
    
    }
    public void duzenle()
    {
        // Stored procedure kullanarak yeni bilgileri veritabanına Aktardık.
        et.icerikguncelle(txticerikAd.Text, FCKeditor1.Value, int.Parse(Request.QueryString["id"]));
        Response.Redirect("Yonetim.aspx?ad=icerikler");
    
    }
    public void Sil()
    {
        // Stored procedure kullanarak silme işlemini gerçekleştirdik.
        et.iceriksil(int.Parse(Request.QueryString["id"]));
        Response.Redirect("Yonetim.aspx?ad=icerikler");
    
    }
}