using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aspsajt.Administrator
{
    public partial class slike : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {

        }

        protected void GridViewProizvodi_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewDodajSlike.Visible = true;
            
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {

            FileUpload FileUploadSlika = (FileUpload)this.DetailsViewDodajSlike.FindControl("FileUploadSlika");
            if (FileUploadSlika.HasFile)
            {
                FileUploadSlika.SaveAs(MapPath("~/uploads/images/" + FileUploadSlika.FileName));
                System.Drawing.Image img1 = System.Drawing.Image.FromFile(MapPath("~/uploads/images/") + FileUploadSlika.FileName);
                System.Drawing.Image bmp1 = img1.GetThumbnailImage(160, 210, null, IntPtr.Zero);
                bmp1.Save(MapPath("~/uploads/images/") + "thumb_" + FileUploadSlika.FileName);
            }

            TextBox TextBoxNaziv = (TextBox)this.DetailsViewDodajSlike.FindControl("TextBoxNaziv");
            e.Command.Parameters["@Naziv"].Value = TextBoxNaziv.Text;

            e.Command.Parameters["@MalaUrl"].Value = "/uploads/images/" + "thumb_" + FileUploadSlika.FileName;
            e.Command.Parameters["@VelikaUrl"].Value = "/uploads/images/" + FileUploadSlika.FileName;

            CheckBox CheckBoxGlavna = (CheckBox)this.DetailsViewDodajSlike.FindControl("CheckBoxGlavna");
            e.Command.Parameters["@Glavna"].Value = CheckBoxGlavna.Checked;
            //HiddenField HiddenFieldIdProizvoda = (HiddenField)this.DetailsViewDodajSlike.FindControl("HiddenFieldIdProizvoda");
            //e.Command.Parameters["@IdProizvoda"].Value = HiddenFieldIdProizvoda.Value;
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridViewPrikazSlika.DataBind();
        }
    }
}