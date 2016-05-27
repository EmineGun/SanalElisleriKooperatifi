using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_bankahareket : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // DataCOntext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblid.Text = GridView1.SelectedRow.Cells[0].Text; // seçili satırdaki ID kolonundaki bilgiyi aldık ve lblid adlı Label da yazdırdık.
        txtborc.Text = "0"; // Textbox alanlarına 0 yazdırdık.
        txtalacak.Text = "0"; // Textbox alanlarına 0 yazdırdık.

        var id = et.HesapHarekets.Where(v => v.ID == int.Parse(lblid.Text)).FirstOrDefault(); //Hesap Hareket tablosunda lblid deki bilgiye ulaştık bilgi var ise id de tuttuk.

        if (id != null)// Eğer id'de bilgi var ise
        {
            lblalacak.Text = id.Alacak.ToString(); // veritabanındaki Alacak bilgisini getirdik.
            lblborc.Text = id.Borc.ToString(); // veritabanındaki borç bilgisini getirdik.
        
        }

    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        var id = et.HesapHarekets.Where(v => v.ID == int.Parse(lblid.Text)).FirstOrDefault(); // id bilgisinin veritabanındki kontrolunu yaptık ve bilgileri id de tuttuk.

        if (id != null) // eğer bilgi var ise
        {
            // GÜNCELLEME İŞLEMİ YAPTIRDIK.
            et.hesaphareketguncelle(id.ID, Convert.ToDecimal(txtborc.Text)+id.Borc, Convert.ToDecimal(txtalacak.Text)+id.Alacak);
        
        }
        else // eğer bilgi null ise yani boş ise
        {
            // Ekleme işlemini yaptırdık.
            et.HesapHarekets.InsertOnSubmit(new HesapHareket
            {
                ID = Convert.ToInt32(lblid.Text),
                Alacak = Convert.ToDecimal(txtalacak.Text),
                Borc = Convert.ToDecimal(txtborc.Text)
            });
        }

        et.SubmitChanges(); // Değişiklikleri kaydettik
        Response.Redirect("Yonetim.aspx?ad=bankahareket"); // Sayfamızı yönlendirdik.

    }
}