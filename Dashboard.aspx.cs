using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    public partial class Dashboard : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DtDashboard();
                Summary();
            }
        }

        private void DtDashboard()
        {
            DataTable Dt = new DataTable();
            Dt = ClsDashboard.DtDashboard();
            RptDashboard.DataSource = Dt;
            RptDashboard.DataBind();
        }

        private void Summary()
        {
            string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
            SqlConnection con = new SqlConnection(Koneksi);
            con.Open();

            SqlCommand cmd = new SqlCommand("spt_summary", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Status","Status");
            cmd.Parameters.AddWithValue("@Total", "Total");
            cmd.Parameters.AddWithValue("@RowCategory", "RowCategory");
            cmd.Parameters.AddWithValue("@RowType", "RowType");
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dta = new DataTable();
            sda.Fill(dta);
            RptSummary.DataSource = dta;
            RptSummary.DataBind();
            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtEP.HasFile)
            {
                string FileExtension = Path.GetExtension(txtEP.FileName).Substring(1);
                string ContentType = txtEP.PostedFile.ContentType;
                string ImgPath = "File/" + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + FileExtension;
                txtEP.SaveAs(Server.MapPath(ImgPath));
                DateTime LastUpdate = DateTime.Now;

                string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
                using (SqlConnection con = new SqlConnection(Koneksi))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Dashboard (SN, Description, Family, BU, BU_Line, Status, Owner_Engineer, RF_ID, CO, EAM, Job_No, Asset_Group_ID, Asset_Group_Desc, Manufacturer, Asset_Owner, PM, PM_Period, Calibration, Cal_Period, Cal_ID, Cal_Supplier, Equip_Picture, Manual_Doc_Attachment, By_Whom, Last_Update, Remark )" + "VALUES" +
                            "(@SN, @Description, @Family, @BU, @BU_Line, @Status, @Owner_Engineer, @RF_ID, @CO, @EAM, @Job_No, @Asset_Group_ID, @Asset_Group_Desc, @Manufacturer, @Asset_Owner, @PM, @PM_Period, @Calibration, @Cal_Period, @Cal_ID, @Cal_Supplier, @Equip_Picture, @Manual_Doc_Attachment, @By_Whom, @Last_Update, @Remark)"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@SN", txtSN.Text.ToString());
                        cmd.Parameters.AddWithValue("@Description", txtDesc.Text.Trim());
                        cmd.Parameters.AddWithValue("@Family", ddlFam.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU", ddlBU.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU_Line", txtBUL.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", ddlS.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Owner_Engineer", txtOE.Text.Trim());
                        cmd.Parameters.AddWithValue("@RF_ID", txtRFID.Text.Trim());
                        cmd.Parameters.AddWithValue("@CO", txtCO.Text.Trim());
                        cmd.Parameters.AddWithValue("@EAM", txtEAM.Text.Trim());
                        cmd.Parameters.AddWithValue("@Job_No", txtJN.Text.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_ID", ddlAGID.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_Desc", txtAGD.Text.Trim());
                        cmd.Parameters.AddWithValue("@Manufacturer", ddlManu.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Owner", ddlAO.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM", ddlPM.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM_Period", txtPMP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Calibration", ddlCal.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Period", txtCP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_ID", txtCID.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Supplier", txtCS.Text.Trim());
                        cmd.Parameters.AddWithValue("@Equip_Picture", ImgPath);
                        cmd.Parameters.AddWithValue("@Manual_Doc_Attachment", txtMDA.Text.Trim());
                        cmd.Parameters.AddWithValue("@By_Whom", txtBW.Text.Trim());
                        cmd.Parameters.AddWithValue("@Last_Update", LastUpdate);
                        cmd.Parameters.AddWithValue("@Remark", txtR.Text.Trim());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            DtDashboard();
            Clear();
        }

        public void Clear()
        {
            txtSN.Text = string.Empty;
            txtDesc.Text = string.Empty;
            ddlFam.SelectedValue = "--Select Status--";
            ddlBU.SelectedValue = "--Select Status--";
            txtBUL.Text = string.Empty;
            ddlS.SelectedValue = "--Select Status--";
            txtOE.Text = string.Empty;
            txtRFID.Text = string.Empty;
            txtCO.Text = string.Empty;
            txtEAM.Text = string.Empty;
            txtJN.Text = string.Empty;
            ddlAGID.SelectedValue = "--Select Status--";
            txtAGD.Text = string.Empty;
            ddlManu.SelectedValue = "--Select Status--";
            ddlAO.SelectedValue = "--Select Status--";
            ddlPM.SelectedValue = "--Select Status--";
            txtPMP.Text = string.Empty;
            ddlCal.SelectedValue = "--Select Status--";
            txtCP.Text = string.Empty;
            txtCID.Text = string.Empty;
            txtCS.Text = string.Empty;
            txtMDA.Text = string.Empty;
            txtBW.Text = string.Empty;
            txtR.Text = string.Empty;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (txtEditEP.HasFile)
            {
                string FileExtension = Path.GetExtension(txtEditEP.FileName).Substring(1);
                string ImgPath = "File/" + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + FileExtension;
                txtEditEP.SaveAs(Server.MapPath(ImgPath));
                DateTime dateTimeVariable = DateTime.Now;

                string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
                using (SqlConnection con = new SqlConnection(Koneksi))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Dashboard SET Description=@Description, Family=@Family, BU=@BU, BU_Line=@BU_Line, Status=@Status, Owner_Engineer=@Owner_Engineer, RF_ID=@RF_ID, CO=@CO, EAM=@EAM, Job_No=@Job_No, Asset_Group_ID=@Asset_Group_ID, Asset_Group_Desc= @Asset_Group_Desc, Manufacturer=@Manufacturer, Asset_Owner=@Asset_Owner, PM=@PM, PM_Period=@PM_Period, Calibration=@Calibration, Cal_Period=@Cal_Period, Cal_ID=@Cal_ID, Cal_Supplier=@Cal_Supplier, Equip_Picture= @Equip_Picture, Manual_Doc_Attachment=@Manual_Doc_Attachment, By_Whom=@By_Whom, Last_Update=@Last_Update, Remark=@Remark WHERE SN=@SN"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@SN", txtEditSN.Text.ToString());
                        cmd.Parameters.AddWithValue("@Description", txtEditDesc.Text.Trim());
                        cmd.Parameters.AddWithValue("@Family", ddlEditFam.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU", ddlEditBU.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU_Line", txtEditBUL.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", ddlEditS.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Owner_Engineer", txtEditOE.Text.Trim()); ;
                        cmd.Parameters.AddWithValue("@RF_ID", txtEditRFID.Text.Trim());
                        cmd.Parameters.AddWithValue("@CO", txtEditCO.Text.Trim());
                        cmd.Parameters.AddWithValue("@EAM", txtEditEAM.Text.Trim());
                        cmd.Parameters.AddWithValue("@Job_No", txtEditJN.Text.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_ID", ddlEditAGID.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_Desc", txtEditAGD.Text.Trim());
                        cmd.Parameters.AddWithValue("@Manufacturer", ddlEditManu.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Owner", ddlEditAO.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM", ddlEditPM.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM_Period", txtEditPMP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Calibration", ddlEditCal.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Period", txtEditCP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_ID", txtEditCID.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Supplier", txtEditCS.Text.Trim());
                        cmd.Parameters.AddWithValue("@Equip_Picture", ImgPath);
                        cmd.Parameters.AddWithValue("@Manual_Doc_Attachment", txtEditMDA.Text.Trim());
                        cmd.Parameters.AddWithValue("@By_Whom", txtEditBW.Text.Trim());
                        cmd.Parameters.AddWithValue("@Last_Update", dateTimeVariable);
                        cmd.Parameters.AddWithValue("@Remark", txtEditR.Text.Trim());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            else
            {
                DateTime dateTimeVariable = DateTime.Now;
                string Koneksi = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
                using (SqlConnection con = new SqlConnection(Koneksi))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Dashboard SET Description=@Description, Family=@Family, BU=@BU, BU_Line=@BU_Line, Status=@Status, Owner_Engineer=@Owner_Engineer, RF_ID=@RF_ID, CO=@CO, EAM=@EAM, Job_No=@Job_No, Asset_Group_ID=@Asset_Group_ID, Asset_Group_Desc= @Asset_Group_Desc, Manufacturer=@Manufacturer, Asset_Owner=@Asset_Owner, PM=@PM, PM_Period=@PM_Period, Calibration=@Calibration, Cal_Period=@Cal_Period, Cal_ID=@Cal_ID, Cal_Supplier=@Cal_Supplier, Manual_Doc_Attachment=@Manual_Doc_Attachment, By_Whom=@By_Whom, Last_Update=@Last_Update, Remark=@Remark WHERE SN=@SN"))
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@SN", txtEditSN.Text.ToString());
                        cmd.Parameters.AddWithValue("@Description", txtEditDesc.Text.Trim());
                        cmd.Parameters.AddWithValue("@Family", ddlEditFam.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU", ddlEditBU.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@BU_Line", txtEditBUL.Text.Trim());
                        cmd.Parameters.AddWithValue("@Status", ddlEditS.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Owner_Engineer", txtEditOE.Text.Trim()); ;
                        cmd.Parameters.AddWithValue("@RF_ID", txtEditRFID.Text.Trim());
                        cmd.Parameters.AddWithValue("@CO", txtEditCO.Text.Trim());
                        cmd.Parameters.AddWithValue("@EAM", txtEditEAM.Text.Trim());
                        cmd.Parameters.AddWithValue("@Job_No", txtEditJN.Text.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_ID", ddlEditAGID.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Group_Desc", txtEditAGD.Text.Trim());
                        cmd.Parameters.AddWithValue("@Manufacturer", ddlEditManu.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Asset_Owner", ddlEditAO.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM", ddlEditPM.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@PM_Period", txtEditPMP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Calibration", ddlEditCal.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Period", txtEditCP.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_ID", txtEditCID.Text.Trim());
                        cmd.Parameters.AddWithValue("@Cal_Supplier", txtEditCS.Text.Trim());
                        cmd.Parameters.AddWithValue("@Manual_Doc_Attachment", txtEditMDA.Text.Trim());
                        cmd.Parameters.AddWithValue("@By_Whom", txtEditBW.Text.Trim());
                        cmd.Parameters.AddWithValue("@Last_Update", dateTimeVariable);
                        cmd.Parameters.AddWithValue("@Remark", txtEditR.Text.Trim());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            DtDashboard();
            Clear();
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument.ToString();
            ClsDashboard.DeleteData(id);
            DtDashboard();
            Clear();
        }
    }
}