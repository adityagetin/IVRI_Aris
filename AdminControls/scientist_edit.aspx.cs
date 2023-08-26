using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class scientist_edit : System.Web.UI.Page
    {
        string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["scientistId"] != null)
                {   

                    string scientistId = Session["scientistId"].ToString();
                    BindScientistDetails(scientistId);
                }
            }
        }

        private void BindScientistDetails(string scientistId)
        {
            
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Scientist WHERE ScientID = @ScientistID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ScientistID", scientistId);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                if (dataTable.Rows.Count > 0)
                {
                    DataRow row = dataTable.Rows[0];
                    txtFname.Text = row["Fname"].ToString();
                    txtLname.Text = row["Lname"].ToString();
                    txtMname.Text = row["Mname"].ToString();
                    txtDivID.Text= row["DivID"].ToString();
                    txtDiscipline.Text = row["Discipilne"].ToString();
                    txtDesigID.Text = row["DesigID"].ToString();
                    string dob = row["DoB"].ToString();

                    string doj = row["DoJ"].ToString(); 
                    
                    if (row["DoB"].ToString() == "")
                    {
                        txtDoB.Text ="" ;
                    }

                    else {
                        txtDoB.Text = Convert.ToDateTime(row["DoB"]).ToString("yyyy-MM-dd");
                    }

                    if (row["DoJ"].ToString() == "")
                    {
                        txtDoJ.Text = "";
                    }
                    else
                    {
                        txtDoB.Text = Convert.ToDateTime(row["DoJ"]).ToString("yyyy-MM-dd");
                    }

                    txtEmailICAR.Text = row["EmailICAR"].ToString();
                    txtEmail.Text = row["Email"].ToString();
                    txtMob1.Text = row["Mob1"].ToString();
                    txtMob2.Text = row["Mob2"].ToString();
                    txtPassword.Text = row["Password"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["scientistId"] != null)
            {
                string scientistId = Request.QueryString["scientistId"].ToString();

                string fname = txtFname.Text;
                string lname = txtLname.Text;
                string mname = txtMname.Text;
                string divID = txtDivID.Text;
                string discipline = txtDiscipline.Text;
                string desigID = txtDesigID.Text;
                DateTime dob;
                if (!DateTime.TryParse(txtDoB.Text, out dob))
                {
                    // Handle invalid date input
                    // Display an error message or take appropriate action
                    return;
                }
                DateTime doj;
                if (!DateTime.TryParse(txtDoJ.Text, out doj))
                {
                    // Handle invalid date input
                    // Display an error message or take appropriate action
                    return;
                }
                string emailICAR = txtEmailICAR.Text;
                string email = txtEmail.Text;
                string mob1 = txtMob1.Text;
                string mob2 = txtMob2.Text;
                string password = txtPassword.Text;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Scientist SET Fname = @Fname, Lname = @Lname, Mname = @Mname, DivID = @DivID " +
                                   "DesigID = @DesigID, DoB = @DoB, DoJ = @DoJ, EmailICAR = @EmailICAR, Email = @Email, Mob1 = @Mob1, Mob2 = @Mob2, " +
                                   "Password = @Password WHERE ScientID = @ScientistID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Fname", fname);
                    command.Parameters.AddWithValue("@Lname", lname);
                    command.Parameters.AddWithValue("@Mname", mname);
                    command.Parameters.AddWithValue("@DivID", divID);
                    command.Parameters.AddWithValue("@DesigID", desigID);
                    command.Parameters.AddWithValue("@DoB", dob);
                    command.Parameters.AddWithValue("@DoJ", doj);
                    command.Parameters.AddWithValue("@EmailICAR", emailICAR);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Mob1", mob1);
                    command.Parameters.AddWithValue("@Mob2", mob2);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@ScientistID", scientistId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }



                // Redirect to the scientist.aspx page after updating
                Response.Redirect("Welcome_Admin.aspx");
            }
        }
    }
}