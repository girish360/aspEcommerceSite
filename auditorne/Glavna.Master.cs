using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspsajt
{
    public partial class Glavna : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = SqlDataSourceSlajder;
            Repeater1.DataBind();
        }

        protected void DetailsViewAnketa_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            DetailsViewAnketa.DefaultMode = DetailsViewMode.ReadOnly;
        }

        protected void SqlDataSourceAneta_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            RadioButtonList izabran = (RadioButtonList)this.DetailsViewAnketa.FindControl("RadioButtonList");
            e.Command.Parameters["@IdAnketaOdgovor"].Value = izabran.SelectedItem.Value;
        }

        


    }
}