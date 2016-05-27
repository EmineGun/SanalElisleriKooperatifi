using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_satinal : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Data COntext Nesnemizi ekledik.
    string sayi=DateTime.Now.Second.ToString()+DateTime.Now.Millisecond.ToString(); // Evrak NoBilgisini yazmak için oluşturduk..

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UyeEposta"] == null) Response.Redirect("Default.aspx"); // Eğer kullanıcı Girişi Yapılmadıysa Anasayfaya Dön dedik.
        bilgilerigetir(); // kUllanıcı Yapıldıysa  bilgileri getir ve sepet fonksiyonuna git dedik.

        var puan = et.PuanKullanicis.Where(v => v.UyeEposta == Session["UyeEposta"]).FirstOrDefault();

        if (puan != null)
        {
            rdbPuan.Visible = true;
            rdbPuan.Text = Convert.ToDouble(puan.Puan).ToString();
        }
        else
        {
            rdbPuan.Visible = false;
        }
        sepetgetir();

    }
    public void bilgilerigetir()
    {
        // Üye Eposta ile Giriş yapan kişiye ulaşıp uye adında değişkene atadık.
        var uye = et.UyeleriGetir().Where(v => v.UyeEposta == Session["UyeEposta"].ToString()).FirstOrDefault();
        //Veritabanındaki bilgileri uye. yazarak ilgili textboxlarda görüntülenmesini yaptık.
        txtUyeAdSoyad.Text = uye.UyeAdSoyad;
        txtTelefon.Text = uye.GSM;
        txtEposta.Text = uye.UyeEposta;
        txtAdres.Text = uye.Adres;
        txtTel.Text = uye.GSM;
        txtil.Text = uye.Sehir;
        txtilce.Text = uye.ilce;

        // Hesap NUmaralarımızı kendimiz bağlamak için Hesapnumaralari adındaki Veritabanındaki Tablomuza baglandık ve bankalar adındaki değişkenimize atadık.

        drpBankaHesap.Items.Clear();
        var bankalar = et.Hesapnumaralaris;
        //Banka Tablosundaki bilgilerimizi dropdownlist'imize ekledik.
        foreach (var item in bankalar)
        {
            drpBankaHesap.Items.Add(new ListItem(item.Banka + "-Şube Adı:" + item.SubeAdi + "-Şube Kodu:" + item.SubeKodu + "-Hesap Türü:" + item.HesapTuru + "-Hesap No:" + item.HesapNo + "-IBAN:" + item.IBAN));

        }


    }
    protected void btnTeslimat_Click(object sender, EventArgs e)
    {
        // Panel Ayarlanmasını yaptık.
        pnlTeslimat.Visible = false;
        pnlOdemeSecenekleri.Visible = true;
    }

    public void sepetgetir() // SEPET BİLGİLERİMİZİ GETİRDİK:
    {
        int uyeid;
        if (Session["UyeEposta"] != null) // UyeEposta girişi yapıldıysa aşagıdaki işlemleri yap eğer kullanıcı girişi yapılmadıysa else'e git
        {
            // UyeEpostaya ait UyeID yi aldık.
            uyeid = (from u in et.Uyelers
                     where u.UyeEposta == Session["UyeEposta"].ToString()
                     select u.UyeID).FirstOrDefault();

            //Uyeden kaç kez tekrarlanmışsa okadar satır ilerle dedik. Bunuda Count işlemiyle saydırdık.
            var sepetg = et.sepetgetir(uyeid).Count();
            int adet = sepetg; // saydıgımız sepetg deki sayıyı adet isimli int değerli değişkene atadık.

            if (adet != 0) //Yani eğer adet değişkenimiz = 0 farklıysa(Sepet işleminde eklenmiş ürün var ise)
            {
                // Sepeti getir stored procedur ile Urunler Tablosunu birleştirerek gerekli bilgileri aldık.
                var getir = (from u1 in et.sepetgetir(uyeid)
                             join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                             where u1.UrunID == u2.UrunID
                             select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });
                // Repeater'ımıza bağladık.
                Repeater1.DataSource = getir;
                Repeater1.DataBind();

            }
        }
    }

    public void sepetsil() // SEPET SİLME İŞLEMİ YAPILDI
    {
    //    //Stored procedure ile silme işlemimizi yaptık. SepetID'imizi alarak.
    //    et.sepetsil(int.Parse(Request.QueryString["id"]));
    //    Response.Redirect("Default.aspx?ad=sepet"); // Sayfamızı Yeniledik.


        int UyeID = (from v in et.Uyelers
                     where v.UyeEposta == Session["UyeEposta"].ToString()
                     select v.UyeID).FirstOrDefault();

        var sgetir = et.sepetgetir(UyeID);
        foreach (var item in sgetir)
        {
            et.sepetsil(item.SepetID);
            pnlSiparis.Visible = true;
            
        }


    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (RadioButtonList1.Text=="Teslimatta Ödeme")//EĞER SEÇİLİ OLAN YER TESLİMATTA ÖDE İSE ALTTAKİ İŞLEMLERİ YAP.
        {
            pnlBanka.Visible = false;
            pnlKargo.Visible = true;
            pnlOdeme.Visible = false;
            btnOdemeSecenekleri.Visible = true;
            btnGeri.Visible = true;
        }
        if (RadioButtonList1.Text=="Havale")
        {
            pnlOdemeSecenekleri.Visible = true;
            pnlBanka.Visible = true;
            pnlOdeme.Visible = false;
            btnOdemeSecenekleri.Visible = true;
            btnGeri.Visible = true;
        }
        if (RadioButtonList1.Text == "Kredi Kartı")
        {
            pnlOdemeSecenekleri.Visible = true;
            pnlBanka.Visible = false;
            btnOdemeSecenekleri.Visible = false;
            pnlOdeme.Visible = true;
            btnGeri.Visible = false;
        }


    }
    protected void drpKargo_SelectedIndexChanged(object sender, EventArgs e)
    {
        int uyeid;
        double toplam = 0;

        double kid = Convert.ToInt32(drpKargo.SelectedValue.ToString());// SEÇLİ OLAN KARGO ADIN HANGİ KORGO ID YE BAĞLI OLDUGUNU BULDUK.
        double kargoF = et.Kargos.Where(v => v.ID == kid).Select(s => Convert.ToDouble(s.Fiyat)).SingleOrDefault();// O KARGO AİT FİYATI ALDIK.
        lblKargo.Text = kargoF.ToString(); // LABEL DE FİYATIMIZI GÖSTERDİK.


        // UyeEpostaya ait UyeID yi aldık.
        uyeid = (from u in et.Uyelers
                 where u.UyeEposta == Session["UyeEposta"].ToString()
                 select u.UyeID).FirstOrDefault();


        var getir3 = (from u1 in et.sepetgetir(uyeid)
                      join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                      where u1.UrunID == u2.UrunID
                      select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });

        //ÜYE'YE AİT SEPETTEKİ ÜRÜNLERİN FİYATI + KARGO FİYATINI LABEL DA GOSTERME İŞLEMİNİ YAPTIK.

        if (rdbPuan.Checked)
        {
            KullaniciPuanKullan();
        
        }
        else
        {
            toplam = getir3.Sum(s => Convert.ToDouble(s.Adet * (s.UrunFiyat + (s.UrunFiyat / 100 * Convert.ToInt32(s.KDV)))) + kargoF);
            lblFiyat.Text = toplam.ToString();
        }
    }
    protected void btnOdemeSecenekleri_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.Text == "Teslimatta Ödeme") // EĞER RB SEÇİLİ OLAN TESLİMATTA ÖDE İSE ALTTAKİ İŞLEMLERİ YAP DEDİK.
        {
            pnlSiparis.Visible = true;
            pnlOdemeSecenekleri.Visible = false;

            teslimatode(); // PnlSipariş PANELİ İÇİN BİR FONKSİYON OLUSTURDUK.
            
        
        }

        if (RadioButtonList1.Text == "Havale") // EĞER RB SEÇİLİ OLAN HAVALE İSE ALTTAKİ İŞLEMLERİ YAP DEDİK.
        {
            pnlSiparis.Visible = true;
            pnlOdemeSecenekleri.Visible = false;

            havale(); // PnlSipariş PANELİ İÇİN BİR FONKSİYON OLUSTURDUK.

        }
        if (RadioButtonList1.Text == "Kredi Kartı")
        {
            pnlOdeme.Visible = true;

           
        }

        sepetsil();

    }
    public void teslimatode()
    {
        siparisekle();
        // 4. adım için labelda bilgilendirme işlemini yaptık.
  
        lblSonuc.Text = "Bizi Tercih ettiğiniz İçin Teşekkür Ederiz..";
    
    }
    public void havale()
    {
        siparisekle();
        lblSonuc.Text = "Bizi Tercih ettiğiniz İçin Teşekkür Ederiz..";
        lblSonuc.Text += "Seçtiğiniz banka hesabı <br/>"+drpBankaHesap.Text +"<br/>"+"<br/><a href='Default.aspx?ad=odemetalep'> Ödeme Yaptıysanız Ödeme Bildirini Yapınız.. </a>";
    
    }
    public void kredi() // Kredi Kartı seçeneğimizin Son aşaması için 4. aşama bilgilendirme işlemimizi yaptık.
    {
        siparisekle();
        lblSonuc.Text = "Bizi Tercih ettiğiniz İçin Teşekkür Ederiz..";
    
    }



    protected void btnTamamla_Click(object sender, EventArgs e)
    {

        kredikarti();
        sepetsil();
        pnlOdemeSecenekleri.Visible = false;
        pnlSiparis.Visible = true;
    }
    public void kredikarti() // btnTamamlama_Click işleminde çağırdık.
    {
        // textboxt ve dropdownListte girilmiş olan bilgilerin veritabanındaki bilgilerle eşleşip eşleşmediğinin kontrolunu yaptık.
        var kart = et.KrediKartBilgileris.Where(v => v.KartNo == txtKartNo.Text && v.KartSahibi == txtKartAd.Text && v.Ay == DropDownList1.SelectedItem.Text && v.Yil == DropDownList2.SelectedItem.Text && v.CVV == txtCVC2.Text).FirstOrDefault();
        if (kart!=null) //Kart bilgisi boş deil ise
        {
            Session["KartNo"] = kart.KartNo; // kart da alınan karnomuzu session ile tuttuk 
            lblBilgi.Text = "Ödeme İşleminiz Başarıyla Gerçekleşti"; // bilgilendirme işlemini yaptık.
            pnlOdeme.Visible = false;
            pnlKargo.Visible = false;
            pnlOdemeSecenekleri.Visible = false;
            kredi(); // Son aşama için fonksiyon olusturduk.
            
        }
        else // Eğer textbox ve DDL de girilen bilgiler yanlış ise;
        {
            lblBilgi.Text = "Hatalı Giriş Yaptınız!..";
        }
    
    }


    protected void btnGeri_Click(object sender, EventArgs e)
    {
        pnlTeslimat.Visible = true;
        pnlOdemeSecenekleri.Visible = false;
        pnlOdeme.Visible = false;
        pnlSiparis.Visible = false;
    }
    protected void btnOdemeGeri_Click(object sender, EventArgs e)
    {
        pnlTeslimat.Visible = true;
        pnlOdemeSecenekleri.Visible = false;
        pnlOdeme.Visible = false;
        pnlSiparis.Visible = false;
    }

    public void siparisekle()
    {
        Sipari se = new Sipari(); // Siparis tablomuza bağlandık. se adında siparis değerinde bir değişken tanımladık.
        // Bu değişken yardımıyla da girilen bilgilerin veritabanına aktarımını yaptık.

        se.UyeEposta = Session["UyeEposta"].ToString();
        se.AdSoyad = txtAdSoyad.Text;
        se.Adres = txtAdres2.Text;
        se.PostaKodu = txtPostaKodu.Text;
        se.Ulke = txtUlke.Text;
        se.il = txtil.Text;
        se.ilce = txtilce.Text;
        se.GSM = txtTel.Text;
        se.OdemeSekli = RadioButtonList1.Text;
        se.Kargo = drpKargo.SelectedItem.Text;

        if (RadioButtonList1.Text=="Havale") // RadioButtondan eğer havale seçili ise bilgi girişini yap seçilmediyse null ata dedik.
        {
            se.BankaHesap = drpBankaHesap.SelectedItem.Text;
            
        }
        else
        {
            se.BankaHesap = null;
        }
        se.KargoNotu = txtKargoNotu.Text;
        se.SiparisNotu = txtSiparisNotu.Text;
        se.Durum = 0;

        // Kişişye  ait IP bilgisini aldık.
        string ip;
        ip = Request["REMOTE_ADDR"].ToString();
        se.IP = ip;

        // Sepettki ürün ve kargo fiyatını hesaplattık ve veritabanına ekledik.

        int uyeid;
        double toplam = 0;
        double kid = Convert.ToInt32(drpKargo.SelectedValue.ToString());// SEÇLİ OLAN KARGO ADIN HANGİ KORGO ID YE BAĞLI OLDUGUNU BULDUK.
        double kargoF = et.Kargos.Where(v => v.ID == kid).Select(s => Convert.ToDouble(s.Fiyat)).SingleOrDefault();// O KARGO AİT FİYATI ALDIK.
        lblKargo.Text = kargoF.ToString(); // LABEL DE FİYATIMIZI GÖSTERDİK.



        uyeid = (from u in et.Uyelers
                 where u.UyeEposta == Session["UyeEposta"].ToString()
                 select u.UyeID).FirstOrDefault();


        var getir3 = (from u1 in et.sepetgetir(uyeid)
                      join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                      where u1.UrunID == u2.UrunID
                      select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });

        //ÜYE'YE AİT SEPETTEKİ ÜRÜNLERİN FİYATI + KARGO FİYATINI LABEL DA GOSTERME İŞLEMİNİ YAPTIK.

        toplam = getir3.Sum(s => Convert.ToDouble(s.Adet * (s.UrunFiyat + (s.UrunFiyat / 100 * Convert.ToInt32(s.KDV)))) + kargoF);

        se.ToplamTutar = Convert.ToDecimal(toplam);

        //Zaman adında DATETİME değerinde bir değişken tanımladık.

        DateTime zaman;
        zaman = DateTime.Now; // bugunun zamanını verdik.
        se.EklenmeTarihi = zaman;


        et.Siparis.InsertOnSubmit(se);
        et.SubmitChanges();

        // Siparişteki ürün bilgileri almak için bir tane Sepet_siparis tablosu olusturmustuk Bu tabloya bilgi atama işlemlerimizi yaptık
        //Stored Procedure yardımıyla..

       
        var sgetir = et.sepetgetir(uyeid);

        var uye = et.Uyelers.Where(v=>v.UyeID==uyeid).FirstOrDefault();
        foreach (var item in sgetir)
        {
            var fiyat=et.Urunlers.Where(v=>v.UrunID==item.UrunID).FirstOrDefault(); // Urunler tablosunda urunne ait bilgileri aldık.
            et.sepet_siparisekle(Session["UyeEposta"].ToString(), item.UrunID, zaman, item.Adet, ip);

            var urunbul= et.StokKartis.Where(v=>v.UrunID==item.UrunID).FirstOrDefault(); // Stokkartindaki Urune ulaştık.
            var miktar = urunbul.MevcutMiktar; // Urunbuldaki bilgilerden MevcurMiktarımızı çektik.
            // Hareketler tablomuza bilgilerimiz ekledik.

            et.Harekets.InsertOnSubmit(new Hareket
            {
                UyeID = uyeid,
                UrunID = item.UrunID,
                islemTarihi = zaman,
                islemTuru = "Çıkış",
                Miktar = item.Adet,
                Fiyat = fiyat.UrunFiyat,
                KDV = fiyat.KDV,
                Tutar = (((fiyat.UrunFiyat / 100 * fiyat.KDV) + fiyat.UrunFiyat) * item.Adet),
                EvrakNo = int.Parse(sayi) // Sayi adında bir string değer türettik ve evrak no olarak verirabanımıza kaydettik
            });
            // StokKArtindaki miktar ve tutar bilgileirnin update işlemini stored procedure ile yaptık.
            et.StokMiktarTutar(urunbul.UrunID,miktar-item.Adet,((urunbul.Fiyat/100*urunbul.KDV)+urunbul.Fiyat)*(miktar-item.Adet));
           
           

            et.CariHarekets.InsertOnSubmit(new CariHareket
            {
                ReferansNo = uyeid,
                Tarih = zaman,
                EvrakNo = int.Parse(sayi),
                AdSoyad = uye.UyeAdSoyad,
                Tutar = (((fiyat.UrunFiyat / 100 * fiyat.KDV) + fiyat.UrunFiyat) * item.Adet)+Convert.ToDecimal(kargoF),
                Aciklama = RadioButtonList1.Text
            }); 
           
        }
        PuanHesapla();
        if (rdbPuan.Checked)
        {
            et.PuanKullaniciGuncel(Session["UyeEposta"].ToString(), 0);
        
        }
        et.SubmitChanges();// Değişiklikleri Kaydettik.
    }

    public void PuanHesapla()
    {
        var puan = et.PuanKullanicis.Where(v=>v.UyeEposta==Session["UyeEposta"]).FirstOrDefault();

        var p1 = et.PuanYoneticis.Where(v => v.OdemeSekli == RadioButtonList1.Text && v.Alan == "1000").FirstOrDefault();
        var p2 = et.PuanYoneticis.Where(v => v.OdemeSekli == RadioButtonList1.Text && v.Alan == "2000").FirstOrDefault();

        if (puan != null)
        {
            if (Convert.ToDecimal(lblFiyat.Text) <= Convert.ToDecimal("1000"))
            {
                et.PuanKullaniciGuncel(Session["UyeEposta"].ToString(), puan.Puan + p1.Puan);
            }
            if (Convert.ToDecimal(lblFiyat.Text) > Convert.ToDecimal("1000") && Convert.ToDecimal(lblFiyat.Text) <= Convert.ToDecimal("2000"))
            {
                et.PuanKullaniciGuncel(Session["UyeEposta"].ToString(), puan.Puan + p2.Puan);

            }
            if (Convert.ToDecimal(lblFiyat.Text) > Convert.ToDecimal("2000"))
            {
                et.PuanKullaniciGuncel(Session["UyeEposta"].ToString(), puan.Puan + 15);
            }

        }
        else
        {
            if (Convert.ToDecimal(lblFiyat.Text) <= Convert.ToDecimal("1000"))
            {
                et.PuanKullanicis.InsertOnSubmit(new PuanKullanici
                {
                    UyeEposta = Session["UyeEposta"].ToString(),
                    Puan = p1.Puan,
                });


            }
            if (Convert.ToDecimal(lblFiyat.Text) > Convert.ToDecimal("1000") && Convert.ToDecimal(lblFiyat.Text) <= Convert.ToDecimal("2000"))
            {
                et.PuanKullanicis.InsertOnSubmit(new PuanKullanici
                {
                    UyeEposta = Session["UyeEposta"].ToString(),
                    Puan = p2.Puan,
                });

            }
            if (Convert.ToDecimal(lblFiyat.Text) > Convert.ToDecimal("2000"))
            {
                et.PuanKullanicis.InsertOnSubmit(new PuanKullanici
                {
                    UyeEposta = Session["UyeEposta"].ToString(),
                    Puan = 15,
                });
            }

        }

        et.SubmitChanges();


    
    }

    public void KullaniciPuanKullan()
    {

        int uyeid;
        double toplam = 0;

        double kid = Convert.ToInt32(drpKargo.SelectedValue.ToString());// SEÇLİ OLAN KARGO ADIN HANGİ KORGO ID YE BAĞLI OLDUGUNU BULDUK.
        double kargoF = et.Kargos.Where(v => v.ID == kid).Select(s => Convert.ToDouble(s.Fiyat)).SingleOrDefault();// O KARGO AİT FİYATI ALDIK.
        lblKargo.Text = kargoF.ToString(); // LABEL DE FİYATIMIZI GÖSTERDİK.
        // UyeEpostaya ait UyeID yi aldık.
        uyeid = (from u in et.Uyelers
                 where u.UyeEposta == Session["UyeEposta"].ToString()
                 select u.UyeID).FirstOrDefault();

        var getir3 = (from u1 in et.sepetgetir(uyeid)
                      join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                      where u1.UrunID == u2.UrunID
                      select new { u1.Adet,u2.UrunFiyat, u2.KDV});

        var puan = et.PuanKullanicis.Where(v => v.UyeEposta == Session["UyeEposta"]).FirstOrDefault();
      
        toplam = getir3.Sum(s => Convert.ToDouble(s.Adet * (s.UrunFiyat + (s.UrunFiyat / 100 * Convert.ToInt32(s.KDV)))) + kargoF-Convert.ToDouble(puan.Puan));
        lblFiyat.Text = toplam.ToString();

    }

    protected void rdbPuan_CheckedChanged(object sender, EventArgs e)
    {
        KullaniciPuanKullan();

    }
}