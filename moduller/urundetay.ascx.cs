using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_urundetay : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // data context nesnemizi olusturdur.

    protected void Page_Load(object sender, EventArgs e)
    {
      
        stokvaryok();// Ürün stok var yok fonksiyonun çağırdık.
        // Veritabanımıza baglandık tabloları birleştirerek çünkü markaAD adlı kolonumuz Urunler tablosunda yoktu.
        //Ona ulasmak içinde Ürünler tablosu ile markalar Tablosunu birleştirdik.
        var urun = (from u in et.Urunlers.Where(v => v.UrunID == Convert.ToInt32(Request.QueryString["id"].ToString()))
                    join u2 in et.Markalars on u.MarkaID equals u2.MarkaID
                    select new {u.UrunID, u.UrunAD, u.UrunDetay, u.UrunFiyat, u.KDV, u.Resim1, u.Resim2, u.Resim3, u.Resim4, u.Resim5, u.Video, u.Taksit, u2.MarkaAD });

        //Ürün Adımızı almak için veritabanımıza bağlandık.
        var urunad = et.Urunlers.Where(v => v.UrunID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        lblAD.Text = urunad.UrunAD; // Ürün adımızı veritabanından alarak Label'ımıza atadık.



        FormView1.DataSource = urun; // sonucumuzu FormView'umuza attık.
        FormView1.DataBind();

        FormView2.DataSource = urun; // Ürün Resimlerinin gösterimi için FormView2 ile bağlantımızı kurduk.
        FormView2.DataBind();
        FormView3.DataSource = urun;
        FormView3.DataBind();
        FormView4.DataSource = urun;
        FormView4.DataBind();
        FormView5.DataSource = urun;
        FormView5.DataBind();
        FormView6.DataSource = urun;
        FormView6.DataBind();
        yorumgetir();

     
    }
    public void yorumgetir()
    {
        var yorum = from y in et.Yorumlars.Where(v => v.Durum == 1)
                    where y.UrunID == Convert.ToInt32(Request.QueryString["id"].ToString())
                    select y;
        DataList1.DataSource = yorum;
        DataList1.DataBind();
    
    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {

        if (txtBaslik.Text!=""|| txtYorum.Text!="")
        {
            et.YorumEkle(Convert.ToInt32(Request.QueryString["id"].ToString()), txtBaslik.Text, txtYorum.Text, 0);
            txtBaslik.Text = txtYorum.Text = "";
        }
        
    }

    public void stokvaryok()
    {
        var urunstok = et.StokKartis.Where(v => v.UrunID == Convert.ToInt32(Request.QueryString["id"])).FirstOrDefault(); // Seçili olan ürünün id si alıp stok karti tablosunda olup olmadıgının konstrolunu yaptık. ve bu ürüne ait stokkartı bilkgileri tuttuk.

        if (urunstok.MevcutMiktar != 0) // Eğer ürünün mevcut miktarı 0 dan farklıysa
        {
            FormView6.Visible = true; // sepete at bölümünü aktif yap
            lblStok.Visible = false; // Stok yok bölümünü pasif yap.
            risklimit(); // Risk Lİmiti fonksiyonuna git.
        
        
        }
        else // eğer ürünün mevcut miktarı 0 ise
        {
            FormView6.Visible = false; // sepete at bölümünü pasif yap
            lblStok.Visible = true; // Stok yok bölümünü aktif yap.
        }
    
    }

    public void risklimit() // ÜYENİN ALIŞVERİŞ YAPILMASINA İZİN VERİLİP VERİLMEYECEĞİNİN KONTROLU YAPILDI.
    {
        var urun = et.Urunlers.Where(v=>v.UrunID==Convert.ToInt32(Request.QueryString["id"])).FirstOrDefault(); // Seçili ürün bilgilerine ulaştık.
        decimal sonkredi;
        
        if (Session["UyeEposta"] != null) // Üye Girişi yapıldıysa.
        {
            var cari = et.Caris.Where(v => v.Eposta == Session["UyeEposta"]).FirstOrDefault();//Giriş Yapmış KUllanıcının cari tablosundaki bilgilerine ulaştık     

            sonkredi = Convert.ToDecimal(((urun.UrunFiyat / 100 * urun.KDV) + urun.UrunFiyat) + cari.BorcuBakiye); // ürüne ait ürün fiyat ve kdvsene ulaşıp toplam tutarı hesapladık ve cari tablosundaki borç bakiyesiyle topladık.

           
            if (cari != null) // Cari Tablosunda üye var ise
            {
                if (cari.RiskLimiti > sonkredi) // RiskLİmiti büyük ise seçilmiş olan ürün+üyeye ait borcbakiyesi
                {
                    Label1.Visible = false;
                    FormView6.Visible = true;
                
                }
                else // Risk Limiti küçük ise alış veriş yapmayı engelledik.
                {
                    Label1.Visible = true;
                    FormView6.Visible = false;
                }
            
            }
        
        }
        else // Üye Girişi yapılmadıysa ürün detay bilgilerine ulaşmasını aktif yaptık.
        {
            Label1.Visible = false;
            FormView6.Visible = true;
        }

    
    }
  

}