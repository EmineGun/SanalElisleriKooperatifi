using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_FaturaDetay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Yonetici"] == null) Response.Redirect("Default.aspx");
        //eğer yönetici girişi yapılmamışsa Default.aspx sayfasına yönlendir.

        try
        {
            if (Request.QueryString["ad"] != null)
            {
                PlaceHolder1.Controls.Clear(); // Dışardan sayfa çağırmaya yarayan Placeholder nesnesini boşalt.
                PlaceHolder1.Controls.Add(LoadControl("moduller/fatura.ascx"));
                //Placeholder nesnemize adres çubugunda hangi sayfa yazılmışsa o sayfayı göster.

            }

        }
        catch (Exception)
        {
            lblDurum.Visible = true; // labelimizin görünürlüğünü true yaptık.
            lblDurum.Text = "Aradığınız Sayfa Bulunamamaktadır.";
            //eğer sayfa bulunamazsa labelde uyarı verdirdik.

        }
        finally { }


    }
}