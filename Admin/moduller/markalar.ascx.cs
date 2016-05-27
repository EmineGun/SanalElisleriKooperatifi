using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_markalar : System.Web.UI.UserControl
{
    //DAtaCOntext nesnemize bağlandık.
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        // veri tabanımıza bağlanarak ekleme işlemini gerçekleştirdik
        et.Markalars.InsertOnSubmit(new Markalar
        { MarkaAD=txtMarkaAD.Text });
        et.SubmitChanges(); // veritabanımızdaki değişiklikleri kaydettik
        Response.Redirect("Yonetim.aspx?ad=markalar"); // sayfamızı yeniledik.
   

    }
}