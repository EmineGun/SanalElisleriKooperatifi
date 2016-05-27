using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_puan : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        lblid.Text = GridView1.SelectedRow.Cells[0].Text;

        var bilgi = et.PuanYoneticis.Where(v => v.ID == int.Parse(lblid.Text)).FirstOrDefault();

        lblalan.Text = bilgi.Alan;
        lblodeme.Text = bilgi.OdemeSekli;
        txtPuan.Text = bilgi.Puan.ToString();

    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        et.PuanYonetimGuncel(Convert.ToInt32(lblid.Text), Convert.ToDecimal(txtPuan.Text));
        et.SubmitChanges();
        Response.Redirect("Yonetim.aspx?ad=puan");

    }
}