using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_stokguncelle : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext nesnemizi ekleidk.
    string sayi=DateTime.Now.Second.ToString()+DateTime.Now.Millisecond.ToString(); // Evrak No olarak kullanmak için 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["islem"] == "guncelle" && Request.QueryString["id"] != null)// Butonumuza link verdik islem=guncelle ve id bos değil ise
            urunstokgetir(); // Fonksiyona git


        var stoklar = et.StokKartis.ToList(); //DataListte bilgileri çekmek için stokkarti tablosundaki bilgileri alıp stoklar değişkeninde tuttuk.
        
        CollectionPager1.DataSource = stoklar; // CPager'ımızı urunlerimizle baglama işlemini yaptık.
        CollectionPager1.BindToControl = DataList1; // CPAger Datalist'imize bağladık.
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
    }
    public void urunstokgetir() // Güncelleye tıklandıgında geldik.
    {
        Panel1.Visible = true;// Panelimizin  görünürlüğünü TRUE olarak değiştirdik.
        var stokkarti = et.StokKartis.Where(v=>v.UrunID==int.Parse(Request.QueryString["id"])).FirstOrDefault(); // butona tıklanınca seçilmiş 
        //olan ürünün ID'si ile Stokkartındaki ID kontrolu yapılıp stokkarti adındaki değişkende tuttuk.
        var kategori = et.StokTurus.Where(v => v.KategoriAdi == stokkarti.Kategori).FirstOrDefault(); //Veritabanında olan kategorinin adıyla stokturunde ki kategori adını eşitledik ve kategori değişkeninde tuttuk.
        var stokbirimi = et.StokBirimis.Where(v=>v.BirimAdi==stokkarti.StokBirimi).FirstOrDefault();
        var ambalaj=et.AmbalajSeklis.Where(v=>v.AmbalajSekli1==stokkarti.AmbalajSekli).FirstOrDefault();
        txtStokFiyat.Text = stokkarti.Fiyat.ToString(); // Stoga ait fiyatı getirdik.
        txtStokKDV.Text = stokkarti.KDV.ToString(); // Stoka ait KDV yi texbox a getirdik.
        txtMiktar.Text = stokkarti.MevcutMiktar.ToString(); // mevcut miktarıda texboxa getirdik.
        txtUT.Text = stokkarti.UretimTarihi.ToString();// Uretim tarihi  texboxa getirdik.
        txtSKT.Text = stokkarti.SonKullanmaTarihi.ToString();// son kullanma  texboxa getirdik.
        txtTS.Text = stokkarti.TedarikSuresi;// Tedarik süresi  texboxa getirdik.
        txtOGS.Text = stokkarti.OrtalamaGunlukSatis.ToString();// Ortalama Gunluk satış  texboxa getirdik.
        txtAciklama.Text = stokkarti.Aciklama;// Açıklama texboxa getirdik.
        DropDownList5.Text = kategori.ID.ToString();// kategoride tutugumuz bilgilerden ID yi çektik.
        DropDownList4.Text = stokbirimi.ID.ToString();//  stokbirimi tutugumuz bilgilerden ID yi çektik.
        DropDownList3.Text = ambalaj.ID.ToString();//  ambalaj tutugumuz bilgilerden ID yi çektik.
        DropDownList2.Text = stokkarti.Mensei;// veritabanında bulunan bilgiyi çektik.


    }

    protected void btnStok_Click(object sender, EventArgs e)
    { 
        var stokkarti = et.StokKartis.Where(v=>v.UrunID==int.Parse(Request.QueryString["id"])).FirstOrDefault(); // Seçili olna ürün bilgiliri stokkartinde tutuldu
       
        var stoktur= et.StokTurus.Where(v=>v.ID ==int.Parse( DropDownList5.SelectedValue)).FirstOrDefault();
        var stokbirim=et.StokBirimis.Where(v=>v.ID==int.Parse(DropDownList4.SelectedValue)).FirstOrDefault();
        var ambalaj= et.AmbalajSeklis.Where(v=>v.ID==int.Parse(DropDownList3.SelectedValue)).FirstOrDefault();

        var yoneti=et.Yoneticilers.Where(v=>v.YoneticiAd==Session["Yonetici"].ToString());
        var yonetici= yoneti.Select(s=>s.YoneticiAd).SingleOrDefault();
        // HAreketler tablosuna ekleme işlemlerimizi yaptık.
        et.Harekets.InsertOnSubmit(new Hareket
        {
            islemTarihi = DateTime.Now,
            EvrakNo = int.Parse(sayi),
            UrunID = int.Parse(Request.QueryString["id"]),
            Miktar = Convert.ToInt32(txtMiktar.Text),
            Fiyat = Convert.ToDecimal(txtStokFiyat.Text),
            KDV = Convert.ToDecimal(txtStokKDV.Text),
            Tutar = ((Convert.ToDecimal(txtStokFiyat.Text) / 100 * Convert.ToDecimal(txtStokKDV.Text)+Convert.ToDecimal(txtStokFiyat.Text))) * Convert.ToInt32(txtMiktar.Text),
            Aciklama = txtAciklama.Text,
            islemTuru=DropDownList1.SelectedValue
        });

        if (DropDownList1.SelectedValue == "Çıkış") // Eğer çıkış seçildiyese
        {
            et.StokKartiGuncelle(int.Parse(Request.QueryString["id"]), stoktur.KategoriAdi, stokkarti.StokAdi, stokbirim.BirimAdi,
                Convert.ToDateTime(txtUT.Text), Convert.ToDateTime(txtSKT.Text), ambalaj.AmbalajSekli1, DropDownList2.SelectedValue,
                txtTS.Text, Convert.ToInt32(txtOGS.Text), Convert.ToInt32(txtTS.Text) * Convert.ToInt32(txtOGS.Text), stokkarti.MevcutMiktar - int.Parse(txtMiktar.Text),
                Convert.ToDecimal(txtStokFiyat.Text), Convert.ToDecimal(txtStokKDV.Text), ((Convert.ToDecimal(txtStokFiyat.Text) / 100 * Convert.ToDecimal(txtStokKDV.Text)) + Convert.ToDecimal(txtStokFiyat.Text)) * (stokkarti.MevcutMiktar - int.Parse(txtMiktar.Text)),
                stokkarti.UrunResmi, txtAciklama.Text, yonetici);

        }
        else
        {
            et.StokKartiGuncelle(int.Parse(Request.QueryString["id"]), stoktur.KategoriAdi, stokkarti.StokAdi, stokbirim.BirimAdi,
                Convert.ToDateTime(txtUT.Text), Convert.ToDateTime(txtSKT.Text), ambalaj.AmbalajSekli1, DropDownList2.SelectedValue,
                txtTS.Text, Convert.ToInt32(txtOGS.Text), Convert.ToInt32(txtTS.Text) * Convert.ToInt32(txtOGS.Text), stokkarti.MevcutMiktar + int.Parse(txtMiktar.Text),
                Convert.ToDecimal(txtStokFiyat.Text), Convert.ToDecimal(txtStokKDV.Text), ((Convert.ToDecimal(txtStokFiyat.Text) / 100 * Convert.ToDecimal(txtStokKDV.Text)) + Convert.ToDecimal(txtStokFiyat.Text)) * (stokkarti.MevcutMiktar + int.Parse(txtMiktar.Text)),
                stokkarti.UrunResmi, txtAciklama.Text, yonetici);
        }

        et.SubmitChanges(); // Değişiklikleri kaydettik.
    }
}
