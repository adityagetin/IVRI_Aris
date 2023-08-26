using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class Review : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ProposalID.Text = Session["Pid"].ToString();
        }


        private string SaveAttachment(FileUpload fileUpload)
        {
            string attachmentFileName = Path.GetFileName(fileUpload.FileName);
            string attachmentFilePath = Server.MapPath(attachmentFileName);

            //fileUpload.SaveAs(attachmentFilePath);

            return attachmentFilePath;
        }

        protected void ScheduleReview_Click(object sender, EventArgs e)
        {
            string pid = ProposalID.Text;
            string date = Mdate.Text;
            string Action = ReviewAction.Text;
            string Comm = Comment.Text;
            string fileName = pid + ".pdf";
            string fileData="";

            if (fileUpload.HasFile)
            {

                fileData = SaveAttachment(fileUpload);
            }

            string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                    try
                    {
                        string insertQuery = "INSERT INTO PropReviewComm ([ProposalID],[ReviewMeetingDt],[ReviewAction],[ReviewComment],[FileName],[ProceedingAttachment]) " +
                                             "VALUES (@ProposalID, @ReviewMeetingDt, @ReviewAction, @ReviewComent, @FileName, @ProceedingAttachment)";

                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@ProposalID", pid);
                            command.Parameters.AddWithValue("@ReviewMeetingDt", date);
                            command.Parameters.AddWithValue("@ReviewAction", Action);
                            command.Parameters.AddWithValue("@ReviewComent", Comm);
                            command.Parameters.AddWithValue("@FileName", fileName);
                            command.Parameters.AddWithValue("@ProceedingAttachment",fileData);

                            command.ExecuteNonQuery();
                        }

                        string ProjProposalQuery = "UPDATE [ProjProposal] SET [PropPresentStatus] = @Status WHERE [ProposalID] = @ID";
                        using (SqlCommand command2 = new SqlCommand(ProjProposalQuery, connection))
                        {
                            command2.Parameters.AddWithValue("@Status", "UNDER REVIEW");
                            command2.Parameters.AddWithValue("@ID", pid);
                            command2.ExecuteNonQuery();
                        }

                        string ProjProposalSubmissionQuery = "UPDATE [ProjProposalSubmission] SET [SubmissionStatus] = @Status WHERE [ProposalID] = @ID";
                        using (SqlCommand command3 = new SqlCommand(ProjProposalSubmissionQuery, connection))
                        {
                            command3.Parameters.AddWithValue("@Status", "UNDER REVIEW");
                            command3.Parameters.AddWithValue("@ID", pid);
                            command3.ExecuteNonQuery();
                        }

                        string GetSubmissonIDQuery = "SELECT [SubmissionID] FROM [ProjProposalSubmission] WHERE [ProposalID] = @ID";


                        string Sid;
                        using (SqlCommand command4 = new SqlCommand(GetSubmissonIDQuery, connection))
                        {
                            command4.Parameters.AddWithValue("@ID", pid);
                            SqlDataReader reader = command4.ExecuteReader();
                            if (reader.Read())
                            {
                                Sid = reader.GetInt32(0).ToString();
                            }
                            else
                            {
                                reader.Close();
                                ErrorLabel.Text = "Error: Submission ID not found.";
                                return;
                            }
                            reader.Close();
                        }

                    string ProjProposalApprovalQuery = "UPDATE [ProjProposalApprovalProcess] SET [SubmissionStatus] = @Status WHERE [SubmissionID] = @Sid";
                    using (SqlCommand cmd = new SqlCommand(ProjProposalApprovalQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@Status", "UNDER REVIEW");
                            cmd.Parameters.AddWithValue("@Sid", Sid);
                            cmd.ExecuteNonQuery();
                        }
                        SuccessLabel.Text = "Review Meeting is scheduled on " + date;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                        ErrorLabel.Text = "Error: " + ex.Message;
                    }
                
            }
        }
    }
}
