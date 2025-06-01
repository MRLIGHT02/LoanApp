using System;
using System.Collections.Generic;
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

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}