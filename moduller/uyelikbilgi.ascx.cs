using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_uyelikbilgi : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Data Context nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        var uye = et.Uyelers.Where(v => v.UyeEposta == Session["UyeEposta"]).FirstOrDefault(); // Session tutlan uye eposta ile veritabanındaki eposta karsılastırılıp
        //uye adındaki değiişkende bilgileri tuttuk.

        //Bu bilgileri ilgilii text alanlarında gösterdik.

        txtUyeAd.Text = uye.UyeAdSoyad;
        txtAdres.Text = uye.Adres;
        txtil.Text = uye.Sehir;
        txtilce.Text = uye.ilce;
        txtTel.Text = uye.GSM;
    }
    protected void btnguncelle_Click(object sender, EventArgs e)
    {
        //Bilgileri güncellemek stored procedure olusturduk. ve güncelle işlemlerini gerçekleştirdik.
        et.uyelikguncelle(txtUyeAd.Text, txtAdres.Text, txtTel.Text, txtil.Text, txtilce.Text, Session["UyeEposta"].ToString());
        et.SubmitChanges();// Değişiklikleri kaydettik.
        Response.Redirect("Default.aspx");// Ve sayfamızı yönlendirdik.
    }

    protected void btnDegistir_Click(object sender, EventArgs e)
    {
        // Panel Görünürlüklerini değiştirildi.
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void btnsifre_Click(object sender, EventArgs e)
    {
        try 
        {	     
            // Stored procedure ile şifre değiştirme işlemini yaptık.
              et.SifreDegistir(Session["UyeEposta"].ToString(),FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre1.Text,"sha1"));
                lblBilgi.Text="Şifreniz Değiştirildi";// Şifre değiştirildi mesajı verildi.
        }
	    catch (Exception ee)
	    {
            // Eğer şifre değiştirilemezse hata mesajını verdirdik.
		lblBilgi.Text="Şifreniz Değiştirilemedi! "+ee.ToString();
	    }
        finally {}
      

    }
}