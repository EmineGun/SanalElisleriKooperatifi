using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_anakategoriurun : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Data Context nesnemi ekledim.


    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Hangi Ana Kategoriye Tıklandıgını bulup akad isimli değişkene atadık.
        var akad = et.AnaKategorilers.Where(v => v.AKID == int.Parse(Request.QueryString["id"])).FirstOrDefault();

        lblAKAD.Text = akad.AKAD; //Label'ımıza Ana KAtegori Adımızı atadık.

      
        AKGetir();

    }

    public void AKGetir()
    {

        // Veritabanından bilgi çekmek için ilgili tabloları birbiriyle ilişkilendirdik. ve Ana KAtegoriye ait ürünler seçimi sağladık.
        var urun = (from u1 in et.AnaKategorilers.Where(v => v.AKID == int.Parse(Request.QueryString["id"]))
                    join u2 in et.Urunlers.Where(v => v.YayinDurumu == 1) on u1.AKID equals u2.AKID
                    join u3 in et.Markalars on u2.MarkaID equals u3.MarkaID
                    select new { u3.MarkaAD, u2.Resim1, u2.UrunAD, u2.UrunFiyat,u2.UrunID }).ToList();
        //DataList1.DataSource = urun;
        //DataList1.DataBind();

        //Sayfalama işlemi için ürünlerimizi ve datalist'imizi Collection Pager'ımıza Bağlama işlemini yaptık.
        CollectionPager1.DataSource = urun;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
    
    }
}