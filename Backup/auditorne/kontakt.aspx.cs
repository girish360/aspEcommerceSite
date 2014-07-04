using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace auditorne
{
    public partial class kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
            if (!this.IsPostBack)
            {
                Dictionary<int, string> osobe = new Dictionary<int, string>();
                osobe.Add(0, "Izaberi...");
                osobe.Add(1, "Administrator");
                osobe.Add(2, "Moderator");

                DropDownListOsoba.DataSource = osobe;
                DropDownListOsoba.DataTextField = "Value";
                DropDownListOsoba.DataValueField = "Key";
                DropDownListOsoba.DataBind();
            }
        }

        protected void ButtonPosalji_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string imePrezime = TextBoxImePrezime.Text;
                string email = TextBoxEmail.Text;
                string osoba = DropDownListOsoba.SelectedValue;
                string poruka = TextBoxPoruka.Text;
                bool kopija = CheckBoxKopija.Checked;

                BulletedList podaci = new BulletedList();
                podaci.Items.Add(new ListItem(imePrezime));
                podaci.Items.Add(new ListItem(email));
                podaci.Items.Add(new ListItem(osoba));
                podaci.Items.Add(new ListItem(poruka));
                podaci.Items.Add(new ListItem(kopija.ToString()));

                podaciForma.Controls.Add(podaci);
                podaciForma.Attributes["class"] = "post";
            }
        }

        protected void CustomValidatorOsoba_ServerValidate(object source, ServerValidateEventArgs args)
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

        protected void CustomValidatorTextBoxPoruka_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 10)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}