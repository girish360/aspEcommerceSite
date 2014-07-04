using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspsajt.Administrator
{
    public partial class kategorije : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            
            TextBox TextBoxNaziv = (TextBox)this.DetailsViewKategorije.FindControl("TextBoxNaziv");
            e.Command.Parameters["@Naziv"].Value = TextBoxNaziv.Text;
            DropDownList roditelj = (DropDownList)this.DetailsViewKategorije.FindControl("DropDownListRoditelj");
            if (roditelj.SelectedValue!="Nema")
            {
                int djoka = Int32.Parse(roditelj.SelectedValue);
                e.Command.Parameters["@IdRoditelj"].Value = djoka;
            }
            else
            {
                e.Command.Parameters["@IdRoditelj"].Value = DBNull.Value;
            }
            
        }
    }
}