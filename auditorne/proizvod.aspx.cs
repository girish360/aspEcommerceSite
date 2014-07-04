using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace aspsajt
{
    public partial class proizvodi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourceKomentari_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            try
            {

            
            MembershipUser regKorisnik = Membership.GetUser(User.Identity.Name);
            TextBox TextBoxDodajKomentar = (TextBox)this.DetailsViewDodajKomentar.FindControl("TextBoxDodajKomentar");
            e.Command.Parameters["@Tekst"].Value = TextBoxDodajKomentar.Text;
            e.Command.Parameters["@DatumDodavanja"].Value = DateTime.Now;
            e.Command.Parameters["@Odobren"].Value = false;
            e.Command.Parameters["@IdAutor"].Value = regKorisnik.ProviderUserKey;
            }
            catch (Exception ex)
            {
                HtmlGenericControl obavestenje = (HtmlGenericControl)this.Master.FindControl("poruka");
                obavestenje.InnerHtml = ex.Message;
                
            }
        }
    }
}