using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.IO;
using System.Drawing;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Collections.Generic;
using System.Web;
using Org.BouncyCastle.Asn1.Ocsp;

public partial class Home_naaceasy : System.Web.UI.Page
{

    string constr = "";
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    Hashtable hash;
    protected void page_Init()
    {
        constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        da = new SqlDataAdapter();
        cmd = new SqlCommand();
        hash = new Hashtable();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        binduser();
        bindmenu();
    }
    public void binduser()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("Manageusers", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", null);
            cmd.Parameters.AddWithValue("@User", null);
            cmd.Parameters.AddWithValue("@Type", "GetRecords");
            con.Open();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ddl_todostaff.DataSource = dt;
            ddl_todostaff.DataTextField = "name";
            ddl_todostaff.DataValueField = "loginid";
            ddl_todostaff.DataBind();

            ddl_todostaff.Items.Insert(0, new ListItem("Select User", "0"));

            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    public void bindmenu()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageMenu", con);
            cmd.Parameters.AddWithValue("@User", null);
            cmd.Parameters.AddWithValue("@Type", "GetRecords_status");
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ddl_todometric.DataSource = dt;
            ddl_todometric.DataTextField = "Menuname";
            ddl_todometric.DataValueField = "Menuid";
            ddl_todometric.DataBind();
            ddl_todometric.Items.Insert(0, new ListItem("Select Criteria", "0"));
       
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    [WebMethod]
    public static string criteriaparentlist()
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("getmenuparentlist", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@type", "criteria");
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds.GetXml();
                }
            }
        }

    }
    [WebMethod]
    public static string criteriakeylist(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("getmenuparentlist", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@type", "key");
                cmd.Parameters.AddWithValue("@keysno", id);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds.GetXml();
                }
            }
        }

    }
       [WebMethod]
    public static string criteriametricslist(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("getmenuparentlist", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@type", "metric");
                cmd.Parameters.AddWithValue("@keysno", id);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds.GetXml();
                }
            }
        }

    }
       [WebMethod]
       public static string addmeeting(vmmeeting vmmeetingobj)
       {
           try
           {
             
                   string uservalue = vmmeetingobj.contactperson;
                   string prestaff = vmmeetingobj.previousstaff;
                   string premetric = vmmeetingobj.previousmetric;
                   string yourString = premetric.Replace(" ", ",");
                   string criteriavalue = vmmeetingobj.meetingcriteria;
                   string constr = "";
                   SqlCommand cmd;
                   constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
                   SqlConnection con = new SqlConnection(constr);
                   cmd = new SqlCommand("insertmeeting", con);
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Connection = con;
                   cmd.Parameters.AddWithValue("@meetingname", vmmeetingobj.meetingtopic);
                
                   cmd.Parameters.AddWithValue("@meetingdate", vmmeetingobj.meetingdate);
                   cmd.Parameters.AddWithValue("@meetingtime", vmmeetingobj.meetingtime);
                   cmd.Parameters.AddWithValue("@description", vmmeetingobj.remark);
               
                   if (vmmeetingobj.meetingsno != "")
                   {
                       if (uservalue == "")
                       {
                           cmd.Parameters.AddWithValue("@contactperson", prestaff + ",");
                       }
                       else{
                             cmd.Parameters.AddWithValue("@contactperson", uservalue);
                       }
                       if (criteriavalue == "")
                       {
                           cmd.Parameters.AddWithValue("@criteriaid", premetric);
                       }
                       else
                       {
                           cmd.Parameters.AddWithValue("@criteriaid", criteriavalue);
                       }
                       cmd.Parameters.AddWithValue("@meetingid", vmmeetingobj.meetingsno);
                       cmd.Parameters.AddWithValue("@type", "update");
                   }
                   else
                   {
                       cmd.Parameters.AddWithValue("@contactperson", uservalue);
                       cmd.Parameters.AddWithValue("@criteriaid", criteriavalue);
                       cmd.Parameters.AddWithValue("@type", "insert");
                   }
                   con.Open();
                  cmd.ExecuteNonQuery();
                   SqlCommand cmd_1 = new SqlCommand("getmeetingid", con);
                   cmd_1.CommandType = CommandType.StoredProcedure;
                   DataTable dt = new DataTable();
                   SqlDataAdapter da = new SqlDataAdapter(cmd_1);
                   da.Fill(dt);
                   con.Close();
                
               return "success";
           }
           catch (Exception ac)
           {
               return "Error";
           }
       }

       [WebMethod]
       public static string getmeetingtask(string id,string type)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("insertmeeting", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@type", type);
                   cmd.Parameters.AddWithValue("@meetingid", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
       [WebMethod]
       public static string addtodo(vmtodo vmtodoobj)
       {
           try
           {
               string constr = "";
               SqlCommand cmd;
               constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
               SqlConnection con = new SqlConnection(constr);
               cmd = new SqlCommand("inserttodo", con);
               cmd.CommandType = CommandType.StoredProcedure;
               cmd.Connection = con;
               cmd.Parameters.AddWithValue("@criteriaid", vmtodoobj.criteriaid);
               cmd.Parameters.AddWithValue("@taskname", vmtodoobj.taskname);
               cmd.Parameters.AddWithValue("@assignto", vmtodoobj.assignto);
               cmd.Parameters.AddWithValue("@assigndate", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
               cmd.Parameters.AddWithValue("@enddate", vmtodoobj.enddtae);
               cmd.Parameters.AddWithValue("@taskstatus", "0");
               cmd.Parameters.AddWithValue("@todoremark", vmtodoobj.remark);
               //if (vmtodoobj.sno != "")
               //{
               //    cmd.Parameters.AddWithValue("@sno", vmtodoobj.sno);
               //    cmd.Parameters.AddWithValue("@type", "Edit");
               //}
               //else
               //{
                   cmd.Parameters.AddWithValue("@type", "insert");
               //}

               con.Open();
               cmd.ExecuteNonQuery();
               con.Close();
               return "success";
           }
           catch (Exception ac)
           {
               return "Error";
           }
       }
       [WebMethod]
       public static string gettodotask()
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("inserttodo", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@type", "select");
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }

       [WebMethod]
       public static string getmetriclist(string id)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("getmetriclist", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@keysno", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
       [WebMethod]
       public static string getmetricdetails(string id)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("getmetricdetails", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@keysno", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
       [WebMethod]
       public static string getkeymetriclist(string id)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("getkeymetriclist", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@metricid", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
       [WebMethod]

       public static string getcompssr(string id)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("managecompssr", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@type", "select");
                   cmd.Parameters.AddWithValue("@criteria", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
     [WebMethod]
       public static string getssrdetails(string id)
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("managecompssr", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@type", "getRecords");
                   cmd.Parameters.AddWithValue("@sno", id);
                   cmd.Connection = con;
                   using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       sda.Fill(ds);
                       return ds.GetXml();
                   }
               }
           }

       }
     [WebMethod]
     public static string getprofile(string id)
     {
         string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
         using (SqlConnection con = new SqlConnection(constr))
         {
             using (SqlCommand cmd = new SqlCommand("managecompssr", con))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.AddWithValue("@type", "GetRecords");
                 cmd.Parameters.AddWithValue("@userid", id);
                 cmd.Connection = con;
                 using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                 {
                     DataSet ds = new DataSet();
                     sda.Fill(ds);
                     return ds.GetXml();
                 }
             }
         }

     }
     [WebMethod]
     public static string getstafflist()
     {

         string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
         using (SqlConnection con = new SqlConnection(constr))
         {
             using (SqlCommand cmd = new SqlCommand("Manageusers", con))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Connection = con;
                 cmd.Parameters.AddWithValue("@username", null);
                 cmd.Parameters.AddWithValue("@User", null);
                 cmd.Parameters.AddWithValue("@Type", "GetRecords");
                 using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                 {
                     DataSet ds = new DataSet();
                     sda.Fill(ds);
                     return ds.GetXml();
                 }
             }
         }

     }
       [WebMethod]
     public static void SaveStreamAsFile(string filePath, Stream inputStream, string fileName)
     {
         DirectoryInfo info = new DirectoryInfo(filePath);
         if (!info.Exists)
         {
             info.Create();
         }

         string path = Path.Combine(filePath, fileName);
         using (FileStream outputFileStream = new FileStream(path, FileMode.Create))
         {
             inputStream.CopyTo(outputFileStream);
         }
     } 
     [WebMethod]
     public static string insert_data(vmdatastructure vmdatastructureobj)
     {
   
         string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
         using (SqlConnection con = new SqlConnection(constr))
         {
             using (SqlCommand cmd = new SqlCommand("sp_data_structure", con))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Connection = con;
                 cmd.Parameters.AddWithValue("@dataid", vmdatastructureobj.dataid);
                 cmd.Parameters.AddWithValue("@criteriaid", vmdatastructureobj.criteriaid);
                 cmd.Parameters.AddWithValue("@keyindecator", vmdatastructureobj.keyindecator);
                 cmd.Parameters.AddWithValue("@metric", vmdatastructureobj.metricid);
                 cmd.Parameters.AddWithValue("@metrictitle", vmdatastructureobj.metrictitle);
                 cmd.Parameters.AddWithValue("@programname", vmdatastructureobj.programname_112);
                 cmd.Parameters.AddWithValue("@programcode", vmdatastructureobj.programcode_112);
                 cmd.Parameters.AddWithValue("@coursename", vmdatastructureobj.coursename_132);
                 cmd.Parameters.AddWithValue("@yearof_introduction", vmdatastructureobj.yearof_introduction_112);
                 cmd.Parameters.AddWithValue("@cbcs_ecs_status", vmdatastructureobj.cbcs_ecs_status_112);
                 cmd.Parameters.AddWithValue("@yearof_revision", vmdatastructureobj.yearof_revision_112);
                 cmd.Parameters.AddWithValue("@yearof_cbcs_ecs_imp", vmdatastructureobj.yearof_cbcs_ecs_imp_112);
                 cmd.Parameters.AddWithValue("@contentchangepast_5", vmdatastructureobj.contentchangepast_5_112);
                 cmd.Parameters.AddWithValue("@course_code", vmdatastructureobj.course_code_132);
                 cmd.Parameters.AddWithValue("@employabilitiyskill_development", vmdatastructureobj.employabilitiyskill_development);
                 cmd.Parameters.AddWithValue("@yearof_offering", vmdatastructureobj.yearof_offering_132);
                 cmd.Parameters.AddWithValue("@times_offered", vmdatastructureobj.times_offered_132);
                 cmd.Parameters.AddWithValue("@durationof_course", vmdatastructureobj.durationof_course_132);
                 cmd.Parameters.AddWithValue("@enroll_student", vmdatastructureobj.enroll_student_132);
                 cmd.Parameters.AddWithValue("@stu_completing", vmdatastructureobj.stu_completing_132);
                 cmd.Parameters.AddWithValue("@qualitative", vmdatastructureobj.qualitative);
                 cmd.Parameters.AddWithValue("@coursename_113", vmdatastructureobj.nameofcourse_113);

                 cmd.Parameters.AddWithValue("@coursecode_113", vmdatastructureobj.coursecode_113);
                 cmd.Parameters.AddWithValue("@courseintro_113", vmdatastructureobj.yearof_intro_113);
                 cmd.Parameters.AddWithValue("@coursecontent_113", vmdatastructureobj.contentactivity_113);

                 cmd.Parameters.AddWithValue("@programcode_134", vmdatastructureobj.programcode_134);
                 cmd.Parameters.AddWithValue("@programname_134", vmdatastructureobj.programname_134);
                 cmd.Parameters.AddWithValue("@studentname_134", vmdatastructureobj.studentname_134);

                 if (vmdatastructureobj.type == "update" && vmdatastructureobj.metrictype == "qualitative")
                 {
                     cmd.Parameters.AddWithValue("@type", "updateQualitative");
                 }
                 else if (vmdatastructureobj.type == "update" && vmdatastructureobj.metrictype == "list")
                 {
                     cmd.Parameters.AddWithValue("@type", "updatelist");
                 }
                 else if (vmdatastructureobj.type == "insert" && vmdatastructureobj.metrictype == "list")
                 {
                     cmd.Parameters.AddWithValue("@type", "insert");
                 }
              
                 con.Open();
                 cmd.ExecuteNonQuery();
                 con.Close();
               
             }
         }
         return "success";
     }
     [WebMethod]
     public static string getmetricdatalist(string id,string dataid,string metrictype)
     {
         string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
         using (SqlConnection con = new SqlConnection(constr))
         {
             using (SqlCommand cmd = new SqlCommand("sp_data_structure", con))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Connection = con;
                 cmd.Parameters.AddWithValue("@metric", id);
                 cmd.Parameters.AddWithValue("@dataid", dataid);
                 if (metrictype=="list")
                 {
                     cmd.Parameters.AddWithValue("@Type", "get_112_122list");
                 }
                 else if (metrictype == "qualitative")
                 {
                     cmd.Parameters.AddWithValue("@Type", "qualitative");
                 }
                 else if (metrictype == "mcq")
                 {
                     cmd.Parameters.AddWithValue("@Type", "mcq");
                 }
                 using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                 {
                     DataSet ds = new DataSet();
                     sda.Fill(ds);
                     return ds.GetXml();
                 }
             }
         }

     }

     [WebMethod]
     public static string filelist(string id)
     {

         string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
         using (SqlConnection con = new SqlConnection(constr))
         {
             using (SqlCommand cmd = new SqlCommand("sp_metricdatafile", con))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.AddWithValue("@type", "list");
                 cmd.Parameters.AddWithValue("@dataid", id);
                 cmd.Connection = con;
                 using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                 {
                     DataSet ds = new DataSet();
                     sda.Fill(ds);
                     return ds.GetXml();
                 }
             }
         }

     }
     [WebMethod]
     public static string deletefile(string id)
     {
         try
         {
             string constr = "";
             SqlCommand cmd;
             constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
             SqlConnection con = new SqlConnection(constr);
             cmd = new SqlCommand("sp_metricdatafile", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;
             cmd.Parameters.AddWithValue("@fileid", id);
             cmd.Parameters.AddWithValue("@type", "delete");
             con.Open();
             cmd.ExecuteNonQuery();
             con.Close();
             return "success";
         }
         catch (Exception ac)
         {
             return "Error";
         }

     }
      [WebMethod]
    public static string removefile()
     {
         try
         {
             string constr = "";
             SqlCommand cmd;
             constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
             SqlConnection con = new SqlConnection(constr);
             cmd = new SqlCommand("sp_metricdatafile", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Connection = con;
             cmd.Parameters.AddWithValue("@type", "removefile");
             con.Open();
             cmd.ExecuteNonQuery();
             con.Close();
             return "success";
         }
         catch (Exception ac)
         {
             return "Error";
         }
     }

      [WebMethod]
      public static string insertlink(string dataid,string metricid,string linkval)
      {

          string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
          using (SqlConnection con = new SqlConnection(constr))
          {
              using (SqlCommand cmd = new SqlCommand("sp_metriclinkfile", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@type", "insert");
                  cmd.Parameters.AddWithValue("@dataid", dataid);
                  cmd.Parameters.AddWithValue("@metricid", metricid);
                  cmd.Parameters.AddWithValue("@filelink", linkval);
                  cmd.Connection = con;
                  con.Open();
                  cmd.ExecuteNonQuery();
                  con.Close();
              }
          }
          return "success";
      }
      [WebMethod]
      public static string filelinklist(string id)
      {

          string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
          using (SqlConnection con = new SqlConnection(constr))
          {
              using (SqlCommand cmd = new SqlCommand("sp_metriclinkfile", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@type", "list");
                  cmd.Parameters.AddWithValue("@dataid", id);
                  cmd.Connection = con;
                  using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                  {
                      DataSet ds = new DataSet();
                      sda.Fill(ds);
                      return ds.GetXml();
                  }
              }
          }

      }
      [WebMethod]
      public static string deletelink(string id)
      {
          try
          {
              string constr = "";
              SqlCommand cmd;
              constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
              SqlConnection con = new SqlConnection(constr);
              cmd = new SqlCommand("sp_metriclinkfile", con);
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Connection = con;
              cmd.Parameters.AddWithValue("@fileid", id);
              cmd.Parameters.AddWithValue("@type", "delete");
              con.Open();
              cmd.ExecuteNonQuery();
              con.Close();
              return "success";
          }
          catch (Exception ac)
          {
              return "Error";
          }

      }

      [WebMethod]
      public static string removelink()
      {
          try
          {
              string constr = "";
              SqlCommand cmd;
              constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
              SqlConnection con = new SqlConnection(constr);
              cmd = new SqlCommand("sp_metriclinkfile", con);
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Connection = con;
              cmd.Parameters.AddWithValue("@type", "removefile");
              con.Open();
              cmd.ExecuteNonQuery();
              con.Close();
              return "success";
          }
          catch (Exception ac)
          {
              return "Error";
          }
      }

      [WebMethod]
      public static string getmcqlist(string id,string title)
      {

          string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
          using (SqlConnection con = new SqlConnection(constr))
          {
              using (SqlCommand cmd = new SqlCommand("sp_mcqmanage", con))
              {
                  cmd.CommandType = CommandType.StoredProcedure;
                  if (title == "non")
                  {
                      cmd.Parameters.AddWithValue("@type", "list");
                      cmd.Parameters.AddWithValue("@metricid", id);
                  }
                  else
                  {
                      cmd.Parameters.AddWithValue("@type", "delete");
                      cmd.Parameters.AddWithValue("@mcqid", id);
                  }
                  cmd.Connection = con;
                  using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                  {
                      DataSet ds = new DataSet();
                      sda.Fill(ds);
                      return ds.GetXml();
                  }
              }
          }

      }

}