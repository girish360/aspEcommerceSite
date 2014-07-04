using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace auditorne
{
    public partial class glavna : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime trenutnoVreme = DateTime.Now;
            LabelDatumVreme.Text = String.Format("Datum je: {0}, Vreme je: {1} ", trenutnoVreme.ToString("dd.MM.yyyy"), trenutnoVreme.ToString("H:mm"));
            switch (trenutnoVreme.DayOfWeek)
            {
                case DayOfWeek.Saturday:
                case DayOfWeek.Sunday:
                    LabelDatumVreme.Style["color"] = "#FF0000";
                    break;
                default:
                    LabelDatumVreme.Style["color"] = "#CCC";
                    break;
            }

            BulletedList lista = new BulletedList();
            Page currentPage = HttpContext.Current.Handler as Page;
            if (currentPage.GetType().BaseType != typeof(index))
            {
                if (Request.Cookies["Auditorne3"] != null)
                {
                    HttpCookie cookie = Request.Cookies["Auditorne3"];
                    lista.Items.Add(new ListItem("Podaci iz kolacica"));
                    lista.Items.Add(new ListItem("Ime: "+cookie["ime"]));
                    lista.Items.Add(new ListItem("Prezime: " + cookie["prezime"]));
                    lista.Items.Add(new ListItem("Vreme isticanja: "+cookie.Expires.ToString("dd.MM.yyyy H:mm")));
                    LinkButton brisiKolacic = new LinkButton();
                    brisiKolacic.ID = "LinkButtonBrisiKolacic";
                    brisiKolacic.Text = "Obrisi kolacic";
                    brisiKolacic.CommandArgument = "kolacic";
                    brisiKolacic.CommandName = "delete";
                    brisiKolacic.Command += new CommandEventHandler(LinkButton_Command);
                    brisiKolacic.PostBackUrl = currentPage.Request.FilePath;
                    levaStrana.Controls.Add(brisiKolacic);
                }
                if (this.Session["imena"] != null && Session["mojDatum"] != null)
                {
                    lista.Items.Add(new ListItem("Podaci iz sesije"));
                    lista.Items.Add(new ListItem("Session ID " + Session.SessionID));
                    List<string> imena=(List<string>)Session["imena"];
                    foreach (string ime in imena)
                    {
                        lista.Items.Add(new ListItem(ime));
                    }
                    DateTime datum = (DateTime)Session["mojDatum"];
                    lista.Items.Add(new ListItem(datum.ToString("dd.MM.yyyy, H:mm")));

                    LinkButton brisiSesiju = new LinkButton();
                    brisiSesiju.ID = "LinkButtonBrisiSesiju";
                    brisiSesiju.Text = "Obrisi sesiju";
                    brisiSesiju.CommandArgument = "sesija";
                    brisiSesiju.CommandName = "delete";
                    brisiSesiju.Command += new CommandEventHandler(LinkButton_Command);
                    brisiSesiju.PostBackUrl = currentPage.Request.FilePath;
                    levaStrana.Controls.Add(brisiSesiju);
                }

                levaStrana.Controls.Add(lista);
            }
        }

        protected void LinkButton_Command(object sender, CommandEventArgs e)
        {
            string argument = e.CommandArgument.ToString();
            string komanda = e.CommandName;
            switch (argument)
            {
                case "sesija":
                    Session.Abandon();
                    break;
                case "kolacic":
                    HttpCookie cookie = Request.Cookies["Auditorne3"];
                    if (cookie != null)
                    {
                        cookie.Expires = DateTime.Now.AddSeconds(-30);
                    }
                    Response.Cookies.Add(cookie);
                    break;
            }
        }

        public void prikaziPoruku(string poruka, string cssKlasa)
        {
            appMessage.InnerHtml = poruka;
            appMessage.Attributes.Add("class", cssKlasa);
        }

        protected void LoginStatus_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }
    }
}