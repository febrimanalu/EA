using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using EA.Classes;

namespace EA
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DtDashboard();
            }
        }

        private void DtDashboard()
        {
            DataTable Dt = new DataTable();
            Dt = ClsDashboard.DtDashboard();
            RptDashboard.DataSource = Dt;
            RptDashboard.DataBind();
        }
    }
}