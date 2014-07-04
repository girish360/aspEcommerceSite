using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspsajt.Administrator
{
    public partial class brendovi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            TextBox TextBoxNaziv = (TextBox)this.DetailsViewBrendovi.FindControl("TextBoxNaziv");
            e.Command.Parameters["@Naziv"].Value = TextBoxNaziv.Text;
        }
    }
}