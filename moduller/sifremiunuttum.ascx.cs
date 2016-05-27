using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_sifremiunuttum : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    // veritabanı bağlantısı için datacontext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aktivasyon"] != null) // eger aktivasyon işlemi bos değilse
        {
            Panel1.Visible = false; // panel 1 görünürlüğü kapatıldı.
            Panel2.Visible = true; // panel 2 görünürlüğü açıldı

            var uyelerim3 = et.Uyelers.Where(v => v.Sifre == Request.QueryString["aktivasyon"].ToString());
            //hangi şifre değişsecekse o kişi aldık
            var uye = uyelerim3.FirstOrDefault(); // uye ye atadık
            lblAd.Text = uye.UyeAdSoyad; // uyenin adını soyadını Label'a yazdırdık.

        }
        else
        {
            Panel1.Visible = true; // panel 1 görünürlüğü acıldı
            Panel2.Visible = false; // panel 2 görünürlüğü kapatıldı.
        }


    }
    protected void btngonder_Click(object sender, EventArgs e)
    {
        var uyelerim = et.Uyelers.Where(v=>v.UyeEposta==txtEposta.Text);// UyeEposta ile uyemizin kontrolunu yaptık.
        var uye = uyelerim.FirstOrDefault(); // uye değişkenimize üyemizi attık.
        if (uye!=null)
        {
            MailAddress alici = new MailAddress(uye.UyeEposta);// Kime mail gideceğini belirttik.
            MailAddress gonderen = new MailAddress("toprakliyagmur@gmail.com","E-ticaret Görsel Dersler"); // Kimden Mail gideceğini belirttik.
            MailMessage mesaj = new MailMessage(gonderen, alici); // mesajın kimden kime gideceğini belirttik.
            mesaj.Subject = "Şifremi Unuttum"; // mesaj başlıgını yazdık.
            mesaj.IsBodyHtml = true; // body kısımda html kullanılacagını belirttik 
            mesaj.Body = "Sayın " + uye.UyeAdSoyad + "</br> Şifre Değiştirme için Aktivasyon Şifrenize Tıklayınız: <a href='http://localhost:1730/Default.aspx?ad=sifremiunuttum&aktivasyon=" + uye.Sifre + "'>" + uye.Sifre + "</a>";
            //Gönderilecek olan mailin body kısmını oluşturduk.Aktivasyon şifresi aldık mailime ekledik aktivayon şifresine tıklayarak şifre değiştirme işlemimiz gerçekleşecek.
            SmtpClient client = new SmtpClient();//yolama işlemini yapmamız için smtpclient değerinde değişken tanımladık
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.Port = 587;
            client.Send(mesaj);// send komutuyla mailimize gönderiyoruz.
            lblDurum.Visible = true; // labelımızın görünürlüğünü true yaptık.
            lblDurum.Text = "E-postanıza Şifre Maili Gönderilmiştir.."+ "<meta http-equiv='refresh' Content='3;url=Default.aspx'>";
            //lbldurum texinde mesaj verildi ve meta tag ile anasayfaya yönlendirme yapıldı.
        }
        else
        {
            lblDurum.Visible = true;
            lblDurum.Text = "Yanlış E-Posta Adresi..";
        }

    }
    protected void btndegistir_Click(object sender, EventArgs e)
    {
        var uyelerim2 = et.Uyelers.Where(v => v.Sifre == Request.QueryString["aktivasyon"].ToString());
        // uyeye ait aktivasyon şifresi kontrolu yapıldı uyelerim2 ye o kişi alındı.
        var uyelerim = et.Uyelers.Where(v=>v.UyeEposta==txtMail.Text);
        // Kişinin e mail adresi alınıp uyelerime atandı
        var uye = uyelerim.FirstOrDefault(); // uye adında değişkene verdik

        try
        {
            et.SifreDegistir(uye.UyeEposta, FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre1.Text, "sha1"));
            // veritabanında bir tane storedprocedure olusturduk adınada SİfreDegistir verdik
            //İlgili Eposta adresi ve şifre değiştirme işlemi gerçekleşti sha1 ile şifreledik.
            lblDurum2.Visible = true;
            lblDurum2.Text = "Şifreniz Değiştirilmiştir.." + "<meta http-equiv='refresh' Content='3;url=Default.aspx'>";
            //Label da mesaj verildi. ve 3 sn sonraAnasayfaya döndürdük



        }
        catch (Exception ee)
        {
            lblDurum2.Visible = true;
            lblDurum2.Text = "Şifreniz Değiştirilemedi.." +ee.ToString(); /// mesaj veridli
       
        }
           
      
           
    }
}










