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
            string loginid = "";
            string loginname = "";
         
            if (context.Session["LoginID"].ToString() != null)
            {
                loginid = context.Session["LoginID"].ToString();
                loginname = context.Session["sessionname"].ToString();
            }
            string filename = context.Request.Form["filename"].ToString();
            string description = context.Request.Form["description"].ToString();
            string getcriteriavalue = context.Request.Form["getcriteriavalue"].ToString();
            context.Response.ContentType = "text/plain";
            string constr = "";
            SqlCommand cmd;
            constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("managedatafile", con);
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
           
            cmd.Parameters.AddWithValue("@filecriteriaid", getcriteriavalue);
            cmd.Parameters.AddWithValue("@filename", filename);
          //  cmd.Parameters.AddWithValue("@filepath", "");
            cmd.Parameters.AddWithValue("@filedescripttion", description);
            cmd.Parameters.AddWithValue("@uploadeduser", loginname);
            cmd.Parameters.AddWithValue("@loginid", loginid);
            cmd.Parameters.AddWithValue("@type", "insert");
          
            con.Open();
            int HasRow = (int)cmd.ExecuteScalar();

            if (HasRow>0)
            {
                string OriginalfileName = "";
                string strFileName = "";
                HttpFileCollection files = context.Request.Files;
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    OriginalfileName = Convert.ToString(file.FileName);
                    string strFileType = System.IO.Path.GetExtension(OriginalfileName).ToString().ToLower();
                    strFileName = (HasRow + strFileType);
                    string fname = context.Server.MapPath("~/UpLoad/" + strFileName);
                    file.SaveAs(fname);
                }
              
                SqlCommand cmdd = new SqlCommand("managedatafile", con);
                cmdd.CommandType = CommandType.StoredProcedure;
                cmdd.Parameters.AddWithValue("@fileid", HasRow);
                cmdd.Parameters.AddWithValue("@filepath", strFileName);

                cmdd.Parameters.AddWithValue("@type", "update");
                cmdd.ExecuteNonQuery();  
            }
            context.Response.Write("File Uploaded Successfully!");
        }
      
    }
  
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}