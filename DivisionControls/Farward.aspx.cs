using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Project_Aris.DivisionControls
{
    public partial class Farward : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind_Forward_To();
            }
            ProposalID.Text = Session["Pid"].ToString();
            Forwarder.Text = Session["ID"].ToString();
        }
        private void Bind_Forward_To() {         

            string query = "SELECT CONCAT(Fname,' ',Lname,'-',ScientID) AS ScientistName, ScientID FROM [Scientist] WHERE DivID = 31 ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string scientistName = reader["ScientistName"].ToString();
                            string scientistID = reader["ScientID"].ToString();
                            ListItem item = new ListItem(scientistName, scientistID);
                            ddlPME.Items.Add(item);
                        }
                    }
                }
            }
        }

        protected void btnForward_Click(object sender, EventArgs e)
        {
            int PropID = Convert.ToInt32(ProposalID.Text);
            string action = Convert.ToString(Forwarder.Text);
            int forwardTo= Convert.ToInt32(ddlPME.Text);
            int forwardFrom = Convert.ToInt32(Forwarder.Text);
            string Date = DateTime.Now.ToShortDateString().ToString();
            string comment = Convert.ToString(Comment.Text);

            Insert_From(PropID, action, forwardTo, forwardFrom,Date,comment);
            Update_supervioserID(PropID,forwardTo);

            Response.Redirect("ProjProposalSubmission.aspx");

        }

        private void Insert_From(int PropID,string action, int forwardTo,int forwardFrom,string Date,string comment)
        {
            string query = "INSERT INTO [ProposalForwarding] ([ProposalID],[ProposalAction],[PropForwdTo],[ForwarderID],[ForwdDate],[ForwdComment]) VALUES(@ProposalID,@ProposalAction,@PropForwdTo,@ForwarderID,@ForwdDate,@ForwdComment)";
            using (SqlConnection connection = new SqlConnection(connectionString)) { 
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@ProposalID", PropID);
                cmd.Parameters.AddWithValue("@ProposalAction", action);
                cmd.Parameters.AddWithValue("@PropForwdTo", forwardTo);
                cmd.Parameters.AddWithValue("@ForwarderID", forwardFrom);
                cmd.Parameters.AddWithValue("@ForwdDate",Date);
                cmd.Parameters.AddWithValue("@ForwdComment", comment);

                connection.Open();
                cmd.ExecuteNonQuery();

            }
        }

        private void Update_supervioserID(int PropID,int forwardTo) {

            string query = "UPDATE [ProjProposal] SET [SupervisoerID]=@SupervisoerID WHERE  [ProposalID]= @ProposalID ";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SupervisoerID", forwardTo);
                cmd.Parameters.AddWithValue("@ProposalID", PropID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

        }
    }
}