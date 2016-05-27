using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_orta : System.Web.UI.UserControl
{

    eticaretDataContext et = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var reklam = et.Reklamlars.Where(v => v.Pozisyon == "Sağ");
        var adet = reklam.Count();

        if (adet != 0)
        {
            Label1.Text = "<table>";

            foreach (var item in reklam)
            {
                Label1.Text = Label1.Text + "<tr><td align='center'>";

                var rklm = et.Reklamlars.Where(v => v.ID == item.ID).SingleOrDefault();

                if (rklm.ReklamTuru.ToString() == "Resim")
                {

                    Label1.Text = Label1.Text + "<a href='" + rklm.URL + "'><img src='reklamlar/" + rklm.Reklam + "' height='200' width='200' border='0' align='center'/></a>";
                }
                else
                {
                    Label1.Text = Label1.Text + "<a href='" + rklm.URL + "'><embed src='reklamlar/" + rklm.Reklam + "'/></a>";
                }

                Label1.Text = Label1.Text + "</td></tr>";

            }
            Label1.Text = Label1.Text + "</table>";
        }

    }
}