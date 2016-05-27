using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_uyeler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        var uyelerim = et.Uyelers;
        rptUyeler.DataSource = uyelerim;
        rptUyeler.DataBind();
        // Adres cubugundaki işlem ve id kontrollerini yaparak gitmesi gereken fonksiyonlara yönlendirme işlemi yaptık.
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil();
        if (Request.QueryString["islem"] == "guncelle" && Request.QueryString["id"] != null) BilgiGetir();
        if (Request.QueryString["islem"] == "sifredegistir" && Request.QueryString["id"] != null) SifreDegistir();

    }

    public void Sil() //sil fonksiyonu olusturduk.
    {
        Uyeler uye = et.Uyelers.First(v => v.UyeID == int.Parse(Request.QueryString["id"]));
        //link ile veritabanımıza baglanıp seçilen id ile veritabanındaki id yi karşılastırıp uye ye attık.
        et.Uyelers.DeleteOnSubmit(uye); // ilgili üyeyi sildik.
        et.SubmitChanges(); //veritabanında değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=uyeler"); // sayfamızı yeniledik.
    
    }
    public void BilgiGetir() // BilgiGetir fonksiyon oluşturduk.
    {
        Panel1.Visible = true; // panelemizi true yaptık.
        var uyelerim = et.Uyelers.Where(v=>v.UyeID==int.Parse(Request.QueryString["id"])); // VT id ile seçilen id nin kontrolunu yatık.
        var uyem = uyelerim.FirstOrDefault(); // kişiyi uyem adlı değişkende veriyi tuttuk.
        txtAd.Text=uyem.UyeAdSoyad; // alanlara veritabanındaki bilgilerin getirme işlemini yaptık.
        txtAdres.Text=uyem.Adres;
        txtEklenme.Text=uyem.EklenmeTarihi.ToString();
        txtEposta.Text=uyem.UyeEposta;
        txtGsm.Text = uyem.GSM;
        txtilce.Text = uyem.ilce;
        txtSehir.Text = uyem.Sehir;

    
    }
    public void SifreDegistir() // Şifre değiştir fonksiyonu.
    {
        Panel2.Visible = true;
        Uyeler uye = et.Uyelers.First(v => v.UyeID == int.Parse(Request.QueryString["id"]));
        lblAdSoyad.Text = uye.UyeAdSoyad;
        lblEposta.Text = uye.UyeEposta;
        uye.Sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text, "sha1");
        et.SubmitChanges();
   
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        Uyeler uye = et.Uyelers.First(v => v.UyeID == int.Parse(Request.QueryString["id"]));
        uye.UyeAdSoyad = txtAd.Text;
        uye.UyeEposta = txtEposta.Text;
        uye.GSM = txtGsm.Text;
        uye.Sehir = txtSehir.Text;
        uye.ilce = txtilce.Text;
        uye.Adres = txtAdres.Text;
        uye.EklenmeTarihi = Convert.ToDateTime(txtEklenme.Text);
        et.SubmitChanges(); // değişiklikleri veritabanına kayıt ettik.
        Response.Redirect("Yonetim.aspx?ad=uyeler");
    }
    protected void btnSifre_Click(object sender, EventArgs e)
    {
        SifreDegistir();
        Response.Redirect("Yonetim.aspx?ad=uyeler");
    }
}