using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_moduller_Vitrin : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // data context nesnemi ekledim.

    protected void Page_Load(object sender, EventArgs e)
    {
        VitrinGetir();

    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        // HATA YAKALAMAK İÇİN TRY CATCH BLOGU OLUSTURDUM.
        try
        {
            et.VitrinEkle(FileUpload1.FileName, txtURL.Text); // STORED PROSEDURE İLE RESİM EKLEDİK.
            FileUpload1.SaveAs(Server.MapPath("../vitrinurunleri/" + FileUpload1.FileName)); // EKLENEN RESİMLERİDE KAYIT İŞLEMİNİ YAPTIK.
            VitrinGetir();
            lblDurum.Text = "Resim Yüklendi.."; // RESİM YUKLENINCE DURUMUNU BELİRTTİK.


        }
        catch (Exception)
        {

            lblDurum.Text = "Resim Yüklenemedi...!"; // RESİM YUKLENMESINDE HATA ALINIRSA BİLGİLENDİRDİK.
        }
    }
    public void VitrinGetir() // FONKSİYON OLUSTURDUK.
    {
        var vitrinG = et.VitrinGetir(); // STORED PROCEDURE İLE VİTRİN BİLGİLERİMİZİ ÇAGIRIP VİTRİNG YE ATADIKÇ
        GridView1.DataSource = vitrinG; // GRİD'İMİZE ATAMA İŞLEMLERİNİ GERÇEKLEŞTİRDİK.
        GridView1.DataBind();
    
    }

    public void VitrinSil(object sender, EventArgs e) // SOURCE TARAFINDA OnClick="VitrinSil" DEDİĞİMİZDEN DOLAYI FONKSİYONUMUZUN ADINA VitrinSil DEDİK.
    {
        
        ImageButton btnsil = sender as ImageButton;//BTNSİL RESMİMİZ BUTON OLDUGU BİLMEİDĞİNDEN PROJEMİZE TANITTIK.
        et.VitrinSil(Convert.ToInt32(btnsil.CommandArgument)); //COMMAND ARGUMENT'İMİZ ( VİTRİNID ) İLE SİLME İŞLEMİMİZİ GERCEKTİRDİK.
        VitrinGetir(); // GRİED'İMİZİ ÇAGIRDIK.
    
    }
}