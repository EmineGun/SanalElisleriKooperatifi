using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_cari : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = GridView1.SelectedRow.Cells[1].Text; // Gridde seçilen bilgiyi yani uyeid'yi label'ın text ine yazdırdık.

        var uye = et.Uyelers.Where(v => v.UyeID == int.Parse(Label1.Text)).FirstOrDefault(); // Seçili olan üyenin üyeler tablosundaki bilgiyerine ulaşmak için veritabanı bağlantısını kurduk.

        decimal fiyat=0;

        // seçili olan üyeden kaçtane cari hesap tablosunda var ise foreach bölümünde okadar işlem tekrarlanması yapılacaktır.
        var carisayi = et.CariHarekets.Where(v => v.ReferansNo == uye.UyeID);
        foreach (var item in carisayi)
        {
            fiyat = Convert.ToDecimal(item.Tutar + fiyat); // üye'ye ait toplam tutara ulaştık.
        }

        // VERİ TABANINDAN UYEID'YE BAĞLI OLAN BİLGİLERİ ÇEKTİK.
        TextBox1.Text = uye.UyeAdSoyad; 
        TextBox2.Text = uye.UyeEposta;
        TextBox3.Text = uye.Adres;
        TextBox4.Text = uye.GSM;
        TextBox5.Text = uye.Sehir;
        TextBox6.Text = uye.ilce;
        TextBox8.Text = fiyat.ToString();// foreach ile toplanan fiyatımızı ilgili alana atadık. 

        Panel1.Visible = true; // Panelimizin visible'ını görünür yaptık.
        Button1.Visible = true; // CARİ EKLE Butonumuzu görünür yaptık.


        var carivarmi = et.Caris.Where(v => v.UyeID == int.Parse(Label1.Text)).FirstOrDefault(); // Seçili olan cari hesap veritabanındaki uye eğer cari tablosunda var ise bilgileri carivarmi adlı değişkende tuttuk
        //carivarmi değişkenine eğer veri atanmamış ise üyeid ye ait bilgi cari tablosunda yok demek oluyor.
        if (carivarmi != null) // eğer bilgi var ise
        {
            // Mevcut RiskLimiti ve Alacak bakiye ve Odeme Seklini getir.
            TextBox7.Text = carivarmi.RiskLimiti.ToString();
            TextBox9.Text = carivarmi.AlacakBakiye.ToString();
            DropDownList1.Text = carivarmi.OdemeSekli.ToString();
            Panel1.Visible = true;
            Button1.Visible = false;// Ekleme işlemini pasif yaptık.
            Button2.Visible = true; // Güncelleme işlemini aktif ettik.
            Button4.Visible = false;
            Button3.Visible = false;
        }
        else // eğer bir bilgi yok ise yani carivarmi değişkeni boş ise
        {
            Panel1.Visible = true;
            Button1.Visible = true; // Ekleme işlemini aktif yaptık.
            Button2.Visible = false; // Güncelleme işlemini pasif yaptık.
            Button4.Visible = false;
        }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Cari tablomuza ilgi alanlardan bilgileri çekerek veritabanına ekleme işlemini gerçekleştirdik.
        et.Caris.InsertOnSubmit(new Cari
        {
            UyeID = int.Parse(Label1.Text),
            AdSoyad = TextBox1.Text,
            Eposta = TextBox2.Text,
            Adres = TextBox3.Text,
            GSM = TextBox4.Text,
            Sehir = TextBox5.Text,
            ilce = TextBox6.Text,
            RiskLimiti = Convert.ToDecimal(TextBox7.Text),
            BorcuBakiye = Convert.ToDecimal(TextBox8.Text),
            AlacakBakiye = Convert.ToDecimal(TextBox9.Text),
            OdemeSekli = DropDownList1.SelectedValue
        });

        et.SubmitChanges(); // Değişiklikleri Kaydettik.
        Response.Redirect("Yonetim.aspx?ad=cari"); // sayfamızı Yeniledik.
        

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Button2.Visible = true;
        Button1.Visible = false;
        int caribilgi;
        caribilgi=int.Parse(GridView2.SelectedRow.Cells[2].Text); // Seçili satu-ırdaki üyeid ye ulaştık.
        var cari = et.Caris.Where(v => v.UyeID == caribilgi).FirstOrDefault(); // Cari tabloda  kontrolunu yaptık ve bilgiyi cari değişkenin tuttuk.
        
        // Cari değişkenindeki bilgileri alarak ilgili TExtBOxt ve Drop. izlemelerimizi yaptık.
        Label1.Text = cari.UyeID.ToString();
        TextBox1.Text = cari.AdSoyad;
        TextBox2.Text = cari.Eposta;
        TextBox3.Text = cari.Adres;
        TextBox4.Text = cari.GSM;
        TextBox5.Text = cari.Sehir;
        TextBox6.Text = cari.ilce;
        TextBox7.Text = cari.RiskLimiti.ToString();
        TextBox8.Text = cari.BorcuBakiye.ToString();
        TextBox9.Text = cari.AlacakBakiye.ToString();
        DropDownList1.Text = cari.OdemeSekli.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cariguncelle();// Güncelleme için cariguncelle fonksiyonu oluşturduk.

    }

    public void cariguncelle() // CAri TAblomuzun güncelleme işlemini yaptık. Stored Procedure ile.
    {
        et.cariguncelle(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, int.Parse(Label1.Text),
            Convert.ToDecimal(TextBox7.Text), Convert.ToDecimal(TextBox8.Text), Convert.ToDecimal(TextBox9.Text), DropDownList1.SelectedValue);
        Response.Redirect("Yonetim.aspx?ad=cari");
        Button4.Visible = false;
        Button3.Visible = false;
    
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        // Yönetinin ekleyeceği cari işlemler için Kayıt olusturduk.

        Panel1.Visible = true;
        Button4.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        // üyemiz olmayan dısardan alışveriş yapılmıs internet haricinde ki cari işlemleirzi eklemek için Oluşturduk.
        et.Caris.InsertOnSubmit(new Cari
        {
            AdSoyad = TextBox1.Text,
            Eposta = TextBox2.Text,
            Adres = TextBox3.Text,
            GSM = TextBox4.Text,
            Sehir = TextBox5.Text,
            ilce = TextBox6.Text,
            RiskLimiti = Convert.ToDecimal(TextBox7.Text),
            BorcuBakiye = Convert.ToDecimal(TextBox8.Text),
            AlacakBakiye = Convert.ToDecimal(TextBox9.Text),
            OdemeSekli = DropDownList1.SelectedValue
        });

        et.SubmitChanges();// Veritabanındaki değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=cari");// Sayfamızı Güncelledik.
        

    }
}