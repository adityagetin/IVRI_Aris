using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography.X509Certificates;

namespace Project_Aris
{
    public partial class ProjProposal : System.Web.UI.Page
    {
        int SID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SID= Convert.ToInt32(Session["ID"]);
            if (!IsPostBack)
            {
                BindProposalData();
            }
        }
        protected void BindProposalData()
        {
            
            
            string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT p.* FROM ProjProposal p INNER JOIN ProjProposalApprovalProcess app ON p.ProposalID = app.SubmissionID;";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                rptProposals.DataSource = dataTable;
                rptProposals.DataBind();
            }
        }

        protected void rptProposals_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Review") 
            {
                string values = e.CommandArgument.ToString();
                Session["Pid"] = values;
                Response.Redirect("Review.aspx");
            }

        }



    }
}