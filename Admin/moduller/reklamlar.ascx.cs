using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_reklamlar : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        //eğer işlem=sil ise ve de id boş değil ise sil fonksiyonuna git dedik.
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil();

        //eğer islem=duzenle ise ve id boş değil ise bilgilerigetir fonksiyonuna git.

        if (Request.QueryString["islem"] == "duzenle" && Request.QueryString["id"] != null) bilgilerigetir();
       
        // Datalistimize veritabanımızı ekleme işlemimizi yaptık.
        var reklamlar = et.Reklamlars; 
        DataList1.DataSource = reklamlar;
        DataList1.DataBind();

    }

    public void reklamekle() // Eklemek için FOnksiyon oluşturduk.
    {
        if (FileUpload1.HasFile) // Eğer Yükleme yapıldıysa aşağıdaki işlemleri yap.
        {
            // Veritabanımızdaki Reklamlar tablosuna bağlandık. Ve Kolonlara eklemelerimizi yaptık.
            et.Reklamlars.InsertOnSubmit(new Reklamlar
            {
                ReklamAdi = txtReklamAdi.Text,
                ReklamTuru = DropDownList1.SelectedValue,
                Pozisyon = DropDownList2.SelectedValue,
                Reklam = FileUpload1.FileName,
                URL = txtURL.Text
            });

            //Projemize reklamlar adında bir klasör oluşturduk ve Yüklenmiş olan Resim veya Animasyonu Reklamlar klasörü altında tuttuk.
            FileUpload1.PostedFile.SaveAs(Server.MapPath("../reklamlar/" + FileUpload1.FileName));
            et.SubmitChanges(); // Değişiklikleri kaydettik.
            Response.Redirect("Yonetim.aspx?ad=reklamlar");// Sayfa Yenileme işlemimizi yaptık.
        }
        else // FileUpload seçilmediyse
        {
            lblBilgi.Text = "Dosya Seçiniz.."; // Bilgi verdirme işlemini yaptık.
        }
    
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["islem"] != null) degistir(); // eğer islem boş değil ise değiştire git dedik.
        else reklamekle(); // Ekleme işlemini buton tıklandığında çağırdık.

    }

    public void Sil() // Sil fonksiyonu
    {
        // Reklam değerinde rklm adında bir değişken oluşturduk ve bu değişkene sili olan reklamı atadık.
        Reklamlar rklm = et.Reklamlars.Where(v => v.ID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        et.Reklamlars.DeleteOnSubmit(rklm); // DeleteOnSubmit kullanarak reklam silme işlemini gerçekleştirdik.
        et.SubmitChanges(); // Değişiklikleri Kaydettik
        Response.Redirect("Yonetim.aspx?ad=reklamlar"); // Sayfamızı yeniledik.
    
    }

    public void bilgilerigetir()
    {
        // Seçilmiş olan reklamı bulduk. ve bilgilerini ilgili alanlara yazdırdık.

        var reklamlar = et.Reklamlars.Where(v => v.ID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        txtReklamAdi.Text = reklamlar.ReklamAdi;
        DropDownList1.Text = reklamlar.ReklamTuru.ToString();
        DropDownList2.Text = reklamlar.Pozisyon.ToString();
        txtURL.Text = reklamlar.URL;
        btnKaydet.Text = "REKLAM DEĞİŞTİR"; // BUtonumuzun text'ini değiştirdik.
    
    }
    public void degistir()
    {
        // Seçili olan reklamı bulduk.
        var reklam = et.Reklamlars.Where(v => v.ID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        string dosya;
        if (FileUpload1.HasFile) // yüklenme seçildiyse
        {
            dosya = FileUpload1.FileName; // seçilmiş olan dosyanın adını dosya değişkenine atadık.
            FileUpload1.PostedFile.SaveAs(Server.MapPath("../reklamlar/"+FileUpload1.FileName)); // seçi olan resim veye animasyonu reklamlar klasörü altına ekledik.
        }
        else // seçilmediyse
        {
            dosya = reklam.Reklam; //Hiçbir değişiklik yapma resim veya animasyon uzantısı aynı kalsın dedik.
        }

        // güncelleme işlemlerini yaptık.
        et.reklamguncelle(int.Parse(Request.QueryString["id"]), txtReklamAdi.Text, DropDownList1.SelectedValue, DropDownList2.SelectedValue, dosya, txtURL.Text);
        et.SubmitChanges(); // değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=reklamlar");// Sayfamızı Yeniledik.
    
    }
}