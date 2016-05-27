using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_siparisler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //Link verme işlemini yaptık(source tarafında) bundan dolayıda yönlendirme işlemlerimizi alt tarafta if döngüleriyle greçekleştirdik.
        if (Request.QueryString["islem"] == "oku" && Request.QueryString["id"] != null) oku();
        if (Request.QueryString["islem"] == "onaylanmis" && Request.QueryString["id"] != null) oku();

        //Repeater1 de onaylanmamış yani Durum = 0 olan sipariş bilgilerimizi getirdik.
        var siparis = et.Siparis.Where(v => v.Durum == 0);
        Repeater1.DataSource = siparis;
        Repeater1.DataBind();


        //Repeater2 de onaylanmış yani Durum = 1 olan sipariş bilgilerimizi getirdik.
        var siparisonaylanan = et.Siparis.Where(v => v.Durum == 1);
        Repeater2.DataSource = siparisonaylanan;
        Repeater2.DataBind();
    }

    public void oku()
    {
        // OKU ya tıklandıgında hangi siparişe gideceğinin kontrolunu yaptık ve formview 'a bilgileri getirdik.
        var siparisoku = et.Siparis.Where(v => v.ID == int.Parse(Request.QueryString["id"]));
        FormView1.DataSource = siparisoku;
        FormView1.DataBind();

        var ssiparisoku = et.Sepet_Siparis.Where(v => v.ID == int.Parse(Request.QueryString["id"]));
        FormView2.DataSource = ssiparisoku;
        FormView2.DataBind();
        btnOnayla.Visible = true;
    
    }
    protected void btnOnayla_Click(object sender, EventArgs e)
    {
        // onaylama işlemimiz için de 1 tane stored procedure olusturduk onunla Durumu 0 olan siparişleri 1 yaptık.
        et.SiparisOnayla(int.Parse(Request.QueryString["id"]));
        Response.Redirect("Yonetim.aspx?ad=siparisler"); // sayfamızı yeniledik.
    }
}