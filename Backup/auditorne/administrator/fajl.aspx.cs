using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace auditorne.adminstrator
{
    public partial class fajl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
            if (!this.IsPostBack)
            {
                fajl.popuniListuTezina(DropDownListTezina);
            }
        }

        public static void popuniListuTezina(DropDownList lista)
        {
            int startValue = -50;
            int endValue = 50;

            for (int i = startValue; i <= endValue; i++)
            {
                ListItem item = new ListItem(i.ToString(), i.ToString());
                item.Selected = i == 0 ? true : false;
                lista.Items.Add(item);
            }
        }

        protected void ButtonUnosFajla_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string direktorijum = Server.MapPath("~/fajlovi/");
                if (FileUploadFajl.HasFile)
                {
                    string naziv = TextBoxNaziv.Text;
                    bool objavljen = CheckBoxPublikovan.Checked;
                    bool aktuelno = CheckBoxAktuelno.Checked;
                    int tezina = Int32.Parse(DropDownListTezina.SelectedValue);
                    string novoIme = string.Format("{0}_{1}", DateTime.Now.ToString("ddMMyyyyHmm"), FileUploadFajl.PostedFile.FileName);
                    string tip = FileUploadFajl.PostedFile.ContentType;
                    int velicina = FileUploadFajl.PostedFile.ContentLength;
                    DateTime datumPostavljanja = DateTime.Now;
                    try
                    {
                        FileUploadFajl.SaveAs(direktorijum + novoIme);
                        SqlConnection veza = new SqlConnection();
                        veza.ConnectionString = WebConfigurationManager.ConnectionStrings["VezaSaBazom"].ToString();

                        SqlCommand komanda = new SqlCommand();
                        komanda.CommandType = CommandType.Text;
                        komanda.CommandText = "INSERT INTO dbo.Fajl(naziv,putanja,tip,publikovan,tezina,aktuelno,datumPostavljanja,velicina) VALUES(@naziv,@putanja,@tip,@publikovan,@tezina,@aktuelno,@datumPostavljanja,@velicina)";

                        komanda.Connection = veza;
                        komanda.Parameters.AddWithValue("@naziv", naziv);
                        komanda.Parameters.AddWithValue("@putanja",novoIme);
                        komanda.Parameters.AddWithValue("@tip", tip);
                        komanda.Parameters.AddWithValue("@publikovan", objavljen);
                        komanda.Parameters.AddWithValue("@tezina", tezina);
                        komanda.Parameters.AddWithValue("@aktuelno", aktuelno);
                        komanda.Parameters.AddWithValue("@datumPostavljanja", datumPostavljanja);
                        komanda.Parameters.AddWithValue("@velicina", velicina);

                        veza.Open();
                        int brojRedova = komanda.ExecuteNonQuery();
                        veza.Close();
                        HtmlGenericControl divMessage = (HtmlGenericControl)this.Master.FindControl("appMessage");
                        divMessage.InnerHtml = "Fajl je prebacen i podaci su uneti u bazu podataka !!!";
                        divMessage.Attributes.Add("class", "info");
                    }
                    catch (Exception ex)
                    {
                        HtmlGenericControl divMessage = (HtmlGenericControl)this.Master.FindControl("appMessage");
                        divMessage.InnerHtml = ex.Message;
                        divMessage.Attributes.Add("class", "error");
                    }
                }
            }
        }

        protected void DropDownListTipoviFajlova_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewPodaciOfajlu.Visible = false;
        }

        protected void GridViewPrikazFajlova_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewPodaciOfajlu.Visible = true;
        }

        protected void DetailsViewPodaciOfajlu_DataBound(object sender, EventArgs e)
        {
            if (this.DetailsViewPodaciOfajlu.CurrentMode == DetailsViewMode.Edit)
            {
                DropDownList ddlTezina = (DropDownList)this.DetailsViewPodaciOfajlu.FindControl("DropDownListDWTezina");
                if (ddlTezina != null)
                {
                    fajl.popuniListuTezina(ddlTezina);//inicajno je selektovana 0
                    ddlTezina.Items.FindByValue("0").Selected = false;
                    DataRowView item = (DataRowView)this.DetailsViewPodaciOfajlu.DataItem;
                    ddlTezina.Items.FindByValue(item.Row.ItemArray[5].ToString()).Selected = true;
                }
            }
        }

        protected void SqlDataSourcePodaciOfajlu_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            if (this.DetailsViewPodaciOfajlu.CurrentMode == DetailsViewMode.Edit)
            {
                DropDownList ddlTezina = (DropDownList)this.DetailsViewPodaciOfajlu.FindControl("DropDownListDWTezina");
                if (ddlTezina != null)
                {
                    e.Command.Parameters["@tezina"].Value = ddlTezina.SelectedValue;
                }
            }
        }

        protected void SqlDataSourcePodaciOfajlu_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            glavna mojMaster = (glavna)this.Master;
            if (e.Exception != null)
            {
                mojMaster.prikaziPoruku(e.Exception.Message, "error");
            }
            else
            {
                mojMaster.prikaziPoruku(string.Format("Uspesno ste azurirali {0} fajl",e.AffectedRows.ToString()),"info");
            }
            GridViewPrikazFajlova.DataBind();
        }

        protected void SqlDataSourcePodaciOfajlu_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridViewPrikazFajlova.DataBind();
        }

        protected void DetailsViewPodaciOfajlu_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            string fajl = e.Values["putanja"].ToString();
            string putanja = Server.MapPath("~/fajlovi/" + fajl);
            FileInfo podaciOfajlu = new FileInfo(putanja);
            if (podaciOfajlu.Exists)
            {
                File.Delete(putanja);
            }
                
        }

        protected void DetailsViewPodaciOfajlu_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            glavna mojMaster = (glavna)this.Master;
            mojMaster.prikaziPoruku("Fajl je obrisan", "info");
            DetailsViewPodaciOfajlu.Visible = false;
        }
    }
}