using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanApp
{
    public partial class LoanForm : System.Web.UI.Page
    {
        public string connectionStr = @"data source=DESKTOP-R54CT7O;initial catalog=LoanApplicationForm;integrated security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();



            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Submit")
            {
                string insterQuery = "INSERT INTO LoanApplication(FullName,DateOfBirth,Gender,Email,PhoneNumber,Address," +
                    "EmploymentType,CompanyName,MonthlyIncome,LoanType)" +
                    " VALUES(@FullName,@DateOfBirth,@Gender,@Email,@PhoneNumber,@Address," +
                    "@EmploymentType,@CompanyName,@MonthlyIncome,@LoanType)";
                using (SqlConnection sql = new SqlConnection(connectionStr))
                using (SqlCommand cmd = new SqlCommand(insterQuery, sql))
                {
                    sql.Open();
                    cmd.Parameters.AddWithValue("@FullName", LoanFullName.Text);
                    cmd.Parameters.AddWithValue("@DateOfBirth", LoanDOB.Text);
                    cmd.Parameters.AddWithValue("@Gender", LoanGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Email", LoanEmail.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", LoanPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", LoanAddress.Text);
                    cmd.Parameters.AddWithValue("@EmploymentType", LoanEmploymentType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", LoanCompany.Text);
                    cmd.Parameters.AddWithValue("@MonthlyIncome", LoanIncome.Text);
                    cmd.Parameters.AddWithValue("@LoanType", LoanType.SelectedValue);
                    cmd.ExecuteNonQuery();
                    ClearField();
                }
                ShowData();
            }

            else if (btnSubmit.Text == "Update")
            {

            }
        }

        public void ShowData()
        {
            string ShowQuery = @"select * from LoanApplication 
	join tblGender on Gender=genderid 
join tblEmploymentType on EmploymentType=emptid 
join loanType on LoanType=ltid
";
            using (SqlConnection sql = new SqlConnection(connectionStr))
            using (SqlCommand cmd = new SqlCommand(ShowQuery, sql))
            using (SqlDataAdapter sqlData = new SqlDataAdapter(cmd))
            using (DataTable dt = new DataTable())
            {
                sqlData.Fill(dt);
                gvloan.DataSource = dt;
                gvloan.DataBind();
                sql.Open();

            }

        }

        public void ClearField()
        {
            LoanFullName.Text = "";
            LoanDOB.Text = "";
            LoanAddress.Text = "";
            LoanGender.SelectedValue = "0";
            LoanEmail.Text = "";
            LoanPhone.Text = "";
            LoanEmploymentType.SelectedValue = "0";
            LoanCompany.Text = "";
            LoanIncome.Text = "";
            LoanAmount.Text = "";
            LoanType.SelectedValue = "0";
        }
        protected void gvloan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "delta")
                {
                    string query = @"DELETE FROM LoanApplication WHERE Id=@Id";
                    using (SqlConnection sql = new SqlConnection(connectionStr))
                    {
                        using (SqlCommand cmd = new SqlCommand(query, sql))
                        {
                            cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                            sql.Open();
                            cmd.ExecuteNonQuery();

                        }
                    }
                    ShowData();
                }
                else if (e.CommandName == "edt")
                {
                    string ShowQuery = @"select * from LoanApplication where Id=@Id";
                    using (SqlConnection sql = new SqlConnection(connectionStr))
                    using (SqlCommand cmd = new SqlCommand(ShowQuery, sql))
                    using (SqlDataAdapter sqlData = new SqlDataAdapter(cmd))
                    using (DataTable dt = new DataTable())
                    {

                        sql.Open();
                        cmd.Parameters.AddWithValue("@Id", e.CommandArgument);
                        sqlData.Fill(dt);
                        LoanFullName.Text = dt.Rows[0]["FullName"].ToString();
                        LoanDOB.Text = dt.Rows[0]["DateOfBirth"].ToString();
                        LoanGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                        LoanEmail.Text = dt.Rows[0]["Email"].ToString();
                        LoanPhone.Text = dt.Rows[0]["PhoneNumber"].ToString();
                        LoanEmploymentType.SelectedValue = dt.Rows[0]["EmploymentType"].ToString();
                        LoanCompany.Text = dt.Rows[0]["CompanyName"].ToString();
                        LoanIncome.Text = dt.Rows[0]["MonthlyIncome"].ToString();
                        LoanType.SelectedValue = dt.Rows[0]["LoanType"].ToString();
                        LoanAmount.Text = dt.Rows[0][""].ToString();
                        btnSubmit.Text = "Update";
                        ViewState["abc"] = e.CommandArgument;
                    }
                }
            }
            catch (NullReferenceException ex)
            {

                Console.WriteLine(ex.Message);
            }


        }
    }
}