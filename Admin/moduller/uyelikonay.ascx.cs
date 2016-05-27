using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_uyelikonay : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    //Eticaret Data Context nesnemizi oluşturduk

    protected void Page_Load(object sender, EventArgs e)
    {
        var onayyok = et.Uyelers.Where(v => v.Onay == 0); // Veritabanındaki onay = 0 olan kişileri bulduk 
        //ve bu kişileri onayyok adlı değişkene attık
        Repeater1.DataSource = onayyok; //repeater ile yayınladık.
        Repeater1.DataBind();

        var onaylanmisuye = et.Uyelers.Where(v => v.Onay == 1);// Veritabanındaki onay = 1 olan kişileri bulduk 
        //ve bu kişileri onayyok adlı değişkene attık
        Repeater2.DataSource = onaylanmisuye;
        Repeater2.DataBind();

        //Adres çubugunda işlem = oku veya onaylanmiş veya sil ise ve id lerde boş değillerse Fonksiyonlara git dedik
        if (Request.QueryString["islem"] == "oku" && Request.QueryString["id"] != null) oku();
        if (Request.QueryString["islem"] == "onaylanmis" && Request.QueryString["id"] != null) oku();
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) Sil();


    }
    public void Sil() // Sil Fonksiyonu oluşturduk.
    {
        Uyeler uye = et.Uyelers.First(v => v.UyeID == int.Parse(Request.QueryString["id"])); //Seçili üyenin silmeni gerçekleştirdik
        et.Uyelers.DeleteOnSubmit(uye); // silme işlemi yapıldı
        et.SubmitChanges(); // veritabanına değişiklikler kayıt edildi.
        Response.Redirect("Yonetim.aspx?ad=uyelikonay"); // sayfamız yenilendi
    
    }

    public void oku() // OKu Fonksiyonu olusturduk
    {
        var uyeoku = et.Uyelers.Where(v => v.UyeID == int.Parse(Request.QueryString["id"])); // id kontrollerimizi yaptık.
        FormView1.DataSource = uyeoku; // Seçilen üyeler FormView ile sergileme işlemi yaptık 
        FormView1.DataBind();
        if (Request.QueryString["islem"] == "oku") btnOnay.Visible = true; // işlem = oku ise buton onay görünsün.
        else
        { btnOnay.Visible = false; // eğer islem onaylanmis ise btn onay görünmesin btniptal görünsün.
        btniptal.Visible = true;
        
        }
    
    }
    protected void btnOnay_Click(object sender, EventArgs e)
    {
        et.uyetaleponay(int.Parse(Request.QueryString["id"])); // Stored procedure ve onaylama işlemi yaptık
        Response.Redirect("Yonetim.aspx?ad=uyelikonay");
    }
    protected void btniptal_Click(object sender, EventArgs e)
    {
        et.Uyetalepiptal(int.Parse(Request.QueryString["id"]));// Stored procedure ve iptal işlemi yaptık
        Response.Redirect("Yonetim.aspx?ad=uyelikonay");
    }
}