using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EA.Classes
{
    public class ClsModule
    {
        public static string conn = ConfigurationManager.ConnectionStrings["Koneksi"].ConnectionString;
    }
}