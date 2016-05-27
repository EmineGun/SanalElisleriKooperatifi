using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bloklar_kategoriler : System.Web.UI.UserControl
{
    eticaretDataContext et = new eticaretDataContext(); // Data Context Nesnemizi Bagladık.

    protected void Page_Load(object sender, EventArgs e)
    {
        var AK = from v in et.AnaKategorilers // Anakategoriler tablosundan verilei çekip AK Adlı değişkende tuttuk.
                 select v;
        //Repeater nesnemizi veritabanına bağladık.
        rptAnaKategoriler.DataSource = AK;
        rptAnaKategoriler.DataBind();


    }
    //ItemDataBound ===  ItemTemplate işlemi içinde yazdığımız kompanentlere veritabanında bağlanmamıza yarıyor.
    protected void rptAnaKategoriler_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rp = (Repeater)e.Item.FindControl("rptAltKategoriler"); //rptAnaKategoriler Repeaterın içindeki rptAltKategoriler Repeater'ını buldurma işlemini yaptık.
            int Id = int.Parse(DataBinder.Eval(e.Item.DataItem, "AKID").ToString()); // Anakategorideki AKID bulma işlemini yapıp Id değişkenine attık.
            
            //Ana Kategorimizin ID sine göre arama işlemi yaptık. ve rp değişkenimizle Repeater'a bağlandık.
            rp.DataSource = et.AltKategorilers.Where(v => v.AKID == Id).OrderBy(s=>s.ALTAD); 
            rp.DataBind();

        
        }



    }
}