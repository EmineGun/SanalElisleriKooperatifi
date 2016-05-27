using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_altkategoriurun : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();// Data Context nesnemizi ekledik

    protected void Page_Load(object sender, EventArgs e)
    {
        //Tıklandıgımız alt kategori bulmak için veritabanın bilgiyle eşleştirme yapıp altid adındaki değişkene atadık.
        var altid = et.AltKategorilers.Where(v => v.ALTID == int.Parse(Request.QueryString["id"])).FirstOrDefault();

        lblALTAD.Text = altid.ALTAD; // seçilen alt kategorinin ADInı alarak labelima atadım.

        AltKGetir(); // bir fonksiyon olusturduk. Altkategori ürünlerimizi bu fonksiyonda çagırdık.
    }

    public void AltKGetir() // Fonksiyonumuz.
    { 
        // urun adında var değerinde bir değişken olusturduk. ve veritabanı baglantılarını kurarak ürünlerimizi çektik.
        var urun = (from u1 in et.AltKategorilers.Where(v=>v.ALTID==int.Parse(Request.QueryString["id"]))
                        join u2 in et.Urunlers.Where(v=>v.YayinDurumu==1) on u1.ALTID equals u2.ALTID
                        join u3 in et.Markalars on u2.MarkaID equals u3.MarkaID
                        select new {u2.Resim1,u2.UrunAD,u2.UrunFiyat,u3.MarkaAD,u2.UrunID}).ToList();

        //Sayfalandırma işlemi için ürün ve datalistlerimizin bağlantılarını gerçektirdik.
        CollectionPager1.DataSource = urun;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
    
    }
}