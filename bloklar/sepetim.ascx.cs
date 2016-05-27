using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_sepetim : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["UyeEposta"]!=null)//Kullanıcı girişi yapıdıysa 
        {
            // UyeEpostaya ait üye ID sini aldık. ve daha sonra sepet getirme işlemlerini yaptık.
            //Sepetteki ürün sayısını count ile bulup label da gösterdik.
            int uyeid;
            uyeid = (from u in et.Uyelers
                     where u.UyeEposta == Session["UyeEposta"].ToString()
                     select u.UyeID).FirstOrDefault();

            var sepetim = et.sepetgetir(uyeid);
            lblUrunSayisi.Text = sepetim.Count().ToString();
            
        }
        else // Kullanıcı girişi yapılmadıysa
        {
            string ip;
            ip = Request["REMOTE_ADDR"].ToString(); // ip adresimizi aldık.
            var sepetim = et.ipsepetgetir(ip); // ip ye ait sepet bilgilerimizi getirdik.
            lblUrunSayisi.Text = sepetim.Count().ToString(); // ve bu sepette kaçtane ürün oldugunu count saydık.
            //Coun sayısınıda label'ımızda yazdırdık.
            
        }

    }
}