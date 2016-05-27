using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_alt : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        var oku = et.temalars.FirstOrDefault(); // temalar veritabanımıza ulaştık.
        Label1.Text = oku.alt; // veritabanındaki alt kolunundaki bilgileri çektik.
    }
}