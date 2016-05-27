using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_sonurunler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();// Data COntext Nesnemizi ekledik.


    protected void Page_Load(object sender, EventArgs e)
    {
        //Son eklenen 3 ürünü bulduk. Burada dikkat edilmesi gereken yer Select çekilecek olanbilgilerdir.
        //Eğer eksik bilgi çekilirse hata alınır. SOurce tarafındaki tüm Eval'li bilgiler veri tabanının select kısmından çekilmelidir.
        var urun = (from u1 in et.Urunlers.Where(v => v.YayinDurumu == 1)
                    join u2 in et.Markalars on u1.MarkaID equals u2.MarkaID
                    select new { u1.EklenmeTarihi, u1.Resim1, u2.MarkaAD, u1.UrunFiyat,u1.UrunAD,u1.UrunID}).OrderByDescending(v => v.EklenmeTarihi).Take(3);

        DataList1.DataSource = urun; // Datalistimize ürünlemizi atadık.
        DataList1.DataBind();

    }
}