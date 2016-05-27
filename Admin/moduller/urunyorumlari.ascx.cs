using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_urunyorumlari : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        OnayBekleyenYorumlar(); // ONay Bekleyen Yorumlar fonksiyonunu çağırdık.

    }

    public void OnayBekleyenYorumlar()
    {  // veritabanında Yorum Durumu 0 olanları griedview'de izleme işlemini yaptık.
        var yorum = et.Yorumlars.Where(v => v.Durum == 0); 
        GridView1.DataSource = yorum;
        GridView1.DataBind();
    
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Yorum onaylanması  için stored procedure oluştur. 
        //seçilmiş olan satırın ilk kolunundaki YORUMID yi alıp durumunu 1 yaptırdık.
        et.YorumOnayla(int.Parse(GridView1.SelectedRow.Cells[0].Text), 1);
        Response.Redirect("Yonetim.aspx?ad=urunyorumlari");
    }
}