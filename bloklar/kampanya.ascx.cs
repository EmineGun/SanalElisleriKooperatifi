using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_kampanya : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext nesnemizi olusturduk.

    protected void Page_Load(object sender, EventArgs e)
    {
        // Yayın durumu 1 ve Kampanya durumu 1 olan ürünlerimizi var değerinde olan urunler değişkenimize atadık.
        var urun = (from u1 in et.Urunlers.Where(v => v.YayinDurumu == 1 && v.Kampanya == 1)
                    join u2 in et.Markalars on u1.MarkaID equals u2.MarkaID
                    select new { u1.UrunAD,u1.UrunFiyat,u2.MarkaAD,u1.Resim1,u1.UrunID});

        // Yayın durumu ve Kampanya durmu 1 olan kaçta urunumuz oldugunu bulduk.
        int urunDeger = (from u1 in et.Urunlers.Where(v => v.YayinDurumu == 1 && v.Kampanya == 1)
                    join u2 in et.Markalars on u1.MarkaID equals u2.MarkaID
                    select new { u1.UrunAD, u1.UrunFiyat, u2.MarkaAD }).Count();

        if (urunDeger != 0) // urunDeger sonu 0 dan farklıysa DataList1 e urun değişkenleirmizi ata dedik.
        {
            Panel1.Visible = true;
            DataList1.DataSource = urun;
            DataList1.DataBind();
             
        }
        else
        {
            Panel1.Visible = false;
        }
       
    }
}