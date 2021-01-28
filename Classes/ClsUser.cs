using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using EA.Classes;

namespace EA.Classes
{
    public class ClsUser
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
                Sqlcmd.CommandText = "select * from Dashboard order by SN";
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
    }
}