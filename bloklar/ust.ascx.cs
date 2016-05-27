using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_ust : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // data Contect Nesnemizi ekledik.
   
    protected void Page_Load(object sender, EventArgs e)
    {
        var oku = et.temalars.FirstOrDefault(); // temalar tablosuna bağlandık.
        Label1.Text = oku.ust; // veritabanındaki ust kolunun bilgilerini çektik.

        var reklam = et.Reklamlars.Where(v => v.Pozisyon == "Üst");
        var adet = reklam.Count();

        if (adet != 0)
        {
            Label2.Text = "<table align='center'>";

            foreach (var item in reklam)
            {
                Label2.Text = Label2.Text + "<tr><td align='center'>";

                var rklm = et.Reklamlars.Where(v => v.ID == item.ID).SingleOrDefault();

                if (rklm.ReklamTuru.ToString() == "Resim")
                {

                    Label2.Text = Label2.Text + "<a href='" + rklm.URL + "'><img src='reklamlar/" + rklm.Reklam + "' width='100%' border='0' align:center'/></a>";
                }
                else
                {
                    Label2.Text = Label2.Text + "<a href='" + rklm.URL + "'><embed src='reklamlar/" + rklm.Reklam + "'/></a>";
                }

                Label2.Text = Label2.Text + "</td></tr>";

            }
            Label2.Text = Label2.Text + "</table>";
        }


    }
}