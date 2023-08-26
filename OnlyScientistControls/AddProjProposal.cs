using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Aris
{
    public partial class AddProjProposal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            scientID = Convert.ToInt32(Session["ID"].ToString());
            Supervisor = int.Parse(Session["SupervioserID"].ToString());

            if (!IsPostBack)
            {
                int s = Supervisor;
                Console.WriteLine(s);
                BindDropdownItems();
                BindDomain();
                PopulateScientistsDropDown();
                txtDivID.Text = Session["DivName"].ToString();
                txtPropSubDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtPropFundEstimate.Attributes["placeholder"] = "Enter Only Digits. Example:XXXXXXXXXX";
                txtPropSubAgency.Attributes["placeholder"] = "Enter The Name of Partenered Agencies";
            }
        }


        string connectionString = ConfigurationManager.ConnectionStrings["connectionstr"].ConnectionString;
        int scientID;
        int Supervisor;
        string selectedItems = string.Empty;
        private void BindDomain()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Domain FROM [Domains]", con))
                {
                    con.Open();
                    txtPropUnderDomain.DataSource = cmd.ExecuteReader();
                    txtPropUnderDomain.DataTextField = "Domain";
                    txtPropUnderDomain.DataValueField = "Domain";
                    txtPropUnderDomain.DataBind();
                    con.Close();
                }
            }
        }
        private void BindDropdownItems()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CONCAT(FName, ' ', ScientID) AS ScientistName, ScientID FROM [Scientist] ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlItems.DataSource = reader;
                        ddlItems.DataTextField = "ScientistName";
                        ddlItems.DataValueField = "ScientID";
                        ddlItems.DataBind();
                    }
                }
            }
        }
        private void PopulateScientistsDropDown()
        {
            // Your query to fetch the scientist names and IDs from the database
            string query = "SELECT CONCAT(FName, ' ', ScientID) AS ScientistName, ScientID FROM [Scientist] ";

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
                            ddlScientists.Items.Add(item);
                        }
                    }
                }
            }
        }
        protected void btnAddProposal_Click(object sender, EventArgs e)
        {
            // Get the values from the form fields
            int scientistID = scientID;
            string divisionID = txtDivID.Text;
            string domain = txtPropUnderDomain.Text;
            string propType = txtPropType.Text;
            string propTitle = txtPropTitle.Text;
            string propSubAgency = txtPropSubAgency.Text;
            string propSubDate = Convert.ToString(txtPropSubDate.Text);
            string propNature = txtPropNature.Text;
            string propSummary = txtPropSummary.Text;
            decimal propFundEstimate = Convert.ToDecimal(txtPropFundEstimate.Text);
            string propPresentStatus = txtPropPresentStatus.Text;
            string propPI = ddlScientists.Text;
            Console.WriteLine(ddlScientists.Text);

            string propCoPIs = selectedItems ;
            string propAttachment = string.Empty;

            if (fileAttachment.HasFile)
            {
                propAttachment = SaveAttachment(fileAttachment);
            }

            int suervioser = Supervisor;


            InsertProposalData(scientistID, divisionID, domain, propType, propTitle,
                propSubAgency, propSubDate, propNature, propSummary, propFundEstimate, 
                propPresentStatus, propPI, propCoPIs, propAttachment, suervioser);

            // Clear the form fields
            ClearFormFields();

            // Show success message
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showAlert", "alert('Proposal added successfully.');", true);
        }

        private string SaveAttachment(FileUpload fileUpload)
        {
            string attachmentFileName = Path.GetFileName(fileUpload.FileName);
            string attachmentFilePath = Server.MapPath(attachmentFileName);
            fileUpload.SaveAs(attachmentFilePath);
            return attachmentFileName;
        }

        private void InsertProposalData(int scientistID, string Divison, string domain, string propType, string propTitle, string propSubAgency, string propSubDate, string propNature, string propSummary, decimal propFundEstimate, string propPresentStatus, string propPI, string propCoPIs, string propAttachment, int Supervisor)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ProjProposal (ScientID, DivID, PropUnderDomain, PropType, PropTitle, " +
                    "PropSubAgency, PropSubDate, PropNature, PropSummary, PropFundEstimate, PropPresentStatus, PropPI," +
                    " PropCoPIs, PropAttachment,SupervisoerID,[Division]) VALUES (@ScientID, @DivID, @PropUnderDomain, @PropType, " +
                    "@PropTitle, @PropSubAgency, @PropSubDate, @PropNature, @PropSummary, @PropFundEstimate, @PropPresentStatus," +
                    " @PropPI, @PropCoPIs, @PropAttachment,@SupervisoerID,@Division)";

                string divID = Session["DivID"].ToString();
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ScientID", scientistID);
                command.Parameters.AddWithValue("@DivID", divID);
                command.Parameters.AddWithValue("@PropUnderDomain", domain);
                command.Parameters.AddWithValue("@PropType", propType);
                command.Parameters.AddWithValue("@PropTitle", propTitle);
                command.Parameters.AddWithValue("@PropSubAgency", propSubAgency);
                command.Parameters.AddWithValue("@PropSubDate", propSubDate);
                command.Parameters.AddWithValue("@PropNature", propNature);
                command.Parameters.AddWithValue("@PropSummary", propSummary);
                command.Parameters.AddWithValue("@PropFundEstimate", propFundEstimate);
                command.Parameters.AddWithValue("@PropPresentStatus", propPresentStatus);
                command.Parameters.AddWithValue("@PropPI", propPI);
                command.Parameters.AddWithValue("@PropCoPIs", propCoPIs);
                command.Parameters.AddWithValue("@PropAttachment", propAttachment);
                command.Parameters.AddWithValue("@SupervisoerID", Supervisor);
                command.Parameters.AddWithValue("@Division", Divison);


                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void ClearFormFields()
        {

            txtPropTitle.Text = null;
            txtPropSubAgency.Text = null;
            txtPropSummary.Text = null;
            txtPropFundEstimate.Text = null;
            txtPropPresentStatus.Text = null;

        }
    }
}