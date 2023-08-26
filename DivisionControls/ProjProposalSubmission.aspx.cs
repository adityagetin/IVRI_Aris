using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris.DivisionControls
{
    public partial class ProjProposalSubmission : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProposalData();
            }
        }

        protected void BindProposalData()
        {
            Console.WriteLine("binding proposal");
            string ID = Session["ID"].ToString();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM [ProjProposal]  WHERE [SupervisoerID] = @Sid";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Sid", ID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                rptProposals.DataSource = dataTable;
                rptProposals.DataBind();
            }
        }

        protected void rptSubmissions_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Console.WriteLine("button clicked");
            if (e.CommandName == "UpdateSubmission")
            {
                string[] values = e.CommandArgument.ToString().Split(',');
                DropDownList ddlStatus = (DropDownList)e.Item.FindControl("DropDownList1");
                string newStatus = ddlStatus.SelectedValue;
                string proposalID = values[0];
                string submissionID = values[0];
                string scientID = values[1];
                string supervisorID = values[2];
                string submissionDate = values[3];

                try 
                {
                    if (newStatus == "Approved")
                    {
                        Session["Pid"] = proposalID;

                        InsertSubmission(proposalID, scientID, supervisorID);
                        Console.WriteLine("hello1");

                        UpdateSubmissionStatus(submissionID, newStatus);

                        UpdateProjProposal(proposalID, newStatus);

                        InsertIntoProjProposalApprovalProcess(submissionID, supervisorID, newStatus, submissionDate, newStatus);

                        Response.Redirect("Farward.aspx");
                    }

                    
                }
                catch(Exception ex) 
                {
                    string error = ex.Message;
                    Console.WriteLine(error);
                }
                finally 
                {
                    UpdateStatus(proposalID, newStatus);
                }
                BindProposalData();
            }
        }

        protected void UpdateStatus(string proposalID, string newStatus)
        {
            Console.WriteLine("update called");
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE [ProjProposal] SET [PropPresentStatus] = @SubmissionStatus WHERE [ProposalID] = @ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Connection.Open();
                    command.Parameters.AddWithValue("@SubmissionStatus", newStatus);
                    command.Parameters.AddWithValue("@ID", proposalID);
                    command.ExecuteNonQuery();
                    command.Connection.Close();
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                Console.WriteLine( error);
            }
        }

        protected void InsertSubmission(string proposalID, string scientID, string supervioserID)
        {
            try
            {
                string status = "Approved_by_the_" + supervioserID;
                string date = DateTime.Now.ToString();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [ProjProposalSubmission] ([SubmissionID],[ProposalID],[ScientID],[SupervisorID]," +
                        "[SubmissionStatus],[SubmissionDate],[Comment]) " +
                        "VALUES (@SubmissionID,@ProposalID,@ScientID,@SupervisorID,@SubmissionStatus,@SubmissionDate,@Comment)";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Connection.Open();
                    cmd.Parameters.AddWithValue("@SubmissionID", proposalID);
                    cmd.Parameters.AddWithValue("@ProposalID", proposalID);
                    cmd.Parameters.AddWithValue("@ScientID", scientID);
                    cmd.Parameters.AddWithValue("@SupervisorID", supervioserID);
                    cmd.Parameters.AddWithValue("@SubmissionStatus", status);
                    cmd.Parameters.AddWithValue("@SubmissionDate", date);
                    cmd.Parameters.AddWithValue("@Comment", status);
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                Console.WriteLine("eRROR2 : " + error);
            }
        }
        protected void UpdateProjProposal(string PID, string Status)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE [ProjProposal] SET [PropPresentStatus] = @Status WHERE [ProposalID] = @ID";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Status", Status);
                    command.Parameters.AddWithValue("@ID", PID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                string error = ex.Data.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlert", $"alert('{error}');", true);
                Thread.Sleep(10000);
                Response.Redirect("Default.aspx");
            }

        }
        protected void UpdateSubmissionStatus(string submissionID, string newStatus)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE ProjProposalSubmission SET SubmissionStatus = @SubmissionStatus WHERE SubmissionID = @SubmissionID";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@SubmissionStatus", newStatus);
                    command.Parameters.AddWithValue("@SubmissionID", submissionID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                string error = ex.Data.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlert", $"alert('{error}');", true);
                Thread.Sleep(10000);
                Response.Redirect("Default.aspx");
            }
        }
        protected void InsertIntoProjProposalApprovalProcess(string submissionID, string supervisorID, string newStatus, string submissionDate, string comment)
        {

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO ProjProposalApprovalProcess (SubmissionID, SupervisorID, SubmissionStatus, SubmissionDate, Comment)VALUES (@SubmissionID, @SupervisorID, @SubmissionStatus, @SubmissionDate, @Comment);";
                    SqlCommand command = new SqlCommand(query, connection);
                    int sID = int.Parse(submissionID);
                    command.Parameters.AddWithValue("@SubmissionID", sID);
                    int SuID = int.Parse(supervisorID);
                    command.Parameters.AddWithValue("@SupervisorID", SuID);
                    command.Parameters.AddWithValue("@SubmissionStatus", newStatus);
                    string dateString = submissionDate;
                    DateTime convertedDate;

                    if (DateTime.TryParseExact(dateString, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out convertedDate))
                    {
                    }
                    else
                    {
                        convertedDate = DateTime.Now;
                    }
                    command.Parameters.AddWithValue("@SubmissionDate", convertedDate);
                    command.Parameters.AddWithValue("@Comment", comment);
                    connection.Open();
                    command.ExecuteNonQuery();
                }


            }
            catch (Exception ex)
            {
                string error = ex.Data.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlert", $"alert('{error}');", true);
                Thread.Sleep(10000);
                Response.Redirect("Default.aspx");


            }


        }

    }
}