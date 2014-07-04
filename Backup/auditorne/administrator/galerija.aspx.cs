using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace auditorne.administrator
{
    public partial class galerija : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";
        }

        protected void DetailsViewGalerija_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            glavna mojMaster = (glavna)this.Master;
            if (e.Exception != null)
            {
                mojMaster.prikaziPoruku(e.Exception.Message, "error");
            }
            else
            {
                mojMaster.prikaziPoruku("Galerija je uneta u bazu podataka ", "info");
            }
        }

        protected void GridViewGalerije_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            glavna mojMaster = (glavna)this.Master;
            if (e.Exception != null)
            {
                mojMaster.prikaziPoruku(e.Exception.Message, "error");
            }
            else
            {
                mojMaster.prikaziPoruku(String.Format("Uspesno ste azurilari {0} podatak", e.AffectedRows), "info");
            }
        }

        protected void GridViewGalerije_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            glavna mojMaster = (glavna)this.Master;
            if (e.Exception != null)
            {
                mojMaster.prikaziPoruku(e.Exception.Message, "error");
            }
            else
            {
                mojMaster.prikaziPoruku(String.Format("Uspesno ste obrisali {0} podatak", e.AffectedRows), "info");
            }
        }
    }
}