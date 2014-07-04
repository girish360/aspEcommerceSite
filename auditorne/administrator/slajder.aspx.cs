using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace auditorne.administrator
{
    public partial class slajder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {

                FileUpload1.SaveAs(MapPath("~/uploads/images/" + FileUpload1.FileName));
                
                

                SqlConnection konekcija = new SqlConnection();
                konekcija.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();
                SqlCommand komanda = new SqlCommand();
                komanda.CommandType = CommandType.Text;
                komanda.CommandText = "INSERT INTO SlajderSlike (Naziv,Putanja) Values(@Naziv,@Putanja)";
                komanda.Parameters.AddWithValue("Naziv", TextBox1.Text);
                komanda.Parameters.AddWithValue("Putanja","/uploads/images/" + FileUpload1.FileName);
                
                komanda.Connection = konekcija;
                konekcija.Open();
                komanda.ExecuteNonQuery();
                konekcija.Close();
                
            }
        }
    }
}