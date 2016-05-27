using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Printing;

public partial class Admin_Default : System.Web.UI.Page
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngiris_Click(object sender, EventArgs e)
    {
        var yoneticiler= et.YoneticiKontrol(txtYoneticiAd.Text,FormsAuthentication.HashPasswordForStoringInConfigFile(txtSifre.Text,"sha1"));
        // yöneticiler tablosunda nesnelerimize yazılan ad ve şifreyi attık.
        var yonetici = yoneticiler.FirstOrDefault();
        if (yonetici!=null)
	    {
            Session["Yonetici"]= yonetici.YoneticiAd;
            Response.Redirect("Yonetim.aspx");
	    }
        else
	    {
            lblDurum.Visible=true;
            lblDurum.Text="Hatalı Giriş..!!";
	    }

    }

}