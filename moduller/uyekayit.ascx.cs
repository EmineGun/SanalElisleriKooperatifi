using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_uyekayit : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    //eticaret datacontext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnkayit_Click(object sender, EventArgs e)
    {
        //var uyemiz = et.UyeKayit(txtUyeAd.Text, txtEposta.Text, txtSifre.Text, txtAdres.Text, txtTel.Text, DateTime.Now, drpSehir.SelectedItem.Text, drpilce.SelectedItem.Text, 0);

        if (uyevarmi(txtEposta.Text)=="yok") // üye yok ise
        {

        Uyeler uye = new Uyeler();//Uyeler class uye değişkeni tanımladık.
        uye.UyeAdSoyad = txtUyeAd.Text;
        //uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.UyeEposta = txtEposta.Text;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.Sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text, "sha1");//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        //veri tabanımıza sşifryi sha1 kullanarak şifreleme yaptık.          
        uye.Adres = txtAdres.Text;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.GSM = txtTel.Text;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.EklenmeTarihi = DateTime.Now;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.Onay = 0;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.Sehir = drpSehir.SelectedItem.Text;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
        uye.ilce = drpilce.SelectedItem.Text;//uye değişkeniyle veri tabanımıza ulaştık ve ilgili alanı Text ile aldık.
            
        et.Uyelers.InsertOnSubmit(uye); //veritabanımıza insert ettik.
        et.SubmitChanges(); //Veritabanımızdaki değişikler yapıldı.

        lblDurum.Visible = true;// Labelimizin görünürlüğünü true yaptık.
        lblDurum.Text = "Talebiniz Alındı.Yönetici Onayından sonra giriş yapabilirsiniz." + "<meta http-equiv='refresh' Content='3;url=Default.aspx'>";
        // meta tag ile 3 saniye sonra Default.aspx sayfasına yönlendirme yaptık.
        }
        else // üye var ise 
        {
            lblDurum.Visible = true; // Labelimizin görünürlüğünü true yaptık.
            lblDurum.Text = "Girdiğiniz E-posta ile Kayıtlı Kullanıcı var Farklı E-Posta Giriniz.";

        }
    }

    public string uyevarmi(string email) // fonksiyon oluşturduk.
    {
        var kullanicilar = et.Uyelers.Where(v => v.UyeEposta == email); // girilen email adresini veritabanıyla karsılaştırıp aldık.
        var uye = kullanicilar.FirstOrDefault(); // uyeler değişkenine atadık.
        if (uye != null) // eger üye kayıtlı ise
        { 
            return  "var";
        }
        else // eger üye'de hiç bir veri yok ise
	    {
                return "yok";
	    }
    
    }
}