using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class Table : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        int scientistID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProposalData();
            }
        }


        protected void BindProposalData()
        {
            string ID = Session["ID"].ToString();


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM ProjProposal  WHERE ScientID = @Sid";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Sid", ID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                rptProposals.DataSource = dataTable;
                rptProposals.DataBind();
            }
        }

        protected void rptProposals_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView proposalData = (DataRowView)e.Item.DataItem;
                Label lblPresentStatus = (Label)e.Item.FindControl("lblPresentStatus");
                if (lblPresentStatus == null)
                {
                    return;
                }
                string presentStatus = proposalData["PropPresentStatus"].ToString();
                lblPresentStatus.Text = presentStatus;
            }
        }





    }
}
