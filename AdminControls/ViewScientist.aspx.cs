using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class ViewScientist : Page
    {

        string connectionString = "Data Source=ADITYA-PAL\\SQLEXPRESS;Initial Catalog=Project_Aris;Integrated Security=True;";
        public string Name;
        public int UID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // UID = Convert.ToInt32(Session["ID"]);
                //Name = Session["Name"].ToString();
                BindScientists();
            }
        }

        private void BindScientists()
        {

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

        protected void Edit(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            Session["scientistId"] = button.CommandArgument;
            Response.Redirect("scientist_edit.aspx");

        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton b = (LinkButton)sender;
            string i = b.CommandArgument;
            int id = Convert.ToInt32(i);
            int user = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                SqlCommand getUSERID = new SqlCommand();
                getUSERID.Connection = connection;
                getUSERID.CommandText = "SELECT UserID FROM Scientist WHERE ScientID=@ID";
                getUSERID.Parameters.AddWithValue("@id", id);
                connection.Open();
                object userid= getUSERID.ExecuteScalar();

                if (userid != null) { 
                    user = Convert.ToInt32(userid);
                    
                }

                using(SqlConnection connection1=new SqlConnection(connectionString))
                {
                    SqlCommand command1 = new SqlCommand();
                    command1.Connection = connection1;
                    command1.CommandText = "DELETE FROM User WHERE UserID=@USER";
                    command1.Parameters.AddWithValue("@USER", user);
                    connection1.Open();
                }

                using(SqlConnection conn2=new SqlConnection(connectionString))
                {
                    SqlCommand command2 = new SqlCommand();
                    command2.Connection = conn2;
                    command2.CommandText = "DELETE FROM Scientist WHERE ScientID = @id";
                    command2.Parameters.AddWithValue("@id", id);
                    conn2.Open();
                }

                

            }
        }
    }
}
            
