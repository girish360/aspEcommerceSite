using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using auditorne.code;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
namespace auditorne
{
    /// <summary>
    /// Summary description for MojWebServis
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class MojWebServis : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public bool izmenaPodataka(KorisnikDodatno korisnik)
        {
            try
            {
                korisnik.updateData();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
        [WebMethod]
        public int brojSlikaUGaleriji(int idGalerije)
        {
            SqlConnection veza = new SqlConnection();
            veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = veza;
            komanda.CommandType = CommandType.Text;
            komanda.CommandText = "SELECT COUNT(*) AS Broj FROM Slika WHERE idGalerija=@idGalerija";
            komanda.Parameters.AddWithValue("@idGalerija", idGalerije);
            komanda.Connection.Open();
            SqlDataReader reader = komanda.ExecuteReader();
            int broj = 0;
            while(reader.Read())
            {
                broj = Int32.Parse(reader["Broj"].ToString());
            }
            return broj;

        }
    }
}
