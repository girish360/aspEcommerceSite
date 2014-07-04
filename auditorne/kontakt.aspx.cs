using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace aspsajt
{
    public partial class Kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj shop";
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 20)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void ButtonKontaktObrisi_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/kontakt.aspx");
        }

        protected void ButtonKontaktPosalji_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string imePrezime = TextBoxImePrezime.Text;
                string tema = TextBoxTema.Text;
                string email = TextBoxEmail.Text;
                string razlog = DropDownListRazlog.SelectedValue;
                string poruka = TextBoxPoruka.Text;
                string posaljiKopiju = DropDownListPosaljiKopiju.SelectedValue;

                if (posaljiKopiju == "Da")
                {
                    MailMessage mail = new MailMessage();

                    mail.From = new MailAddress(email, "Poslato od:" + email);
                    mail.To.Add(new MailAddress("filip.pecic.83.11@ict.edu.rs", "Poslato je na mail:" + "filip.pecic.83.11@ict.edu.rs"));
                    mail.Subject = tema;
                    mail.Body = "<html> <body>  Ime i prezime: "+imePrezime +"  <br />  Tema: " + tema + " <br /> Razlog: " + razlog + " <br/ > Poruka:" + poruka + " </body></html>";
                    mail.IsBodyHtml = true;

                    mail.Priority = MailPriority.High;

                    SmtpClient klijent = new SmtpClient("mail.vragolan.com", 25);
                    klijent.EnableSsl = false;
                    klijent.DeliveryMethod = SmtpDeliveryMethod.Network;
                    klijent.UseDefaultCredentials = false;
                    klijent.Credentials = new System.Net.NetworkCredential("aspnetsajt@vragolan.com", "lozinka");
                    klijent.Send(mail);
                }
                
                
                HtmlGenericControl obavestenje = (HtmlGenericControl)this.Master.FindControl("poruka");
                obavestenje.InnerHtml = "Poruka je uspesno poslata";
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
    }
}