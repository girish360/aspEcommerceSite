using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using auditorne.code;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace auditorne.administrator
{
    public partial class korisnici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
            if (!this.IsPostBack)
            {
                DropDownList godine = (DropDownList)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListGodRodjenja");
                if (godine != null)
                {
                    korisnici.godineRodjenja(godine);
                    korisnici.godineRodjenja(ddlGodine);
                }
            }
        }

        public static void godineRodjenja(DropDownList list)
        {
            ListItem prvi = new ListItem("0", "Izaberite...");
            prvi.Selected = true;
            list.Items.Add(prvi);
            for (int i = 1920; i < 2011; i++)
            {
                ListItem tmp = new ListItem(i.ToString(), i.ToString());
                list.Items.Add(tmp);
            }
        }

        protected void FormaUnesikorisnika_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                TextBox imePrezime = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("TextBoxImePrezime");
                RadioButtonList pol = (RadioButtonList)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonListPol");
                DropDownList godina = (DropDownList)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListGodRodjenja");
                DropDownList uloga = (DropDownList)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("DropDownListUloge");
                TextBox korisnickoIme = (TextBox)FormaUnesikorisnika.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
                if (imePrezime != null && pol != null && godina != null && uloga != null && korisnickoIme != null)
                {
                    MembershipUser regKorisnik = Membership.GetUser(korisnickoIme.Text);
                    if (regKorisnik != null)
                    {
                        SqlConnection veza = new SqlConnection();
                        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();
                        SqlCommand komanda = new SqlCommand();
                        komanda.Connection = veza;
                        komanda.CommandType = CommandType.StoredProcedure;
                        komanda.CommandText = "InsertKorisnikDodatno";

                        komanda.Parameters.AddWithValue("@idKorisnik", regKorisnik.ProviderUserKey);
                        komanda.Parameters.AddWithValue("@imePrezime", imePrezime.Text);
                        komanda.Parameters.AddWithValue("@pol", pol.SelectedItem.Value);
                        komanda.Parameters.AddWithValue("@godinaRodjenja", godina.SelectedValue);
                        komanda.Connection.Open();
                        komanda.ExecuteNonQuery();
                        komanda.Connection.Close();
                        Roles.AddUserToRole(korisnickoIme.Text, uloga.SelectedItem.Text);
                        GridViewListaKorisnika.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                glavna mojMaster = (glavna)this.Master;
                mojMaster.prikaziPoruku(ex.Message, "error");
            }
        }

        protected void ProveraListe_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value != "0")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void GridViewListaKorisnika_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "DeleteKorisnik")
            {
                string userName = e.CommandArgument.ToString();
                MembershipUser mUser = Membership.GetUser(userName);
                if (mUser != null)
                {
                    try
                    {
                        Membership.DeleteUser(userName);
                        SqlConnection veza = new SqlConnection();
                        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();
                        SqlCommand komanda = new SqlCommand();
                        komanda.Connection = veza;
                        komanda.CommandType = CommandType.StoredProcedure;
                        komanda.CommandText = "DeleteKorisnikDodatno";

                        komanda.Parameters.AddWithValue("@idKorisnik", mUser.ProviderUserKey);
                        
                        komanda.Connection.Open();
                        komanda.ExecuteNonQuery();
                        komanda.Connection.Close();
                        
                        GridViewListaKorisnika.DataBind();
                    }
                    catch (Exception ex)
                    {
                        glavna mojMaster = (glavna)this.Master;
                        mojMaster.prikaziPoruku(ex.Message, "error");
                    }
                }
            }
        }
        [WebMethod]
        public static string korisnikDodatniPodaci(string userId)
        {
            Guid idUser = new Guid(userId);
            KorisnikDodatno korisnik=new KorisnikDodatno();
            korisnik.ID = idUser;
            korisnik.getData();
            JavaScriptSerializer jsSerijalizacija = new JavaScriptSerializer();
            return jsSerijalizacija.Serialize(korisnik);
        }
    }
}