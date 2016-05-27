using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_sag : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Datacontext newnemizi ekledik.

    protected void Page_Load(object sender, EventArgs e)
    {
        var reklam = et.Reklamlars.Where(v => v.Pozisyon == "Sağ"); // Pozisyonu Sağ olan reklamları bulduk.
        var adet = reklam.Count(); // Kaçtane pozisyonu sağ olan reklam olduğunun sayısını adette tuttuk.

        if (adet != 0) // adet 0 dan farklıysa
        {
            Label1.Text = "<table>"; // tablo açtık

            foreach (var item in reklam) // BÜTÜN REKLAMLAR YAZILANA KADAR DEVAM ET AŞAĞIDAKİ İŞLEMLERE
            {
                Label1.Text = Label1.Text + "<tr><td align='center'>"; //tablonun satır ve sutunlarını açtık

                var rklm = et.Reklamlars.Where(v => v.ID == item.ID).SingleOrDefault(); // Hangi reklamını yazdırcagımızı bulduk.

                if (rklm.ReklamTuru.ToString() == "Resim") // reklam türü = resim ise
                {
                                                                                       
                    Label1.Text = Label1.Text +"<a href='"+rklm.URL+"'><img src='reklamlar/" + rklm.Reklam + "' height='200' width='200' border='0' align='center'/></a>";
                }
                else // animasyon ise 
                {
                    Label1.Text = Label1.Text +"<a href='"+rklm.URL+"'><embed src='reklamlar/" + rklm.Reklam + "'/></a>";
                }

                Label1.Text = Label1.Text + "</td></tr>"; // Yukarda açtıgımız satır ve kolonları kapadık.

            }
            Label1.Text = Label1.Text + "</table>"; // Yukarda açtığımız ablomuzu kapadık.
        }
        
       
    }
} 