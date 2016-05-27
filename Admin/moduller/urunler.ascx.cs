using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_urunler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    // Resimlerimize isimler aynı olmaması için GLOBAl bir değişken tanımladık (zaman)
    // Ve eklenme tarihini zman adındaki değişkende tuttuk.
    string zaman = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() +
        DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();

    string sayi = DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString(); // evrak numarası için değer oluşturduk.

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, new ListItem("Ana Kategori Seçiniz..", "0"));
    }

    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, new ListItem("Alt Kategori Seçiniz..", "0"));
    }
    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, new ListItem("Marka Seçiniz..", "0"));
    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        string rsm1,rsm2,rsm3,rsm4,rsm5,video1;
        //Eğer FileUpload Tıklanmıssa ybai resim silmişse
        if(FileUpload1.HasFile && FileUpload1.PostedFile.ContentType =="image/jpeg") rsm1=zaman+".jpg";
        else rsm1=""; // file upload tıklanmamışsa boş bırakacak.

        if(FileUpload2.HasFile && FileUpload2.PostedFile.ContentType =="image/jpeg") rsm2=zaman+"2.jpg";
        else rsm2="";
        if(FileUpload3.HasFile && FileUpload3.PostedFile.ContentType =="image/jpeg") rsm3=zaman+"3.jpg";
        else rsm3="";
        if(FileUpload4.HasFile && FileUpload4.PostedFile.ContentType =="image/jpeg") rsm4=zaman+"4.jpg";
        else rsm4="";
        if(FileUpload5.HasFile && FileUpload5.PostedFile.ContentType =="image/jpeg") rsm5=zaman+"5.jpg";
        else rsm5="";

        if(FileUpload6.HasFile && FileUpload6.PostedFile.ContentType =="video/x-ms-wsv") video1=zaman+".wmv";
        else video1="";

        //Kampanyanın işaretli olup olmadığının kontrolunu yaptık eğer tıklanmıssa kampanya ya 1 değerini verdirdik.
        //Tıklanmıs değil ise 0 değerini verdirdik.
        int kampanya;
        if(CheckKampanya.Checked) kampanya=1;
        else kampanya=0;

        // Checkboxun tıklanıp tıklanmadıgının kontrolunu yaptık.
        int yayinD;
        if(CheckYayin.Checked) yayinD=1;
        else yayinD=0;

        // Girilecek olan ürünlerin veri tabanına kayıt işlemini yaptık.
        et.Urunlers.InsertOnSubmit( new Urunler
        {AKID=int.Parse(DropDownList1.SelectedValue),ALTID=int.Parse(DropDownList4.SelectedValue),
            MarkaID=int.Parse(DropDownList3.SelectedValue),UrunAD=txtUrunAD.Text,UrunDetay=FCKeditor1.Value,
            UrunFiyat=Convert.ToDecimal(txtFiyat.Text),KDV=Convert.ToDecimal(txtKDV.Text),
            Taksit=FCKeditor2.Value,EklenmeTarihi=Convert.ToDateTime(DateTime.Now),
            Resim1=rsm1,Resim2=rsm2,Resim3=rsm3,Resim4=rsm4,Resim5=rsm5,Video=video1, Kampanya=kampanya,YayinDurumu=yayinD });


        //Seçilmiş olan ürün resimlerini Urunler adında bir dosya açarak eklenme işlemini yaptık.
        if (FileUpload1.HasFile) FileUpload1.SaveAs(Server.MapPath("../Urunler/" + rsm1));
        if (FileUpload2.HasFile) FileUpload2.SaveAs(Server.MapPath("../Urunler/" + rsm2));
        if (FileUpload3.HasFile) FileUpload3.SaveAs(Server.MapPath("../Urunler/" + rsm3));
        if (FileUpload4.HasFile) FileUpload4.SaveAs(Server.MapPath("../Urunler/" + rsm4));
        if (FileUpload5.HasFile) FileUpload5.SaveAs(Server.MapPath("../Urunler/" + rsm5));
        if (FileUpload6.HasFile) FileUpload6.SaveAs(Server.MapPath("../Urunler/" + video1));
        //veritabanında yapılan değişiklikleri kaydettik.
        et.SubmitChanges();
       // Response.Redirect("Yonetim.aspx?ad=urunler"); // Sayfımızı yeniledik.

        Panel1.Visible = false;
        Panel2.Visible = true;

    }



    protected void btnStok_Click(object sender, EventArgs e)
    {
        var urun = et.urungetir().LastOrDefault(); // Son eklenen ürünü bulduk urun değişkeninde tuttuk.

        // Hareketler tablosuna ekleme işlemini yaptık.

        et.Harekets.InsertOnSubmit(new Hareket
        {
            islemTarihi = DateTime.Now,
            islemTuru = lblGiris.Text,
            EvrakNo = int.Parse(sayi),
            UrunID = urun.UrunID,
            Miktar = Convert.ToInt32(txtMiktar.Text),
            Fiyat = Convert.ToDecimal(txtStokFiyat.Text),
            KDV = Convert.ToDecimal(txtStokKDV.Text),
            Tutar = ((Convert.ToDecimal(txtStokFiyat.Text) / 100 * Convert.ToDecimal(txtStokKDV.Text)) + Convert.ToDecimal(txtStokFiyat.Text)) * Convert.ToInt32(txtMiktar.Text),
            Aciklama = txtAciklama.Text
        });

        //Giriş yapmış olan yöneticiyi bulduk ve yonet değişkeninde yönetici adını tuttuk.
        var yonetici = et.Yoneticilers.Where(v => v.YoneticiAd == Session["Yonetici"].ToString());
        var yonet = yonetici.Select(s => s.YoneticiAd).SingleOrDefault();

        // Stok Kartı Tablosuna ekleme işlemimizi yaptık.

        var stoktur = et.StokTurus.Where(v => v.ID == int.Parse(DropDownList5.SelectedValue)).FirstOrDefault();
        var stokbir = et.StokBirimis.Where(v => v.ID == int.Parse(DropDownList6.SelectedValue)).FirstOrDefault();
        var sekil = et.AmbalajSeklis.Where(v => v.ID == int.Parse(DropDownList7.SelectedValue)).FirstOrDefault();

        et.StokKartis.InsertOnSubmit(new StokKarti
        {
            Kategori = stoktur.KategoriAdi,
            StokAdi = urun.UrunAD,
            StokBirimi = stokbir.BirimAdi,
            UretimTarihi = Convert.ToDateTime(txtUT.Text),
            SonKullanmaTarihi = Convert.ToDateTime(txtSKT.Text),
            AmbalajSekli = sekil.AmbalajSekli1,
            Mensei = DropDownList8.SelectedValue,
            TedarikSuresi = txtTS.Text,
            OrtalamaGunlukSatis = Convert.ToInt32(txtOGS.Text),
            MinimumSeviye = Convert.ToInt32(txtTS.Text) * Convert.ToInt32(txtOGS.Text),
            Aciklama = txtAciklama.Text,
            UrunID = urun.UrunID,
            MevcutMiktar = Convert.ToInt32(txtMiktar.Text),
            Fiyat = Convert.ToDecimal(txtStokFiyat.Text),
            KDV = Convert.ToDecimal(txtStokKDV.Text),
            Tutar = ((Convert.ToDecimal(txtStokFiyat.Text) / 100 * Convert.ToDecimal(txtStokKDV.Text)) + Convert.ToDecimal(txtStokFiyat.Text)) * Convert.ToInt32(txtMiktar.Text),
            UrunResmi = urun.Resim1,
            islemYapanKisi = yonet
        });

        et.SubmitChanges(); // Değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=urunler");
 

    }
}