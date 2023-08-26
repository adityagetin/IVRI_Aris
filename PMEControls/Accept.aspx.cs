using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class Accept : System.Web.UI.Page
    {

        protected int ProposalID = 0;
        protected string propTitle = string.Empty;
        protected string propAttachment = null;
        protected decimal fund = 0;
        protected string date= string.Empty;


        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {   

            string Submission = Request.QueryString["Sid"].ToString();
            ProposalID = Convert.ToInt32(Submission);
            Console.WriteLine(Submission);
            GetData(ProposalID);
            txtProposalID.Text = ProposalID.ToString();
            txtProjTitle.Text = propTitle;
            txtStartDate.Text = date;
            txtApprovedBudget.Text = fund.ToString();
            txtApprovedTerm.Attributes["placeholder"] = "Comment The Approval Terms here";


        }



        public void GetData(int ProposalID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create the SQL command with parameters
                string sql = "SELECT PropTitle, PropAttachment, [PropFundEstimate],[PropSubDate] FROM ProjProposal WHERE ProposalID = @ProposalID";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@ProposalID", ProposalID);

                // Execute the query and read the results
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    // Retrieve the values from the reader
                    propTitle = reader.GetString(0);
                    propAttachment = reader.GetString(1);
                    fund = reader.GetDecimal(2);
                    date = reader.GetString(3);
                    
                }

                reader.Close();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve form field values
            int proposalID = Convert.ToInt32(txtProposalID.Text);
            string projTitle = txtProjTitle.Text;
            string approvedTerm = txtApprovedTerm.Text;
            string startDate = txtStartDate.Text;
            DateTime completionDate = Convert.ToDateTime(txtCompletionDate.Text);
            decimal approvedBudget = Convert.ToDecimal(txtApprovedBudget.Text);

            // Read the file data for Approval Letter
            HttpPostedFile approvalLetterFile = fileApprovalLetter.PostedFile;
            byte[] approvalLetterData = null;
            if (approvalLetterFile != null && approvalLetterFile.ContentLength > 0)
            {
                using (var binaryReader = new BinaryReader(approvalLetterFile.InputStream))
                {
                    approvalLetterData = binaryReader.ReadBytes(approvalLetterFile.ContentLength);
                }
            }

            // Read the file data for Approved Proposal Attachment
            string approvedProposalAttchFile = propAttachment;
            



            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Define SQL query with parameterized values
                string query = @"INSERT INTO ApprovedProject (ProposalID, ProjTitle, ApprovedTerm, StartDate, CompletionDate, ApprovedBudget, ApprovalLetter, ApprovedProposalAttch)
                         VALUES (@ProposalID, @ProjTitle, @ApprovedTerm, @StartDate, @CompletionDate, @ApprovedBudget, @ApprovalLetter, @ApprovedProposalAttch)";

                // Create command and parameters
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProposalID", proposalID);
                    command.Parameters.AddWithValue("@ProjTitle", projTitle);
                    command.Parameters.AddWithValue("@ApprovedTerm", approvedTerm);
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@CompletionDate", completionDate);
                    command.Parameters.AddWithValue("@ApprovedBudget", approvedBudget);
                    command.Parameters.AddWithValue("@ApprovalLetter", approvalLetterData);
                    command.Parameters.AddWithValue("@ApprovedProposalAttch", approvedProposalAttchFile);

                    // Execute the query
                    command.ExecuteNonQuery();
                }
            }

        }
    }
}