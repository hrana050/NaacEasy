<%@ WebHandler Language="C#" Class="fileupload" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.SessionState;

public class fileupload : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
           
            string metricid = context.Request.Form["metricid"].ToString();
            string dataid = context.Request.Form["dataid"].ToString();
            context.Response.ContentType = "text/plain";
            string OriginalfileName = "";
            string strFileName = "";
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
              
                string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand("sp_metricdatafile", con);
                cmd.Connection = con;
             
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@metricid", metricid);
                cmd.Parameters.AddWithValue("@dataid", dataid);
                cmd.Parameters.AddWithValue("@datafilename", strFileName);
                cmd.Parameters.AddWithValue("@filetitle", "Test");
                cmd.Parameters.AddWithValue("@type", "insert");
                con.Open();
              
                int HasRow = (int)cmd.ExecuteScalar();
              
                if (HasRow > 0)
                {

                    HttpPostedFile file = files[i];
                    OriginalfileName = Convert.ToString(file.FileName);
                    string strFileType = System.IO.Path.GetExtension(OriginalfileName).ToString().ToLower();
                    strFileName = (HasRow + strFileType);
                    string fname = context.Server.MapPath("~/Datametricfiles/" + strFileName);
                    file.SaveAs(fname);
                    SqlConnection conn = new SqlConnection(constr);
                    SqlCommand cmdd = new SqlCommand("sp_metricdatafile", conn);
                    cmdd.Connection = conn;

                    cmdd.CommandType = CommandType.StoredProcedure;
                    cmdd.Parameters.AddWithValue("@fileid", HasRow);
                    cmdd.Parameters.AddWithValue("@datafilename", strFileName);
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