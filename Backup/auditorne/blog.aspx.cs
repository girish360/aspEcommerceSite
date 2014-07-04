using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace auditorne
{
    public partial class blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
            Dictionary<string, int> postovi = new Dictionary<string, int>();
            postovi.Add("Post 1", 1);
            postovi.Add("Post 2", 1);
            postovi.Add("Post 3", 2);
            postovi.Add("Post 4", 2);
            postovi.Add("Post 5", 3);
            postovi.Add("Post 6", 3);
            postovi.Add("Post 7", 4);
            postovi.Add("Post 8", 4);

            if (this.Request.QueryString["kid"] != null)
            {
                int kid = Int32.Parse(this.Request.QueryString["kid"].ToString());
                var rezultat = postovi.Where(p=>p.Value==kid);

                this.ZaglavljeTabele();
                this.PopuniTabelu(rezultat);

            }
        }

        private void ZaglavljeTabele()
        {
            string[] zaglavlje = {"Redni broj","Naslov"};
            HtmlTableRow red = new HtmlTableRow();
            foreach (string imeKolone in zaglavlje)
            {
                HtmlTableCell celija = new HtmlTableCell();
                celija.InnerText = imeKolone;
                red.Controls.Add(celija);
            }

            postList.Controls.Add(red);
        }

        private void PopuniTabelu(IEnumerable<KeyValuePair<string, int>> podaci)
        {
            int redniBroj = 0;
            foreach (var podatak in podaci)
            {
                redniBroj++;
                HtmlTableRow red = new HtmlTableRow();
                HtmlTableCell celija1 = new HtmlTableCell();
                celija1.InnerText = redniBroj.ToString();
                red.Controls.Add(celija1);

                HtmlTableCell celija2 = new HtmlTableCell();
                celija2.InnerText = podatak.Key;
                red.Controls.Add(celija2);

                postList.Controls.Add(red);
            }
        }
    }
}