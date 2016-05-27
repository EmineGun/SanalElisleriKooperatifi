using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_fatura : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();// DataContext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["islem"] == "oku" && Request.QueryString["id"] != null) oku(); // islem oku ve id boş değil ise oku fonksiyonuna gittik.

        var siparisonaylanan = et.Siparis.Where(v => v.Durum == 1); // sipariş durumu 1 olanları (siparişi onaylananları) siparisonaylanan değişkenimde tuttuk.

        Repeater1.DataSource = siparisonaylanan; //verilerimizi göstermeye yarayan repeater1 nesnemize verilerimizi aktardık.
        Repeater1.DataBind();//verilerin gösterilmesini sağladık.
    }

    public void oku()
    {
        Panel1.Visible = true; // panelin görünürlüğünü aktif yaptık.
        Repeater1.Visible = false; // Repeater'ımızın görünürlüğünü pasif yaptık.
        bilgilerigetir();
    }

    public void bilgilerigetir()
    {
        var bilgi = et.Siparis.Where(v => v.ID == int.Parse(Request.QueryString["id"])).FirstOrDefault(); // Tıklenmiş olan satırdaki sipariş id'sini sipariş tablosunda ulaştık 
        //ve bilgi adında bir değişkende tuttuk.
        lblAdSoyad.Text = bilgi.AdSoyad; // Siparişe ait Ad SOyad aldık.
        lblAdres.Text = bilgi.Adres+" "+bilgi.ilce+" / "+bilgi.il; // Adres bilgilerini aldık.
        lblGun.Text = DateTime.Now.ToShortDateString(); // Tarih bilgimizi aldık. 
        lblSaat.Text = DateTime.Now.ToShortTimeString(); // saat bilgimizi aldık.

        var sepetgetir = et.Sepet_Siparis.Where(v => v.EklenmeTarihi == bilgi.EklenmeTarihi);//Sipariş tablosundaki eklenme tarihi ile sepet_sipariş tablosundaki eklenme tarihleri karılaştırıp
        //sepetgetir değişkenin bilgileri tuttuk.

        foreach (var item in sepetgetir)
        {
            // Urunler tablosuyla sepet sipariş tablosunu birbirine bağlayarak datalist'imize bilgileri çektik.
            var detay = (from u in et.Urunlers.Where(v => v.UrunID == item.UrunID)
                         join s in et.Sepet_Siparis.Where(v => v.EklenmeTarihi == bilgi.EklenmeTarihi)
                         on u.UrunID equals s.UrunID
                         where s.UyeEposta == bilgi.UyeEposta
                         select new { u.UrunID, u.UrunAD, u.UrunFiyat, u.KDV, s.Adet });
           // var det = detay.FirstOrDefault();
            DataList1.DataSource = detay; // detay değişkenimizdeki verileri datalist'imze aktardık.
            DataList1.DataBind();// verilerin gösterlmesini sağladık.
            
        }

    }

    protected void btniskonto_Click(object sender, EventArgs e)
    {
        lbliskonto.Text = TextBox1.Text + "%"; // iskonto miktarını textbox da yazılan değeri aldık labelda gösterdik.

        TextBox1.Visible = false; //Textbox ve butonun görünürlüğü pasif yaptık.
        btniskonto.Visible = false;

        var bilgi = et.Siparis.Where(v => v.ID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        var sepet = et.Sepet_Siparis.Where(v => v.EklenmeTarihi == bilgi.EklenmeTarihi);
        var kargo = et.Kargos.Where(v => v.KargoAdi == bilgi.Kargo).FirstOrDefault();
        lblKargo.Text = Convert.ToDouble(kargo.Fiyat).ToString();

        decimal Tutar, iskonto, iskontoTutar, KdvTutar;
        foreach (var item in sepet)
        {
            var detay = (from u in et.Urunlers.Where(v => v.UrunID == item.UrunID)
                         join s in et.Sepet_Siparis.Where(v => v.EklenmeTarihi == bilgi.EklenmeTarihi)
                         on u.UrunID equals s.UrunID
                         where s.UyeEposta == bilgi.UyeEposta
                         select new { u.UrunID, u.UrunAD, u.UrunFiyat, u.KDV, s.Adet });

            Tutar = Convert.ToDecimal(detay.Sum(s => s.Adet * s.UrunFiyat)); // Toplam tutarı hesapladık.
            lbltoplam.Text = Convert.ToDouble(Tutar).ToString(); // Toplam tutarı label da yazdırdık.

            iskonto = Convert.ToDecimal(detay.Sum(s => s.Adet * s.UrunFiyat) / 100 * Convert.ToDecimal(TextBox1.Text)); // iskonto tutarını hesapladık
            lbliskontotutar.Text = Convert.ToDouble(iskonto).ToString(); // ilgili label'da iskonto tutarını gösterdik
            iskontoTutar = Tutar - iskonto; // iskonto yapıldıktan sonraki fiyatı hesapladık.
            lblNetTutar.Text = Convert.ToDouble(iskontoTutar).ToString(); // NET Tutar alanında gösterdik.

            KdvTutar = iskontoTutar / 100 * 8; // KDVmizi hesapladık.
            lblKDV.Text = Convert.ToDouble(KdvTutar).ToString();// ilgili label da kdv fiyatı gösterdik.

            lblode.Text = Convert.ToDouble((iskontoTutar + KdvTutar +kargo.Fiyat)).ToString();// ödenecek tutarı net olarak belirttik.
        
        }

        
    }
}