<%@ WebHandler Language="C#" Class="mcqfilehandler" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.SessionState;
public class mcqfilehandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {

            string metricid = context.Request.Form["metricid"].ToString();
            string filetitle = context.Request.Form["filetitle"].ToString();
            context.Response.ContentType = "text/plain";
            string OriginalfileName = "";
            string strFileName = "";
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("sp_mcqmanage", con);
                cmd.Connection = con;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@metricid", metricid);
                cmd.Parameters.AddWithValue("@filetitle", filetitle);
                if (filetitle=="Student")
                {
                    cmd.Parameters.AddWithValue("@titleno", "1");
                }
                else if (filetitle == "Teacher")
                {
                    cmd.Parameters.AddWithValue("@titleno", "2");
                }
                else if (filetitle == "Employee")
                {
                    cmd.Parameters.AddWithValue("@titleno", "3");
                }
                else if (filetitle == "Alumni")
                {
                    cmd.Parameters.AddWithValue("@titleno", "4");
                }
                cmd.Parameters.AddWithValue("@type", "insert");
                con.Open();

                int HasRow = (int)cmd.ExecuteScalar();

                if (HasRow > 0)
                {

                    HttpPostedFile file = files[i];
                    OriginalfileName = Convert.ToString(file.FileName);
                    string strFileType = System.IO.Path.GetExtension(OriginalfileName).ToString().ToLower();
                    strFileName = (HasRow + strFileType);
                    string fname = context.Server.MapPath("~/mcqfileupload/" + strFileName);
                    file.SaveAs(fname);
                    SqlConnection conn = new SqlConnection(constr);
                    SqlCommand cmdd = new SqlCommand("sp_mcqmanage", conn);
                    cmdd.Connection = conn;

                    cmdd.CommandType = CommandType.StoredProcedure;
                    cmdd.Parameters.AddWithValue("@mcqid", HasRow);
                    cmdd.Parameters.AddWithValue("@filename", strFileName);
                    cmdd.Parameters.AddWithValue("@type", "Update");
                    conn.Open();
                    cmdd.ExecuteNonQuery();
                    conn.Close();
                }

            }


        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}