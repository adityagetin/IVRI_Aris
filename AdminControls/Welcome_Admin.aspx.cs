using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class Welcome_Admin : System.Web.UI.Page
    {
        public string FName = String.Empty;
        public int UID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            FName = Session["Name"].ToString();
            UID = Convert.ToInt32(Session["ID"]);

            if (!IsPostBack)
            {
                Label label = this.FindControl("Name") as Label;
                if (FName == null)
                {
                    label.Text = FName;
                }
                

            }

        }


    }
}