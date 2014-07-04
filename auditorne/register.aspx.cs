using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace aspsajt
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void FormaUnesikorisnika_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                TextBox ime = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxIme");
                TextBox prezime = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxPrezime");
                TextBox telefon = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxTelefon");
                TextBox adresa = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxTelefon");
                TextBox grad = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxGrad");
                RadioButtonList pol = (RadioButtonList)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListPol");
                Calendar datumRodjenja = (Calendar)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("CalendarDatumRodjenja");
                TextBox korisnickoIme = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
                if (ime != null && prezime != null && telefon != null && adresa != null && grad != null && pol != null && datumRodjenja != null && korisnickoIme != null)
                {
                    MembershipUser regKorisnik = Membership.GetUser(korisnickoIme.Text);
                    if (regKorisnik != null)
                    {
                        SqlConnection veza = new SqlConnection();
                        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();
                        SqlCommand komanda = new SqlCommand();
                        komanda.Connection = veza;
                        komanda.CommandType = CommandType.Text;
                        komanda.CommandText = "INSERT INTO KorisnikDodatno (IdKorisnikDodatno, Ime, Prezime, Pol, Telefon, Adresa, Grad, DatumRodjenja) VALUES(@IdKorisnikDodatno, @Ime, @Prezime, @Pol, @Telefon, @Adresa, @Grad, @DatumRodjenja)";

                        komanda.Parameters.AddWithValue("@IdKorisnikDodatno", regKorisnik.ProviderUserKey);
                        komanda.Parameters.AddWithValue("@Ime", ime.Text);
                        komanda.Parameters.AddWithValue("@Prezime", prezime.Text);
                        komanda.Parameters.AddWithValue("@Telefon", telefon.Text);
                        komanda.Parameters.AddWithValue("@Adresa", adresa.Text);
                        komanda.Parameters.AddWithValue("@Grad", grad.Text);
                        komanda.Parameters.AddWithValue("@Pol", pol.SelectedItem.Value);
                        komanda.Parameters.AddWithValue("@DatumRodjenja", datumRodjenja.SelectedDate);
                        komanda.Connection.Open();
                        komanda.ExecuteNonQuery();
                        komanda.Connection.Close();
                        
                        //GridViewListaKorisnika.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                HtmlGenericControl obavestenje = (HtmlGenericControl)this.Master.FindControl("poruka");
                obavestenje.InnerHtml = ex.Message;
            }
        }

    }
}