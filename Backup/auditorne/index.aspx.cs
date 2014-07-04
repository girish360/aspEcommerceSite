using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace auditorne
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
            HtmlGenericControl divMessage=(HtmlGenericControl)this.Master.FindControl("appMessage");
            divMessage.InnerHtml = "Ovo je neka poruka";
            divMessage.Attributes.Add("class", "error");

            linkNaslov.InnerText = "Početna strana";
            datum.InnerText = DateTime.Now.ToString("d.M.yyyy");

            HtmlGenericControl ul = new HtmlGenericControl("ul");
            List<string> kategorije = new List<string>();
            kategorije.Add("<a href='blog.aspx?kid=1'>Kategorija 1</a>");
            kategorije.Add("<a href='blog.aspx?kid=2'>Kategorija 2</a>");
            kategorije.Add("<a href='blog.aspx?kid=3'>Kategorija 3</a>");
            kategorije.Add("<a href='blog.aspx?kid=4'>Kategorija 4</a>");
            foreach (string kategorija in kategorije)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.InnerHtml = kategorija;
                ul.Controls.Add(li);
            }
            listaKategorija.Controls.Add(ul);

            if (Request.Cookies["Auditorne3"] == null)
            {
                this.makeCookie();
            }

            if (this.Session["imena"] == null && Session["mojDatum"] == null)
            {
                this.makeSession();
            }

        }

        protected void makeCookie()
        {
            HttpCookie cookie = new HttpCookie("Auditorne3");
            cookie["ime"] = "Marko";
            cookie["prezime"] = "Spasojevic";
            cookie.Expires = DateTime.Now.AddMinutes(30);
            //cookie.Domain = "localhost";
            Response.Cookies.Add(cookie);
        }

        protected void makeSession()
        {
            Session["mojDatum"] = DateTime.Now;
            Session["imena"] = new List<string>() { "Marko","Milos","Nenad" };
        }

        
    }
}