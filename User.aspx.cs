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
                Status();
                Location();
                Asset();
                Owner();
            }
        }

        private void DtDashboard()
        {
            DataTable Dt = new DataTable();
            Dt = ClsDashboard.DtDashboard();

            string mda = Request.Url.AbsoluteUri;
            RptDashboard.DataSource = Dt;
            RptDashboard.DataBind();
        }

        private void Status()
        {
            string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
            SqlConnection con = new SqlConnection(Koneksi);
            con.Open();

            SqlCommand cmd = new SqlCommand("spt_status", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string query = @"spt_status";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dta = new DataTable();
            sda.Fill(dta);
            Rpt1.DataSource = dta;
            Rpt1.DataBind();
            con.Close();
        }

        private void Location()
        {
            string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
            SqlConnection con = new SqlConnection(Koneksi);
            con.Open();

            SqlCommand cmd = new SqlCommand("spt_location", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string query = @"spt_location";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable ta = new DataTable();
            sda.Fill(ta);
            Rpt2.DataSource = ta;
            Rpt2.DataBind();
            con.Close();
        }

        private void Asset()
        {
            string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
            SqlConnection con = new SqlConnection(Koneksi);
            con.Open();

            SqlCommand cmd = new SqlCommand("spt_asset", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string query = @"spt_asset";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable datat = new DataTable();
            sda.Fill(datat);
            Rpt3.DataSource = datat;
            Rpt3.DataBind();
            con.Close();
        }

        private void Owner()
        {
            string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
            SqlConnection con = new SqlConnection(Koneksi);
            con.Open();

            SqlCommand cmd = new SqlCommand("spt_aowner", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string query = @"spt_aowner";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            Rpt4.DataSource = data;
            Rpt4.DataBind();
            con.Close();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}