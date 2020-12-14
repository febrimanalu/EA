using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using EA.Classes;

namespace EA.Classes
{
    public class ClsDashboard
    {
        public static DataTable DtDashboard()
        {
            try
            {
                DataTable DtTampil = new DataTable();
                SqlConnection Sqlconn = new SqlConnection(ClsModule.conn.ToString());
                SqlCommand Sqlcmd = new SqlCommand();
                SqlDataAdapter Sqlda = new SqlDataAdapter();

                Sqlconn.Open();
                Sqlcmd.Connection = Sqlconn;
                Sqlcmd.CommandType = CommandType.Text;
                Sqlcmd.CommandText = "select * from fix order by SN";
                Sqlda.SelectCommand = Sqlcmd;
                Sqlda.Fill(DtTampil);
                Sqlconn.Close();
                return DtTampil;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void EditData(string nama, string fam, string loc, string li, string status, string oe, string rfid, string co, string eam, string jn, string agid, string agd, string manu, string ao, string pm, string pmp, string cal, string cp, string cid, string cs, string ep, string mda, string bw, string lu, string re, string id)
        {
            try
            {
                SqlConnection sqlconn = new SqlConnection(ClsModule.conn.ToString());
                SqlCommand sqlcmd = new SqlCommand();

                sqlconn.Open();
                sqlcmd.Connection = sqlconn;
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandText = "update fix set Description='" + nama + "', Family='" + fam + "', Location='" + loc + "', Line='" + li + "', Status='" + status + "', Owner_Engineer='" + oe + "', RF_ID='" + rfid + "', CO='" + co + "', EAM='" + eam + "', Job_No='"+jn+ "', Asset_Group_ID='" + agid + "', Asset_Group_Desc='" + agd + "', Manufacturer='" + manu + "', Asset_Owner='" + ao + "', PM='" + pm + "', PM_Period='" + pmp + "', Calibration='" + cal + "', Cal_Period='" + cp + "', Cal_ID='" + cid + "', Cal_Supplier='" + cs + "', Equip_Picture='" + ep + "',Manual_Doc_Attachment='" + mda + "' ,By_Whom='" + bw + "' ,Last_Update='" + lu + "' ,Remark='" + re + "' where SN='" + id + "'";
                sqlcmd.ExecuteNonQuery();
                sqlconn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void DeleteData(string id)
        {
            try
            {
                SqlConnection Sqlconn = new SqlConnection(ClsModule.conn.ToString());
                SqlCommand Sqlcmd = new SqlCommand();
                SqlDataAdapter Sqlda = new SqlDataAdapter();

                Sqlconn.Open();
                Sqlcmd.Connection = Sqlconn;
                Sqlcmd.CommandType = CommandType.Text;
                Sqlcmd.CommandText = "delete from fix where SN='" + id + "'";
                Sqlcmd.ExecuteNonQuery();
                Sqlconn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}