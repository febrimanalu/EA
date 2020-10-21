using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using EA.Classes;

namespace EA.Classes
{
    public class ClsLogin
    {
        public static DataTable DtLogin(string username, string password)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(ClsModule.conn.ToString());
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();

            con.Open();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Login where username='" + username + "' and password='" + password + "'";
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
            return dt;
        }
    }
}