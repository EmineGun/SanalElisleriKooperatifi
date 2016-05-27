using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_altkategoriler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        AltKategorileriGetir();
 

    }
     protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, new ListItem("Ana Kategori Seçiniz..", "0")); // Seçim yapılmaıs için bilgi eklendi

    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        //Dropdownlist ve textbozdaki bilgilerin veritabanına insert edilme işlemini yaptık.
        et.AltKategorilers.InsertOnSubmit(new AltKategoriler { ALTAD = txtALTAD.Text, AKID = int.Parse(DropDownList1.SelectedValue) });
        et.SubmitChanges(); // veritaanındaki değişlikleri kaydettik
        Response.Redirect("Yonetim.aspx?ad=altkategoriler"); //Sayfa Yenileme işlemini yaptık.
    }

    public void AltKategorileriGetir() // Griedview ALTID AKAD ve ALTAD verilerimizin tabloya çekme işlemini yaptık.
    {
        //veritabanı ile join kullanarak 2 tabloyu bağladık.
        var altkategoriler = from anak in et.AnaKategorilers
                             join altk in et.AltKategorilers
                             on anak.AKID equals altk.AKID
                             select new { altk.ALTID, altk.ALTAD, anak.AKAD };
        grdAltKategoriler.DataSource = altkategoriler;
        grdAltKategoriler.DataBind();
        
    }

    protected void AltKategorileriSil(object sender, EventArgs e)
    {
        // btnsil aldı butonumuzu projemize tanıttık.
        ImageButton btnsil = sender as ImageButton;
        // btnsil ile alınan ID ile veritabanında karılastırılıp silme işleme işlemini gercekleştirdik.
        et.AltKategorilers.DeleteOnSubmit(et.AltKategorilers.First(v => v.ALTID == Convert.ToInt32(btnsil.CommandArgument)));
        et.SubmitChanges(); // değişiklikleri kaydettik
        AltKategorileriGetir(); // Fonk. Çagırdık.
        Response.Redirect("Yonetim.aspx?ad=altkategoriler"); //Sayfa Yenileme işlemini yaptık.
    }




    protected void grdAltKategoriler_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Find COntrolle bilgilerimiz aldık ve değişiklikleri yaptık.
        int AltID = Convert.ToInt32((this.grdAltKategoriler.Rows[e.RowIndex].FindControl("lblID") as Label).Text);
        AltKategoriler altkategori = et.AltKategorilers.Single(v => v.ALTID == AltID);
        altkategori.ALTAD = (this.grdAltKategoriler.Rows[e.RowIndex].FindControl("txtAD") as TextBox).Text;
        altkategori.AKID = Convert.ToInt32((this.grdAltKategoriler.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList).SelectedValue);
        et.SubmitChanges();
        AltKategorileriGetir();
        Response.Redirect("Yonetim.aspx?ad=altkategoriler"); //Sayfa Yenileme işlemini yaptık.
    }
    protected void grdAltKategoriler_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdAltKategoriler.EditIndex = e.NewEditIndex;
        //yeni bir index oluşturcağımızı belirttik

    }
    protected void grdAltKategoriler_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdAltKategoriler.EditIndex = -1; // vazgeçme işlemini yaptık.
        AltKategorileriGetir();
    }


}