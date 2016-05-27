using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_vitrin : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // data context nesnemizi olusturduk.

    protected void Page_Load(object sender, EventArgs e)
    {
        var vitrinim = et.VitrinGetir(); // stored procedur ile veritabanımızın vitrin ürünlerini çekip vitrinim isimli değere atadık.
        Repeater1.DataSource = vitrinim; // Repeater ile bağlantısını kurduk.
        Repeater1.DataBind();

    }
}