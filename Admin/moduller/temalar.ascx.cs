using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_temalar : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        bilgilerigetir(); // Bilgileri getirmek için burda fonksiyonu çağırma işlemini yaptık.

    }

    public void bilgilerigetir() // veritabanından bilgileri çekmek için fonksiyon olusturduk.
    {
        var getir = et.temalars.FirstOrDefault(); // veritabanımızın temalar tablosuna bağlandık .
        FCKeditor1.Value = getir.ust; // FCK1 'e ust kısmı getittirdik.
        FCKeditor2.Value = getir.alt; // FCK2 ' alt kısmı getittirdik.
    
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        var guncelle = et.temaguncelle(FCKeditor2.Value, FCKeditor1.Value, 1); // Stored procedure ile güncelleme işlemlerini yaptık.
        et.SubmitChanges();// VT Değişiklikleri kaydettik.
        Response.Redirect("Yonetim.aspx?ad=temalar");// Sayfa Yönlendirme işlemini yaptık.(Yeniledik.)
    }
}