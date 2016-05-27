using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_urunmail : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Data COntext Nesnemizi Ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        // GriedView'a Urunler Tablosunu Bağladık.
        var urunler = et.Urunlers;
        GridView1.DataSource = urunler;
        GridView1.DataBind();
    }
    protected void btnAra_Click(object sender, EventArgs e)
    {

        // Ürün Arama işlemlerimiz için (Ürün Ad ' a göre arama yaptırdık.) Üürnler tablosunda arama yaptırdık. Text Box'a girin adı veritabanında arattırdık.
        var urun = et.Urunlers.Where(v => v.UrunAD.Contains(txtAra.Text));
        GridView1.DataSource = urun; // GriedView'umuza bağladık.
        GridView1.AllowPaging = false;
        GridView1.DataBind();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {// Yeniden Sıralama işlemini yaptırdık.
        
        GridView1.PageIndex = e.NewPageIndex;
        var urunler = et.Urunlers;
        GridView1.DataSource = urunler;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Seçilen ütünü bulmak için Gried View'umuzun 0. kolonun id'sini alıp lblID nin text'tine atadık.
        // BU urune ait Ürün Detay bilgisine ulaştık.

        lblID.Text = GridView1.SelectedRow.Cells[0].Text;
        var urn=et.Urunlers.Where(v=>v.UrunID==int.Parse(lblID.Text));
        FCKeditor1.Value = urn.Select(s => s.UrunDetay).SingleOrDefault();
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {
        // Seçili Ürün bilgisini Her Üyeye Yollanacağı için Ürünlerin listesinde teker teker dolasılmaı gerekiyor 
        //bundan dolayıda Foreach kullandık.
        // Mail Gonderme işlemimizi gerçekleştirdik.

        var uyeler = et.UyeleriGetir();

        try
        {
            foreach (var item in uyeler)
            {
                mailgonder("gorselegitim@gmail.com", item.UyeEposta, txtBaslik.Text, FCKeditor1.Value);


            }
            lblBilgi.Text = "Mail Gönderildi." +"<meta http-equiv='refresh' content='3;url=Yonetim.aspx?ad=urunmail'>";

        }
        catch (Exception ee)
        {

            lblBilgi.Text = "Mail Gönderilemedi.";
        }
        
    }

    public void mailgonder(string kimden, string kime, string konu, string icerik)
    {


        MailAddress alici = new MailAddress(kime); // Kime Gideceğini belirttik
        MailAddress gonderen = new MailAddress(kimden, "E-Ticaret");// Kimeden Gideceğini Belirttik.
        MailMessage mail = new MailMessage(gonderen, alici);// Kimeden Kime Gideceğinin yolunu Gösterdik.
        mail.Subject = konu; // Mailin KOnusu Belirttik
        mail.IsBodyHtml = true;
        mail.Body = icerik; // Mailimizin içerik kısmını Belirttik.
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.gmail.com";
        client.EnableSsl = true;
        client.Port = 587;
        client.Send(mail); // MAil Gönderme işlemini Yaptık.
    
    }
}