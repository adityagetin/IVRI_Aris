using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class UpdateRole : System.Web.UI.Page
    {
        string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the data to the repeater
                BindUserData();
            }
        }

        protected void BindUserData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM [User]";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                rptUser.DataSource = dataTable;
                rptUser.DataBind();

            }
            // 
        }

        protected void rptUser_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var ddlRole = (DropDownList)e.Item.FindControl("ddlRole");
                var roleLabel = (Label)e.Item.FindControl("RoleID");

                if (ddlRole != null && roleLabel != null)
                {
                    // Set the selected value of the DropDownList to the current role
                    ddlRole.SelectedValue = roleLabel.Text;
                }
            }
        }

        protected void btnUpdateRole_Click(object sender, EventArgs e)
        {
            Button btnUpdateRole = (Button)sender;
            RepeaterItem item = (RepeaterItem)btnUpdateRole.NamingContainer;
            DropDownList ddlRole = (DropDownList)item.FindControl("ddlRole");

            if (ddlRole != null)
            {
                // Get the selected role value
                string selectedRole = ddlRole.SelectedValue;
                // Get the UserID from the CommandArgument
                string userID = btnUpdateRole.CommandArgument;

                UpdateUserRole(userID, selectedRole);

                // After updating the role, rebind the data to the repeater
                BindUserData();
            }
        }

        private void UpdateUserRole(string userID, string selectedRole)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [User] SET RoleID = @RoleID WHERE UserID = @UserID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RoleID", selectedRole);
                command.Parameters.AddWithValue("@UserID", userID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
