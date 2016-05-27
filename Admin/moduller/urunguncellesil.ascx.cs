using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_urunguncellesil : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    string zaman = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() +
    DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString();


    protected void Page_Load(object sender, EventArgs e)
    {
        //hangi işlemin yapılcagının kontrolunu yaptık ve ilgili fonksiyonlara yönlendirdik.
        if (Request.QueryString["islem"] == "guncelle" && Request.QueryString["id"] != null) urunlerigetir();
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil();

        //Ürünlerin veritabanından çagrılma işlemini yaptık.
        var urunler = (from u in et.Urunlers 
                      join u2 in et.Markalars on u.MarkaID equals u2.MarkaID
                      where u.MarkaID==u2.MarkaID
                      select new {u.UrunID,u.UrunAD,u.Resim1,u2.MarkaAD}).ToList();
        //DataList1.DataSource = urunler;
        //DataList1.DataBind();

        CollectionPager1.DataSource = urunler; // CPager'ımızı urunlerimizle baglama işlemini yaptık.
        CollectionPager1.BindToControl = DataList1; // CPAger Datalist'imize bağladık.
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
        

    }
    public void Sil()
    {
        // Seçili olan ürünümüzü bulduk.(URUNID ile.)
        Urunler urun = et.Urunlers.Where(v => v.UrunID == int.Parse(Request.QueryString["id"])).FirstOrDefault();
        //Silme işlemizi yaptık.
        et.Urunlers.DeleteOnSubmit(urun);
        et.SubmitChanges(); // Değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=urunguncellesil"); // Sayfamızı yeniledik.


    }
    public void urunlerigetir()
    {
        //Seçili olan ürünümüzü URUNID le bulduk.
        var urung = et.Urunlers.Where(v => v.UrunID == int.Parse(Request.QueryString["id"]));
        var urun1 = urung.FirstOrDefault(); // Bulunan Urunu urun1 adlı var değişkenine atadık.

        //Veritabanımızdaki bilgileri Design Tarafındaki ilgili alanlara atama işlemini yaptık.
        DropDownList1.SelectedValue = urun1.AKID.ToString();
        DropDownList4.SelectedValue = urun1.ALTID.ToString();
        DropDownList3.SelectedValue = urun1.MarkaID.ToString();
        
        txtUrunAD.Text = urun1.UrunAD;
        FCKeditor1.Value = urun1.UrunDetay;
        txtFiyat.Text = urun1.UrunFiyat.ToString();
        txtKDV.Text = urun1.KDV.ToString();
        FCKeditor2.Value = urun1.Taksit;
        if (urun1.Kampanya == 1) CheckKampanya.Checked = true;
        else CheckKampanya.Checked = false;
        if (urun1.YayinDurumu == 1) CheckYayin.Checked = true;
        else CheckYayin.Checked = false;

    }

    protected void DropDownList1_DataBound1(object sender, EventArgs e)
    {
        // DropdownLİst'in ilk seçeneğini Ana Kategori Seçiniz.. olarak sergilemek istediğimiz için olusturdur.
    DropDownList1.Items.Insert(0, new ListItem("Ana Kategori Seçiniz..", "0"));
    }
    protected void DropDownList4_DataBound1(object sender, EventArgs e)
    {
        DropDownList4.Items.Insert(0, new ListItem("Alt Kategori Seçiniz..", "0"));
    }
    protected void DropDownList3_DataBound1(object sender, EventArgs e)
    {
        DropDownList3.Items.Insert(0, new ListItem("Marka Seçiniz..", "0"));
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        //Güncellenecek Urunumuzu bulduk.
        var urungg = et.Urunlers.Where(v => v.UrunID == int.Parse(Request.QueryString["id"]));
        var urun2 = urungg.FirstOrDefault();
    
        // Resim değişikli olanlar için zaman değişkenimizi kullanarak isim verdirdik.
        //Eğer Değişiklik yapılmamıssa eski bilgiyi aynen bıraktık. (ELSE Kısmında)
        string rsm1, rsm2, rsm3, rsm4, rsm5, video1;
        if (FileUpload1.HasFile && FileUpload1.PostedFile.ContentType == "image/jpeg") rsm1 = zaman + ".jpg";
        else rsm1=urun2.Resim1;
        if (FileUpload2.HasFile && FileUpload2.PostedFile.ContentType == "image/jpeg") rsm2 = zaman + "2.jpg";
        else rsm2 = urun2.Resim2;
        if (FileUpload3.HasFile && FileUpload3.PostedFile.ContentType == "image/jpeg") rsm3 = zaman + "3.jpg";
        else rsm3 = urun2.Resim3;
        if (FileUpload4.HasFile && FileUpload4.PostedFile.ContentType == "image/jpeg") rsm4 = zaman + "4.jpg";
        else rsm4 = urun2.Resim4;
        if (FileUpload5.HasFile && FileUpload5.PostedFile.ContentType == "image/jpeg") rsm5 = zaman + "5.jpg";
        else rsm5 = urun2.Resim5;
        if (FileUpload6.HasFile && FileUpload6.PostedFile.ContentType == "video/x-ms-wsv") video1 = zaman + ".wmv";
        else video1 = urun2.Video;

        // CheckBoz kontrollerini yaptık.
        int kampanya;
        if (CheckKampanya.Checked) kampanya = 1;
        else kampanya = 0;

        int yayinD;
        if (CheckYayin.Checked) yayinD = 1;
        else yayinD = 0;

     
        //SQL Serverda oluşturdugumuz stored procedure ile ürün güncelleme işlemlerimizi gercekleştirdik.
        et.urunguncelle(int.Parse(Request.QueryString["id"]), txtUrunAD.Text, FCKeditor1.Value, Convert.ToDecimal(txtFiyat.Text),
            Convert.ToDecimal(txtKDV.Text), int.Parse(DropDownList3.SelectedValue), int.Parse(DropDownList1.SelectedValue), int.Parse(DropDownList4.SelectedValue),
            rsm1, rsm2, rsm3, rsm4, rsm5, video1, FCKeditor2.Value, kampanya, yayinD);

        et.SubmitChanges(); // Değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=urunguncellesil"); //Sayfamızı Yeniledik.

    }
}