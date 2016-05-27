using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_istatistik : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        var toplam = et.istatistiks.Select(s => s.IP).Count();
        lblToplamZiyaretci.Text = toplam.ToString();


        string zaman1 = DateTime.Now.ToShortDateString() + " 00:00:00";
        string zaman2 = DateTime.Now.ToShortDateString() + " 23:59:00";


        var gunluk=(from s in et.istatistiks where s.Tarih>=Convert.ToDateTime(zaman1) && 
                        s.Tarih<=Convert.ToDateTime(zaman2)
                        select s.IP).Count();

        lblGunlukZiyaretci.Text = gunluk.ToString();

        var encok = et.istatistiks.GroupBy(n => n.Sayfa).Select(n => new
        {
            SAYFA = n.Key,
            Giris = n.Count()
        }).OrderByDescending(n=>n.Giris);

        GridView1.DataSource = encok;
        GridView1.DataBind();


        var enaz = et.istatistiks.GroupBy(n => n.Sayfa).Select(n => new
        {
            SAYFA = n.Key,
            Giris = n.Count()
        }).OrderBy(n => n.Giris);

        GridView2.DataSource = enaz;
        GridView2.DataBind();



    }
}