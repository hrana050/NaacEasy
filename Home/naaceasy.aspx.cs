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
            txt_person.DataSource = dt;
            txt_person.DataTextField = "name";
            txt_person.DataValueField = "loginid";
            txt_person.DataBind();
            txt_person.Items.Insert(0, new ListItem("Select User", "0"));

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
               //if (vmmeetingobj.linksno == "0" || vmmeetingobj.linksno == "")
               //{
                   string uservalue = vmmeetingobj.contactperson;
                   string[] userlist = uservalue.Trim().Split(',');
                   string criteriavalue = vmmeetingobj.meetingcriteria;
                   string[] criterialist = criteriavalue.Trim().Split(',');
                   int j = userlist.Length;
                   int i = 0;
                   int k = criterialist.Length;
                   int l = 0;
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
                   if (vmmeetingobj.meetingsno != "")
                   {
                       cmd.Parameters.AddWithValue("@linksno", vmmeetingobj.meetingsno);
                       cmd.Parameters.AddWithValue("@type", "update");
                   }
                   else
                   {
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
                   string meetingid = dt.Rows[0]["meetingid"].ToString();
                   for (i = 0; i < j; i++)
                   {
                       string userid = userlist[i];
                       if (userid != "")
                       {
                           for (l = 0; l < k; l++)
                           {
                               string criteriaid = criterialist[l];
                               if (criteriaid != "")
                               {
                                   string connectionstring = "";
                                   SqlCommand cmdd;
                                   connectionstring = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
                                   SqlConnection conn = new SqlConnection(connectionstring);
                                   cmdd = new SqlCommand("ManageMeetinglinkuser", conn);
                                   cmdd.CommandType = CommandType.StoredProcedure;
                                   cmdd.Connection = conn;
                                   cmdd.Parameters.AddWithValue("@meetingid", meetingid);
                                   cmdd.Parameters.AddWithValue("@userid", userid);
                                   cmdd.Parameters.AddWithValue("@criteriaid", criteriaid);
                                   cmdd.Parameters.AddWithValue("@type", "insert");
                                   conn.Open();
                                   cmdd.ExecuteNonQuery();
                                   conn.Close();
                               }
                           }
                       }
                   }

                   con.Close();
               //}
               //else
               //{
               //    string constr = "";
               //    SqlCommand cmd;
               //    constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
               //    SqlConnection con = new SqlConnection(constr);
               //    cmd = new SqlCommand("ManageMeetinglinkuser", con);
               //    cmd.CommandType = CommandType.StoredProcedure;
               //    cmd.Connection = con;
               //    cmd.Parameters.AddWithValue("@sno", vmmeetingobj.linksno);
               //    cmd.Parameters.AddWithValue("@userid", vmmeetingobj.contactperson);
               //    cmd.Parameters.AddWithValue("@meetingid", vmmeetingobj.meetingsno);
               //    cmd.Parameters.AddWithValue("@criteriaid", vmmeetingobj.meetingcriteria);
               //    cmd.Parameters.AddWithValue("@remark", vmmeetingobj.remark);
               //    cmd.Parameters.AddWithValue("@type", "update");
               //    con.Open();
               //    cmd.ExecuteNonQuery();
               //}
               return "success";
           }
           catch (Exception ac)
           {
               return "Error";
           }
       }

       [WebMethod]
       public static string getmeetingtask()
       {
           string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("insertmeeting", con))
               {
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@type", "meetingnoteslist");
               //    cmd.Parameters.AddWithValue("@criteriaid", id);
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