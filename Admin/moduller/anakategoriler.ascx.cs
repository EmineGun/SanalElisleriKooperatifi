using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_anakategoriler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();
    // Data COntext nesnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        AnaKategorileriGetir(); // ANAKATEGORİ fonksiyonumuzu çağırdık.

    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        et.AnaKategorilers.InsertOnSubmit(new AnaKategoriler { AKAD = txtAKAD.Text });
        //veritabanımıza bağlanıp textboxt'dan verimizi ekledik.
        et.SubmitChanges(); // Veritabanındaki değişlikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=anakategoriler"); // Sayfa Yenileme işlemini yaptık.

    }
    public void AnaKategorileriGetir() // Ana KAtegori Getir Fonksiyonu Oluşturduk.
    {
        var anak = from ak in et.AnaKategorilers   // veritabanımıza bağlanıp AnaKategori tablosuna ait olan AKID ve AKAD verilerimizi çekip anak değişkeninde tuttuk.
                   select new { ak.AKID,ak.AKAD  };
        grdAnaKategoriler.DataSource = anak; // griedview de sergileme işlemini yaptık.
        grdAnaKategoriler.DataBind();
    }

    protected void AnaKategoriSil(object sender, EventArgs e)
    {
        
        ImageButton btnSil = sender as ImageButton; // btnSil resmimizi imagebutton ile projemize tanıttık. Yani btnSil ulaşımını sağladık.
        et.ALTSil(Convert.ToInt32(btnSil.CommandArgument)); // btnsil butonundan seçili olan AKID ile ALt kategoriden silme işlemini yaptık.
        et.AnaKategorilers.DeleteOnSubmit(et.AnaKategorilers.First(v=>v.AKID == Convert.ToInt32(btnSil.CommandArgument))); // btnsil butonundan alınan AKID ile veritabanında eşleme yapıp silme işlemini gerçekleştirdi.
        et.SubmitChanges(); // veritabanındaki değişiklikleri kaydettik.
        AnaKategorileriGetir(); // AnaKategorileriGetir fonksiyonunu çağırdık.
        
 
    }
    protected void grdAnaKategoriler_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdAnaKategoriler.EditIndex = e.NewEditIndex; // Yeni bir index oluşturcağımızı belirttik.
        AnaKategorileriGetir();

    }
    protected void grdAnaKategoriler_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //LabelID imizi Find Control ile ID bulma işlemini yaptık.
        int AnaID = Convert.ToInt32((this.grdAnaKategoriler.Rows[e.RowIndex].FindControl("lblID") as Label).Text);
        //AnaKategoriler değerinde anakategori değişkeni tanımladık ve tek bir veri çekeceğimiz için Sign işlemini kullandık.
        AnaKategoriler anakategori = et.AnaKategorilers.Single(v => v.AKID == AnaID);
        // Text Bak Kontrolumuz ile değiştirilen veriyi alıp veri tabanında ilgili bölümü değiştirdik..
        anakategori.AKAD = (this.grdAnaKategoriler.Rows[e.RowIndex].FindControl("txtAD") as TextBox).Text;
        et.SubmitChanges(); // değişiklikleri kaydettik
        Response.Redirect("Yonetim.aspx?ad=anakategoriler"); // sayfamızı yeniledik
        AnaKategorileriGetir(); // Fonksiyonumuzu çağırdık.




    }
    protected void grdAnaKategoriler_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdAnaKategoriler.EditIndex = -1; // işlemden vazgeçildi.
        AnaKategorileriGetir();

    }
}
