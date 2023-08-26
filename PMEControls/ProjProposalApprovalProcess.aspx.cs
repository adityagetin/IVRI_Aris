using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using Project_Aris.DivisionControls;

namespace Project_Aris
{
    public partial class ProjProposalApprovalProcess : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        int UserId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserId = Convert.ToInt32(Session["ID"]);


                BindSubmissionData();
            }
        }


        protected void BindSubmissionData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT pp.[ProposalID],pp.[PropTitle] AS 'ProjectTitle',pp.[PropUnderDomain] AS 'ProjectDomain',pp.[ScientID] AS 'ScientistID',pp.[PropFundEstimate] AS 'FundEstimated',pps.[SubmissionDate],pps.[SupervisorID],pps.[SubmissionStatus],di.[Division]FROM [ProjProposal] AS pp JOIN [ProjProposalSubmission] AS pps ON pp.[ProposalID] = pps.[ProposalID] JOIN [DivisionID] AS di ON pp.[DivID] = di.[ID] Where pps.[SubmissionStatus] IN ('UNDER REVIEW', 'Forward to PME');";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                rptSubmissions.DataSource = dataTable;
                rptSubmissions.DataBind();
            }
        }
        protected void rptSubmissions_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string SubmissionId = e.CommandArgument.ToString();
            if (e.CommandName == "AcceptSubmission")
            {
                Accept(SubmissionId);
            }
            else
            {
                if (e.CommandName == "RejectSubmission")
                {
                    Reject(SubmissionId);
                }
            }

        }
        public void Accept(string SubmissionID)
        {
            Response.Redirect("Accept.aspx?Sid=" + SubmissionID);

        }
        public void Reject(string SubmissionID)
        {
            string messagemain = "SubmissionId" + SubmissionID + "is Rejecting";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", $"alert('{messagemain}');", true);

            string sid = SubmissionID;
            try {
                string PoposalId = GetProposalID(sid);
                UpdateProjProposal(PoposalId);
                UpdateProjProposalApprovalProcess(SubmissionID);
                UpdateProjProposalSubmission(SubmissionID);

                string message ="SubmissionId"+SubmissionID+ "And ProposalId" + PoposalId+"Is rejected:"+UserId+"";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", $"alert('{message}');", true);
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", $"alert('{message}');", true);
            }

            BindSubmissionData();


        }

        public void UpdateProjProposalSubmission(string SunmissionID)
        {
            string Submission = SunmissionID;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE ProjProposalSubmission SET SubmissionStatus=@NewStatus WHERE SubmissionId = @SUbmissionId";
                SqlCommand command = new SqlCommand(query, connection);
                string status = "Rejected by:" + UserId + "";
                command.Parameters.AddWithValue("@NewStatus", status);
                command.Parameters.AddWithValue("@SUbmissionId", Submission);
                connection.Open();
                command.ExecuteNonQuery();

            }
        }
        public void UpdateProjProposal(string ProposalID)
        {
            string proposal = ProposalID;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE ProjProposal SET PropPresentStatus = @NewStatus WHERE ProposalId = @ProposalId";
                SqlCommand command = new SqlCommand(query, connection);
                string status = "Rejected by:" + UserId + "";
                command.Parameters.AddWithValue("@NewStatus", status);
                command.Parameters.AddWithValue("@ProposalId", proposal);
                connection.Open();
                command.ExecuteNonQuery();

            }
        }
        public void UpdateProjProposalApprovalProcess(string SubmissionId)
        {
            string Submission = SubmissionId;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE ProjProposalApprovalProcess SET SubmissionStatus=@NewStatus WHERE SubmissionId = @SUbmissionId";
                SqlCommand command = new SqlCommand(query, connection);
                string status = "Rejected by:" + UserId + "";
                command.Parameters.AddWithValue("@NewStatus", status);
                command.Parameters.AddWithValue("@SUbmissionId", Submission);
                connection.Open();
                command.ExecuteNonQuery();

            }
        }

        public string GetProposalID(string SunmissionID) {
            string Sunmission = SunmissionID;
            string ProposalID=null;
            string query = "SELECT ProposalId FROM PropProposalSubmission WHERE SubmissionId = @SubmissionId";
            try
            {
                using (SqlConnection connection = new SqlConnection())
                {

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@SubmissionId", Sunmission);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            ProposalID = reader.GetString(0).ToString();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

            }
            return ProposalID;
        }
    }
}