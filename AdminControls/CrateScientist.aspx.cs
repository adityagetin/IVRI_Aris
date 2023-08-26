using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class CrateScientist : Page
    { int Sid = 0;
        string id = string.Empty;
        private int selectedDivisionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Sid = Convert.ToInt32(Session["ID"]);
            if (!IsPostBack)
            {
                // Load data into the dropdown on initial page load
                BindDivisionDropdown();
            }
        }

        protected void BindDivisionDropdown()
        {
            // Fetch data from the database and bind it to the dropdown
            string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";
            string query = "SELECT ID, Division FROM DivisionID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    ddlDivision.DataSource = dt;
                    ddlDivision.DataTextField = "Division";
                    ddlDivision.DataValueField = "ID";
                    ddlDivision.DataBind();
                }
            }
        }

        protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Store the selected Division's ID in the global variable
            selectedDivisionID = int.Parse(ddlDivision.SelectedValue);

            string message = $"Selected ID: {selectedDivisionID}";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", $"alert('{message}');", true);
        }




        protected void btnCreateScientist_Click(object sender, EventArgs e)
        {
            // Get the input values
            string firstName = txtFname.Text;
            string lastName = txtLname.Text;
            string middleName = txtMname.Text;
            string divId = id;
            string discipline = txtDiscipline.Text;
            string desigId = txtDesigID.Text;
            string dob = txtDoB.Text;
            string doj = txtDoJ.Text;
            string emailIcar = txtEmailICAR.Text;
            string email = txtEmail.Text;
            string mob1 = txtMob1.Text;
            string mob2 = txtMob2.Text;
            string password = txtPassword.Text;
            string userId = txtUSerId.Text;
            string role = ddlRole.SelectedValue;

            // Store the data in the database
            string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Scientist (ScientID, Fname, Lname, Mname, DivID, Discipline, DesigID, DoB, DoJ, EmailICAR, Email, Mob1, Mob2, Password, UserID, Role) " +
                               "VALUES (@ScientID, @Fname, @Lname, @Mname, @DivID, @Discipline, @DesigID, @DoB, @DoJ, @EmailICAR, @Email, @Mob1, @Mob2, @Password, @UserID, @Role)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ScientID",userId);
                command.Parameters.AddWithValue("@Fname", firstName);
                command.Parameters.AddWithValue("@Lname", lastName);
                command.Parameters.AddWithValue("@Mname", middleName);
                command.Parameters.AddWithValue("@DivID", divId);
                command.Parameters.AddWithValue("@Discipline", discipline);
                command.Parameters.AddWithValue("@DesigID", desigId);
                command.Parameters.AddWithValue("@DoB", dob);
                command.Parameters.AddWithValue("@DoJ", doj);
                command.Parameters.AddWithValue("@EmailICAR", emailIcar);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Mob1", mob1);
                command.Parameters.AddWithValue("@Mob2", mob2);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@UserID", userId);
                command.Parameters.AddWithValue("@Role", role);

                string query2 = "INSERT INTO [User] (UserID,RoleID,FirstName,LastName,EmailID,Password,SupervioserID,LastLogin) VALUES (@UserID,@RoleID,@FirstName,@LastName,@EmailID,@Password,@SupervioserID,NULL)";
                SqlCommand usercommand = new SqlCommand(query2,connection);
                usercommand.Parameters.AddWithValue("@UserID", userId);
                usercommand.Parameters.AddWithValue("@RoleID", 2);
                usercommand.Parameters.AddWithValue("@Fname", firstName);
                usercommand.Parameters.AddWithValue("@Lname", lastName);
                usercommand.Parameters.AddWithValue("@EmailID", email);
                usercommand.Parameters.AddWithValue("@Password", password);
                usercommand.Parameters.AddWithValue("@SupervisorID", Sid);


                connection.Open();
                command.ExecuteNonQuery();
                usercommand.ExecuteNonQuery();
                connection.Close();
            }

            // Clear the input fields
            ClearInputFields();
        }

        private void ClearInputFields()
        {
            txtFname.Text = string.Empty;
            txtLname.Text = string.Empty;
            txtMname.Text = string.Empty;
            txtDiscipline.Text = string.Empty;
            txtDesigID.Text = string.Empty;
            txtDoB.Text = string.Empty;
            txtDoJ.Text = string.Empty;
            txtEmailICAR.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMob1.Text = string.Empty;
            txtMob2.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtUSerId.Text = string.Empty;
            ddlRole.SelectedIndex = 0;
        }
    }
}
