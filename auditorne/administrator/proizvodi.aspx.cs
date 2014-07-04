using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspsajt.Administrator
{
    public partial class proizvodi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            TextBox TextBoxNaziv = (TextBox)this.DetailsViewProizvodi.FindControl("TextBoxNaziv");
            e.Command.Parameters["@Naziv"].Value = TextBoxNaziv.Text;

            DropDownList DropDownListKategorija = (DropDownList)this.DetailsViewProizvodi.FindControl("DropDownListKategorija");
            e.Command.Parameters["@IdKategorija"].Value = Int32.Parse(DropDownListKategorija.SelectedValue);

            DropDownList DropDownListBrend = (DropDownList)this.DetailsViewProizvodi.FindControl("DropDownListBrend");
            e.Command.Parameters["@IdBrend"].Value = Int32.Parse(DropDownListBrend.SelectedValue);

            TextBox TextBoxOpis = (TextBox)this.DetailsViewProizvodi.FindControl("TextBoxOpis");
            e.Command.Parameters["@Opis"].Value = TextBoxOpis.Text;

            TextBox TextBoxCena = (TextBox)this.DetailsViewProizvodi.FindControl("TextBoxCena");
            e.Command.Parameters["@Cena"].Value = Int32.Parse(TextBoxCena.Text);

            DateTime DatumDodavanja = DateTime.Now;
            DateTime DatumIzmene = DatumDodavanja;
            e.Command.Parameters["@DatumDodavanja"].Value = DatumDodavanja;
            e.Command.Parameters["@DatumIzmene"].Value = DatumIzmene;
        }
    }
}