using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_disaritoplumail : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngonder_Click(object sender, EventArgs e)
    {
        var uyeler = et.DisardanUyeliks;

        try
        {
            foreach (var item in uyeler) // Bu üyelerin hepsi yollanıcağı için de tekere teker listede gezilmesini sağladık.
            {
                // Mailgonder(kim,kime,konu,icerik);
                mailgonder("gorselegitim@gmail.com", item.UyeEposta, txtKonu.Text, FCKeditor1.Value);
            }
            lblBilgi.Text = "Mailler Gönderildi."; // Mailler gönderilmişsse bilgi ver dedik.

        }
        catch (Exception ee)
        {
            lblBilgi.Text = ee.Message; // Hata Alındıysa mesajı göster.
        }


    }

    public void mailgonder(string kimden, string kime, string konu, string icerik)
    {
        MailAddress alici = new MailAddress(kime); // kime gönderileceği alındı
        MailAddress gonderen = new MailAddress(kimden, "E-Ticaret"); // kimden gideceği alındı
        MailMessage mail = new MailMessage(gonderen, alici); // mail oluşturuldu. kimden ->kime
        mail.Subject = konu; // mailin konusunu aldık.
        mail.IsBodyHtml = true;
        mail.Body = icerik; // Mailin mesaj kısmını oluşturduk.
        SmtpClient client = new SmtpClient();
        client.Host = "smtp.gmail.com"; //Host ayarlamasını yaptık.
        client.EnableSsl = true;
        client.Port = 587; // port numarasını ekledik.
        client.Send(mail); // mail gönderme işlemini yaptık.

    }
}