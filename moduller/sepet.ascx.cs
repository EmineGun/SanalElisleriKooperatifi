using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_sepet : System.Web.UI.UserControl
{

    eticaretDataContext et = new eticaretDataContext(); // DataContext Nesnemizi Ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["islem"] == "ekle" && Request.QueryString["id"] != null) sepeteekle(); //Lİnk verme işlemini yaptık. Eğer işlem = ekle ise ve bir ürün seçilmiş ise sepeteekle fonksiyonuna git dedik.
        if (Request.QueryString["ad"] == "sepet") sepetgetir(); // eğer ad = sepet ise sepetgetir fonksiyonuna git
        if (Request.QueryString["islem"] == "sil" && Request.QueryString["id"] != null) sepetsil(); // sil butonu için link verme işlemimizde kullandıgımız islem=sil ise yi çagırdık ve ürün id si boş değilse sepetsil fonksiyonuna gittik
    }

    public void sepeteekle()
    {
        int uyeid; // uyeid adlı bir değişken tanımladık.BU değişken üyeepostaya ait üyenin uyeid'si tutturcaz.

        if (Session["UyeEposta"] != null) // Eğer üye girişi yapıldıysa alttaki işlemleri yap Yapılmadıysa else'e git
        {
            uyeid = (from u in et.Uyelers
                     where u.UyeEposta == Session["UyeEposta"].ToString()
                     select u.UyeID).FirstOrDefault(); // ÜyeEpostaya ait UyeID'sini aldık.

            //Stored Procedure oluşturmuştur.Ekleme işlemimizi yaptık.
            var sepet = et.sepetekle(uyeid, int.Parse(Request.QueryString["id"]), Convert.ToDateTime(DateTime.Today.Date.ToShortDateString()), 1);
            Response.Redirect("Default.aspx?ad=sepet"); // Sepet sayfasına yönlendirdik.
        
        }
        else
        {
            string ip; 
            ip = Request["REMOTE_ADDR"].ToString(); // ip adresini aldık.

            //Stored Procedure oluşturmuştuk onu kullanarak sepet ekleme işlmeimizi yaptık.
            var sepet2 = et.ipsepetekle(ip, int.Parse(Request.QueryString["id"]), Convert.ToDateTime(DateTime.Today.Date.ToShortDateString()), 1);
            Response.Redirect("Default.aspx?ad=sepet"); // Sepet sayfasına yönlendirdik.
        }
    
    }

    public void sepetgetir()
    {
        double toplam = 0;
        int uyeid;
        if (Session["UyeEposta"] != null) // UyeEposta girişi yapıldıysa aşagıdaki işlemleri yap eğer kullanıcı girişi yapılmadıysa else'e git
        {
            // UyeEpostaya ait UyeID yi aldık.
            uyeid = (from u in et.Uyelers
                     where u.UyeEposta == Session["UyeEposta"].ToString()
                     select u.UyeID).FirstOrDefault();

            //Uyeden kaç kez tekrarlanmışsa okadar satır ilerle dedik. Bunuda Count işlemiyle saydırdık.
            var sepetg = et.sepetgetir(uyeid).Count();
            int adet = sepetg; // saydıgımız sepetg deki sayıyı adet isimli int değerli değişkene atadık.

            if (adet != 0) //Yani eğer adet değişkenimiz = 0 farklıysa(Sepet işleminde eklenmiş ürün var ise)
            {
                // Sepeti getir stored procedur ile Urunler Tablosunu birleştirerek gerekli bilgileri aldık.
                var getir = (from u1 in et.sepetgetir(uyeid)
                             join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                             where u1.UrunID == u2.UrunID
                             select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });
                // Repeater'ımıza bağladık.
                Repeater1.DataSource = getir;
                Repeater1.DataBind();
                var getir3 = (from u1 in et.sepetgetir(uyeid)
                             join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                             where u1.UrunID == u2.UrunID
                             select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });

                toplam = getir3.Sum(s => Convert.ToDouble(s.Adet * (s.UrunFiyat + (s.UrunFiyat / 100 * Convert.ToInt32(s.KDV)))));
                lblFiyat.Text = toplam.ToString();

            }
            else // eğer sepet boş ise aşağıdaki bilgiyi ver
            {
                btnadetdegistir.Visible = false;
                Panel1.Visible = false;
                lblBilgi.Text = "Sepetinizde Ürün Bulunmamaktadır..";
            }


        }
        else
        {
            string ip;
            ip = Request["REMOTE_ADDR"].ToString(); // Kişinin ip adresini aldık
            var sepetg2 = et.ipsepetgetir(ip).Count(); // bu ip ait kaç satır oldugunu bulduk.
            int adet2 = sepetg2; //sepet2'mizi adet ' e atadık.
            if (adet2 != 0) // sepet boş değilse ise aşagıdaki işlemleri yap dedik. Eğer boş ise else git dedik.
            {
                // ip ye ait ürünleri bulma işlemini stored procedur ile urunler tablosunu birleştirerek yaptık ve gerekli bilgileri aldık.
                var getir2 = (from u1 in et.ipsepetgetir(ip)
                             join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                             where u1.UrunID == u2.UrunID
                             select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });
                // Repeater'ımıza bağladık.
                Repeater1.DataSource = getir2;
                Repeater1.DataBind();

                var getir4 = (from u1 in et.ipsepetgetir(ip)
                              join u2 in et.Urunlers on u1.UrunID equals u2.UrunID
                              where u1.UrunID == u2.UrunID
                              select new { u1.SepetID, u1.Adet, u2.UrunAD, u2.UrunFiyat, u2.KDV, u2.Resim1 });

                toplam = getir4.Sum(s => Convert.ToDouble(s.Adet * (s.UrunFiyat + (s.UrunFiyat / 100 * Convert.ToInt32(s.KDV)))));
                lblFiyat.Text = toplam.ToString();
            
            }
            else // eğer sepet boş ise aşağıdaki bilgiyi ver
            {
                btnadetdegistir.Visible = false;
                Panel1.Visible = false;
                lblBilgi.Text = "Sepetinizde Ürün Bulunmamaktadır..";
            }
        }
    
    }

    public void sepetsil()
    {
        //Stored procedure ile silme işlemimizi yaptık. SepetID'imizi alarak.
        et.sepetsil(int.Parse(Request.QueryString["id"]));
        Response.Redirect("Default.aspx?ad=sepet"); // Sayfamızı Yeniledik.
    }
    protected void btnadetdegistir_Click(object sender, EventArgs e)
    {
        int uyeid;
        if (Session["UyeEposta"] != null)
        {
            uyeid = (from u in et.Uyelers
                     where u.UyeEposta == Session["UyeEposta"].ToString()
                     select u.UyeID).FirstOrDefault();
            var sayi = et.sepetgetir(uyeid).Count();

            for (int i = 0; i < sayi; i++)
            {
                //Repeater içersindeki Textbox ve Label'a ulaşmak için işlemlerimizi yaptık.
                TextBox UAdet = (TextBox)Repeater1.Items[i].FindControl("TextBox1");
                Label UrunSid = (Label)Repeater1.Items[i].FindControl("Label1");
                // Daha SOnra Ulaştıgımız Textbox ve LAbel biligilerini  adet ve uid adli değişkenlerimize atadık.
                int adet = int.Parse(UAdet.Text);
                int uid = int.Parse(UrunSid.Text);

                //Güncelleme işlemlerimizi yaptık.
                var guncelle = et.Sepets.Single(s => s.SepetID == uid); // SepetId li Satırımıza ulaştık.
                guncelle.Adet = adet; // Textboxdaki adet değişikliğini yaptık.
                et.SubmitChanges(); // veritabanındaki değişiklikleri kaydettik.
            }
            sepetgetir(); // sepetgetir fonksiyonumuzu çağırdık.
        }
        else
        {
            string ip;
            ip = Request["REMOTE_ADDR"].ToString();

            var sayi = et.ipsepetgetir(ip).Count();

            for (int i = 0; i < sayi; i++)
            {
                //Repeater içersindeki Textbox ve Label'a ulaşmak için işlemlerimizi yaptık.
                TextBox UAdet = (TextBox)Repeater1.Items[i].FindControl("TextBox1");
                Label UrunSid = (Label)Repeater1.Items[i].FindControl("Label1");
                // Daha SOnra Ulaştıgımız Textbox ve LAbel biligilerini  adet ve uid adli değişkenlerimize atadık.
                int adet = int.Parse(UAdet.Text);
                int uid = int.Parse(UrunSid.Text);

                //Güncelleme işlemlerimizi yaptık.
                var guncelle = et.Sepets.Single(s => s.SepetID == uid); // SepetId li Satırımıza ulaştık.
                guncelle.Adet = adet; // Textboxdaki adet değişikliğini yaptık.
                et.SubmitChanges(); // veritabanındaki değişiklikleri kaydettik.
            }
            sepetgetir(); // sepetgetir fonksiyonumuzu çağırdık.   
        }
    }
}
