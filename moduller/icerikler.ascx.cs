using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class moduller_icerikler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataContext Nesnemizi Oluşturduk.

    protected void Page_Load(object sender, EventArgs e)
    {
        // İçeiğin olup olmadıgının kontrolunu yapmak için icer değişkeniyle adet değişkenini tanımladık
        //ve icer değişkenine atama yaparken count ile saydırma işlemini yaptık.
        //Eğer Count 0 ise Aranan sayfa yok mesajı verdirdik eğer değer  1 ise içerikleri getir.
        var icer = et.icerikgetir(int.Parse(Request.QueryString["id"])).Count();
        int adet = icer;

        if (adet != 0) // içerik 0 değil ise
        {
            // içerikleri getirme işlemlerini yaptık. Stored procedure kullanarak aldık.
            var icerik = et.icerikgetir(int.Parse(Request.QueryString["id"]));
            FormView1.DataSource = icerik; // FormView'umaza atadık.
            FormView1.DataBind();

            //Seçilen içeriğin balığını alma işlemini yaptık. ve Label2 de yayınladık.
            var icerik2 = et.icerikgetir(int.Parse(Request.QueryString["id"])).FirstOrDefault();
            Label2.Text = icerik2.IcerikBaslik;

        }
        else // Adet = 0 ise label1 de uyarıyı çıkar .
        {
            Label1.Text = "Aradığınız içerik bulunmamaktadır...";
        }

    }
}