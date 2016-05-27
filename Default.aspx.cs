using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{

    eticaretDataContext et = new eticaretDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        

        try
        {
            if (Request.QueryString["ad"] != null)
            {
                PlaceHolder1.Controls.Clear();
                PlaceHolder1.Controls.Add(LoadControl("moduller/" + Request.QueryString["ad"].ToString() + ".ascx"));
            }
            else
            {
                PlaceHolder1.Controls.Clear();
                PlaceHolder1.Controls.Add(LoadControl("bloklar/orta.ascx"));
            }

        }
        catch (Exception)
        {
            lblDurum.Visible = true;
            lblDurum.Text = "Aradığınız Sayfa Bulunamamaktadır.";
        }
        finally { }


        et.istatistiks.InsertOnSubmit(new istatistik
        {
            IP = Request.ServerVariables["REMOTE_ADDR"],
            Sayfa = HttpContext.Current.Request.RawUrl,
            Tarih = DateTime.Now,
            Browser = Request.Browser.Browser,
            Referer = Request.ServerVariables["HTTP_REFERER"]
        });

        et.SubmitChanges();

       
    }


   
}