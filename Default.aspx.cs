using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Ajax.Utilities;

namespace Project_Aris
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int[] scientistIdsArray = null;
        int[] JDR = null;
        protected void Page_Load(object sender, EventArgs e)

        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
            scientistIdsArray = GetScientistIdsWithMinRoleForDivision(connectionString);
            JDR = GetJDR(connectionString, 31);
            scientistIdsArray = scientistIdsArray.Except(JDR).ToArray();

        }

        private int[] GetScientistIdsWithMinRoleForDivision(string connectionString)
        {
            List<int> scientistIds = new List<int>();
            string query = @"
            SELECT S.ScientID
            FROM Scientist AS S
            INNER JOIN (
                SELECT DivID, MIN(DesigID) AS MinRoleId
                FROM Scientist
                GROUP BY DivID
            ) AS MinRoleTable ON S.DivID = MinRoleTable.DivID AND S.DesigID = MinRoleTable.MinRoleId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // Process the query results and store the Scientist IDs in the list
                while (reader.Read())
                {
                    int scientistId = Convert.ToInt32(reader["ScientID"]);
                    scientistIds.Add(scientistId);
                }

                reader.Close();
            }

            // Convert the list to an array and return it
            return scientistIds.ToArray();
        }


        private int[] GetJDR(string connectionString, int divID)
        {
            List<int> JDR = new List<int>();

            // SQL query to find the minimum DesidID for the specified division and corresponding Scientist IDs
            string query = @"
            SELECT ScientID
            FROM Scientist
            WHERE DivID = @divID AND DesigID = (SELECT MIN(DesigID) FROM Scientist WHERE DivID = @divID)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@divID", divID);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // Process the query results and store the Scientist IDs in the list
                while (reader.Read())
                {
                    int scientistId = Convert.ToInt32(reader["ScientID"]);
                    JDR.Add(scientistId);
                }
                reader.Close();
            }

            return JDR.ToArray();
        }

        protected void Login(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;

            if (Login_UserID.Text == "" || Login_Pass.Text == "")
            {
                error.Text = "Kindly Fill You ID & Password !";
            }
            else
            {

                int inputUserID = int.Parse(Login_UserID.Text);
                string inputPassword = Login_Pass.Text;
                DateTime inputDate = DateTime.Now;

                // Create a SqlConnection object
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Query to fetch the UserID and Password from the database
                        string query = "SELECT u.UserID, u.Password, u.RoleID, u.FirstName, u.SupervisorID, d.Division ,u.DivID\r\n FROM [User] u\r\nJOIN [DivisionID] d ON u.DivID = d.ID\r\nWHERE u.UserID= @UserID;";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {

                            // Add parameter for the input UserID
                            command.Parameters.AddWithValue("@UserID", inputUserID);

                            // Execute the query and process the results
                            SqlDataReader reader = command.ExecuteReader();

                            if (reader.Read())
                            {
                                int uid = reader.GetInt32(0);
                                Console.WriteLine(uid);
                                int storedUserID = uid;
                                string storedPassword = reader.GetString(1);
                                int roleID = reader.GetInt32(2);
                                string firstName = reader.GetString(3);
                                string supervisor = reader.GetInt32(4).ToString();
                                string divName = reader.GetString(5);
                                int divID = reader.GetInt32(6);

                                Session["SupervioserID"] = supervisor;
                                Session["ID"] = storedUserID;
                                Session["Name"] = firstName;
                                Session["DivName"] = divName;
                                Session["DivID"] = divID;




                                if ((storedUserID == inputUserID) && (storedPassword == inputPassword))
                                {

                                    string role = Convert.ToString(roleID);
                                    if (role != null)
                                    {
                                        if (scientistIdsArray.Contains(storedUserID))
                                        {
                                            Session["SupervioserID"] = supervisor;
                                            Session["ID"] = storedUserID;
                                            Session["Name"] = firstName;
                                            Session["DivName"] = divName;
                                            Session["DivID"] = divID;
                                            Response.Redirect("\\DivisionControls\\DivisionHome.aspx");
                                        }
                                        else if (JDR.Contains(storedUserID))
                                        {
                                            Session["SupervioserID"] = supervisor;
                                            Session["ID"] = storedUserID;
                                            Session["Name"] = firstName;
                                            Session["DivName"] = divName;
                                            Session["DivID"] = divID;
                                            Response.Redirect("\\PMEControls\\PMEHome.aspx");
                                        }
                                        else
                                        {
                                            Session["SupervioserID"] = supervisor;
                                            Session["ID"] = storedUserID;
                                            Session["Name"] = firstName;
                                            Session["DivName"] = divName;
                                            Session["DivID"] = divID;
                                            Response.Redirect("\\OnlyScientistControls\\ScvientistHome.aspx");

                                        }
                                    }
                                    else
                                    {
                                        error.Text = "Invalid User";
                                    }
                                }
                                else
                                {
                                    // Invalid credentials, display error message
                                    error.Text = "Invalid UserID or Password.";
                                }
                            }
                            else
                            {
                                // User not found, display error message
                                error.Text = "User not found.";
                            }
                            reader.Close();
                            connection.Close();
                        }


                        string lastlogin = "UPDATE [User]SET LastLogin = @LastLogin WHERE UserID = @UserID;";
                        using (SqlCommand command1 = new SqlCommand(lastlogin, connection))
                        {
                            try
                            {
                                connection.Open();
                                command1.Parameters.AddWithValue("@UserID", inputUserID);
                                command1.Parameters.AddWithValue("@LastLogin", inputDate);
                                command1.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                error.Text = ex.ToString();

                            }

                        }

                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        // Handle any errors that occurred during the process
                        // Display or log the error message
                        Response.Write("An error occurred: " + ex.Message);
                    }
                }

            }
        }

        protected void Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Reports\\AllReport.aspx");
        }
    }


}