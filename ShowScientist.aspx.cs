using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class Showscientistaspx : System.Web.UI.Page
    {
        string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";
        public string Name;
        public int UID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                UID = Convert.ToInt32(Session["ID"]);
                Name = Session["Name"].ToString();
                BindScientists();
            }
        }

        private void BindScientists()
        {
            string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Scientist";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                rptScientists.DataSource = dataTable;
                rptScientists.DataBind();
            }
        }

        protected void rptScientists_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string scientistId = e.CommandArgument.ToString();
                // Redirect to the scientist_edit.aspx page passing the scientistId
                Session["scientistId"] = scientistId;
                Response.Redirect("scientist_edit.aspx");

            }
            else if (e.CommandName == "Delete")
            {
                string scientistId = e.CommandArgument.ToString();
                string UserID = e.CommandArgument.ToString();
                int uid = int.Parse(UserID.ToString());

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Scientist WHERE ScientID = @ScientistID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ScientistID", scientistId);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    if (UserID == null)
                    {
                        Console.WriteLine("null");
                    }
                    else
                    {
                        string q2 = "DELETE FROM [User] WHERE UserID = @UserID";
                        SqlCommand command2 = new SqlCommand(q2, connection);
                        command2.Parameters.AddWithValue("@UserID", uid);
                        connection.Open();
                        command2.ExecuteNonQuery();
                        connection.Close();

                    }


                }

                BindScientists();
            }
        }
    }
}