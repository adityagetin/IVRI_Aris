using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    

    public partial class user : Page
    {
        public string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";

        protected void btnCreateUser_Click1(object sender, EventArgs e)
        {
            string roleID = ddlRoleID.SelectedValue;
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string emailID = txtEmailID.Text;
            string password = txtPassword.Text;
            string supervisorID = txtSupervisorID.Text;

            try
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [User](RoleID, FirstName, LastName, EmailID, Password, SupervisorID) " +
                                   "VALUES( @RoleID, @FirstName, @LastName, @EmailID, @Password, @SupervisorID)";
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@RoleID", roleID);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@EmailID", emailID);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@SupervisorID", supervisorID);

                    command.ExecuteNonQuery();
                    connection.Close();
                }


                ddlRoleID.SelectedIndex = 0;
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtEmailID.Text = "";
                txtPassword.Text = "";
                txtSupervisorID.Text = "";


            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., display error message, log the error)
                Console.WriteLine(ex.Message);
            }
        }
    }
}