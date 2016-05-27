using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_uyegiris : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    // data context nesnemizi oluşturduk

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UyeEposta"] != null) // üye var ise
        {
            pnlUyeGiris.Visible = false; // panel Uye giriş görünürlüğü False yaptık
            pnlUye.Visible = true; // panel Uye  görünürlüğü true yaptık

            var uyeler = et.Uyelers.Where(v=>v.UyeEposta== Session["UyeEposta"].ToString()); // girilen üye eposta kontrolu yaptık ve uyeler değerine atadık.
            string uyemiz = uyeler.Select(s=>s.UyeAdSoyad).SingleOrDefault();
            //Uyemizin Adını veritabanından aldık ve uyemiz adında bir string değere atamasını yaptık.
            lblAd.Text = "Hosgeldin" + ": " + "<b>" + uyemiz; // uyemiz değeri Label da Hosgeldin UYEADSOYAD şeklinde yazdık.

        }
        else if ((Session["UyeEposta"] == null)&&Request.QueryString["ad"]=="urundetay") // üye yok ise
        {
            pnlUyeGiris.Visible = false; // panel Uye giriş görünürlüğü true yaptık
            pnlUye.Visible = false; // panel Uye görünürlüğü False yaptık
        }
        else
        {
            pnlUyeGiris.Visible = true; // panel Uye giriş görünürlüğü true yaptık
            pnlUye.Visible = false; // panel Uye görünürlüğü False yaptık
        }

        
    }
    protected void btnGiris_Click(object sender, EventArgs e)
    {
        string sifre = FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text, "sha1");
        // sifre adında string türünden değer tanımlayıp şifremizi sha1 ile şifreledir

        var uyelerim = et.Uyelers.Where(v=>v.UyeEposta==txtEposta.Text && v.Sifre== sifre);
        // Girilen Eposta ve şifre veritabanında olup olmadığını arattık
        var uye = uyelerim.FirstOrDefault();
        //uye adında bir değişkene atadık.

        if (uye!= null) // uye null değilse yani bir sonuç döndürmüşsse ve
        {
            if (uye.Onay!=0)  // uyenin veritabanında Onay eğer sıfırdan farklıysa yani 1 ise
            {
                Session["UyeEposta"] = uye.UyeEposta; // üye girişi sağlansın
                Response.Redirect("Default.aspx"); // Anasayfaya aktarsın.(geçiş yapsın)
                
            }
            else // üyemizin onayı = 0 ise
            {
                lblDurum.Visible = true; // label'ımızın görünürlüğünü TRUE yaptık
                lblDurum.Text = "Yönetici Onayı Bekliyor."; // Label'ında Yönetici Onayı Bekliyor mesajı verdirdik.
            }
            
        }
        else // üye veritabanında yok ise
        {
            lblDurum.Visible = true; // Label'ımızın görünürlüğünü TRUE yaptık.
            lblDurum.Text = "Yanlış Giriş"; // Label'ımızın Textine Yanlış Giriş mesajı verdirdik.
        }

    }
    protected void btnCikis_Click(object sender, EventArgs e)
    {
        Session["UyeEposta"] = null; // çıkış işlemi için null ataması yaptık.
        Response.Redirect("Default.aspx"); // anasayfaya göndürme işlemi yaptık.
    }
}