using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace auditorne
{
    public partial class slike : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " | Moj portal";

            if (!this.IsPostBack)
            {
                MultiViewGalerije.ActiveViewIndex = 0;
            }
        }

        protected void PrethodnaSlika(object sender, EventArgs e)
        {
            if (MultiViewGalerije.ActiveViewIndex < 0)
            {
                MultiViewGalerije.ActiveViewIndex = 0;
            }
            else
            {
                MultiViewGalerije.ActiveViewIndex -= 1;
            }
        }

        protected void SledecaSlika(object sender, EventArgs e)
        {
            MultiViewGalerije.ActiveViewIndex += 1;
        }
    }
}