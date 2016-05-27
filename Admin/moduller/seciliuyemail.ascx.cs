using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_seciliuyemail : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext Nesnemizi Ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Seçim Yapılacak griedview de hangi butona tıklandığını bulmak için  SelectrdRow'unun 1. Kolonunu aldık.
        //Kolon Sıralaması 0-1-2-3-4-5-.. olarak gidiyor Bana gerekli olan UyeEposta olduğu için Üye Eposta 1. Sırada yer aldıgından Cells[1] ibaresini kullandık.
       // Seçilen Üye Epostayı da Label da Gösterdik.
        lblMail.Text = GridView1.SelectedRow.Cells[1].Text;
    }
    protected void btnGonder_Click(object sender, EventArgs e)
    {

        // Mail Yollam işlemkerimiz için Mail Kontrolunu yaptık 
        var kullanicilar = et.Uyelers.Where(v => v.UyeEposta == lblMail.Text).FirstOrDefault();
        if (kullanicilar != null)
        {
            MailAddress alici = new MailAddress(kullanicilar.UyeEposta); // Gönderilecek olan kişi bulduk
            MailAddress gonderen = new MailAddress("gorselegitim@gmail.com", "E-Ticaret"); // Gönderen kişi Belirledik.
            MailMessage mesaj = new MailMessage(gonderen, alici); // Kimden Kime Gideciğini Belirttik.
            mesaj.Subject = txtMailBaslik.Text; // Mailimizin Başlığını OLusturduk.
            mesaj.IsBodyHtml = true;
            mesaj.Body = FCKeditor1.Value; // İçerik Kısmını Olusturduk.
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.Port = 587;
            client.Send(mesaj); // Mail Gönderme işlemini gerçekleştirdik.
            lblBilgi.Text = "E-Postanız Gönderilmiştir."; // Bilgi Mesajını Verdirdik.
            




        }


    }
}