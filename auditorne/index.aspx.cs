using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace aspsajt
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["kategorija"]!=null)
            {
                
                string kategorija = Request.QueryString["kategorija"];
                SqlDataSource1.SelectCommand = "SELECT * FROM Proizvodi p LEFT OUTER JOIN Kategorije k ON p.IdKategorija = k.IdKategorija LEFT OUTER JOIN Brendovi b ON p.IdBrend = b.IdBrend LEFT OUTER JOIN Slike s ON p.IdProizvod = s.IdProizvod WHERE Glavna = 1 AND p.IdKategorija=" + kategorija;
                SqlDataSource1.DataBind();
            }

            //if (this.IsPostBack)
            //{
            //    TextBox pretraga = (TextBox)this.Master.FindControl("TextBoxPretraga");
            //    string trazi = pretraga.Text;

            //    HtmlGenericControl obavestenje = (HtmlGenericControl)this.Master.FindControl("poruka");
            //    obavestenje.InnerHtml = trazi;
            //}
        }
    }
}