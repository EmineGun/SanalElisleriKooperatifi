using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_odemetalep : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();// DataContext Nesnemizi Ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngonder_Click(object sender, EventArgs e)
    {
        string ip;
        ip = Request["REMOTE_ADDR"].ToString(); // IP adresmizi ip de tuttuk.
        //stored procedure ile ekleme işlemlerimizi yaptık.
        et.odemetalepekle(Session["UyeEposta"].ToString(), txtBaslik.Text, txtAciklama.Text, DateTime.Now, ip);
        // Label'da bilgilendirme işlemimizi yaptık.
        lblBilgi.Text = "Ödeme Bildirim Talebiniz Gönderilmiştir." + "<meta http-equiv='reflesh' content='3;url=Default.aspx?ad=odemetalep' >";

    }
}