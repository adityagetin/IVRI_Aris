using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris.OnlyScientistControls
{
    public partial class ScvientistHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
                {
                    name.Text = Session["Name"].ToString();
                    divname.Text = Session["DivName"].ToString();
                }
        }


        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    
}
}