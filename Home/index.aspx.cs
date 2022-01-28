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


public partial class Home_index : System.Web.UI.Page
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
        //if (!IsPostBack)
        //{
        //    binduser();
        //    bindmenu();
        //    bindwiki();
        //}
        try
        {
            if (Session["User"] != null)
            {
                if (Session["u_role"].ToString() == "Admin")
                {
                    //lblgoback.Visible = true;
                    //spanid.Visible = true;
                }
                else { }
                if (!IsPostBack)
                {
                    binduser();
                    bindmenu();
                    bindwiki();
                    hash = (Hashtable)Session["User"];
                 //   lbl_user_1.Text = Convert.ToString(hash["Name"].ToString());
                  //  lbl_user_2.Text = Convert.ToString(hash["Name"].ToString());
                  //  lblemail.Text = Convert.ToString(Session["emailid"].ToString());
                  //  lblcontact.Text = Convert.ToString(Session["contactno"].ToString());
                    if (Session["LastLogin"].ToString().Length > 0)
                    {
                   //     lbllastlogin.Text = Convert.ToDateTime(Session["LastLogin"].ToString()).ToString("dd-MMM-yyyy HH:mm:ss tt");
                    }
                    else
                    {
                     //   lbllastlogin.Text = string.Empty;
                    }

                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
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
            ddl_criteria.DataSource = dt;
            ddl_criteria.DataTextField = "Menuname";
            ddl_criteria.DataValueField = "Menuid";
            ddl_criteria.DataBind();
            //ddl_criteria.Items.Insert(0, new ListItem("Select Criteria", "0"));
            ddl_updatecriteria.DataSource = dt;
            ddl_updatecriteria.DataTextField = "Menuname";
            ddl_updatecriteria.DataValueField = "Menuid";
            ddl_updatecriteria.DataBind();

            ddl_todocriteria.DataSource = dt;
            ddl_todocriteria.DataTextField = "Menuname";
            ddl_todocriteria.DataValueField = "Menuid";
            ddl_todocriteria.DataBind();

            ddl_datacriteria.DataSource = dt;
            ddl_datacriteria.DataTextField = "Menuname";
            ddl_datacriteria.DataValueField = "Menuid";
            ddl_datacriteria.DataBind();

            ddl_datacriteria.Items.Insert(0, new ListItem("Select Criteria", "0"));
            ddl_todocriteria.Items.Insert(0, new ListItem("Select Criteria", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
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
            //txt_person.Items.Insert(0, new ListItem("Select User", "0"));
            ddl_updateuser.DataSource = dt;
            ddl_updateuser.DataTextField = "name";
            ddl_updateuser.DataValueField = "loginid";
            ddl_updateuser.DataBind();
            //ddl_updateuser.Items.Insert(0, new ListItem("Select User", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    public void bindwiki()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("managewiki", con);
            cmd.Parameters.AddWithValue("@User", null);
            cmd.Parameters.AddWithValue("@Type", "getRecords_status");
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dl_wikidetails.DataSource = dt;
            dl_wikidetails.DataBind();
            DataList1.DataSource = dt;
            DataList1.DataBind();
            DataList2.DataSource = dt;
            DataList2.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }


    [WebMethod]
    public static string adddetails(wikidetails Details)
    {
        try
        {
            string constr = "";
            SqlCommand cmd;
            constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("updatewikidetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@wikiid", Details.wikiid);
            cmd.Parameters.AddWithValue("@wiki", Details.details);
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
            cmd.Parameters.AddWithValue("@assigndate", vmtodoobj.assigndate);
            cmd.Parameters.AddWithValue("@enddate", vmtodoobj.enddtae);
            cmd.Parameters.AddWithValue("@taskstatus", "0");
            cmd.Parameters.AddWithValue("@todoremark", vmtodoobj.remark);
            if (vmtodoobj.sno != "")
            {
                cmd.Parameters.AddWithValue("@sno", vmtodoobj.sno);
                cmd.Parameters.AddWithValue("@type", "Edit");
            }
            else
            {
                cmd.Parameters.AddWithValue("@type", "insert");
            }

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
    public static string addmeeting(vmmeeting vmmeetingobj)
    {
        try
        {
            if (vmmeetingobj.linksno == "0" || vmmeetingobj.linksno == "")
            {
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
            }
            else
            {
                string constr = "";
                SqlCommand cmd;
                constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                cmd = new SqlCommand("ManageMeetinglinkuser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@sno", vmmeetingobj.linksno);
                cmd.Parameters.AddWithValue("@userid", vmmeetingobj.contactperson);
                cmd.Parameters.AddWithValue("@meetingid", vmmeetingobj.meetingsno);
                cmd.Parameters.AddWithValue("@criteriaid", vmmeetingobj.meetingcriteria);
                cmd.Parameters.AddWithValue("@remark", vmmeetingobj.remark);
                cmd.Parameters.AddWithValue("@type", "update");
                con.Open();
                cmd.ExecuteNonQuery();
            }
            return "success";
        }
        catch (Exception ac)
        {
            return "Error";
        }
    }
    [WebMethod]
    public static string deletemeeting(string id)
    {
        try
        {
            string constr = "";
            SqlCommand cmd;
            constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageMeetinglinkuser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@sno", id);
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
    public static string deletetodo(string id)
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
            cmd.Parameters.AddWithValue("@sno", id);
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

    private void GetChildRows(DataRow dr, TreeNode tn)
    {

        DataRow[] childRows = dr.GetChildRows("ChildRows");
        foreach (DataRow childRow in childRows)
        {
            TreeNode childTreeNode = new TreeNode();
            childTreeNode.Text = childRow["Menuname"].ToString();
            childTreeNode.Value = childRow["Menuid"].ToString();
            tn.ChildNodes.Add(childTreeNode);
            if (childRow.GetChildRows("ChildRows").Length > 0)
            {
                //if (childRow["fileupload"].ToString() != "" && childRow["fileupload"].ToString() != null)
                //{
                //    // childTreeNode.Text = childRow["fileupload"].ToString();
                //}

                GetChildRows(childRow, childTreeNode);
            }
        }
    }
    [WebMethod]
    public static string gettodotask(string id)
    {
        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("inserttodo", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "select");
                cmd.Parameters.AddWithValue("@criteriaid", id);
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
    public static string getmeetingtask(string id)
    {
        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("insertmeeting", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "select");
                cmd.Parameters.AddWithValue("@criteriaid", id);
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

    public static string getfaq(string id)
    {
        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("managefaq", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "select");
                cmd.Parameters.AddWithValue("@criteriasno", id);
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
    public static string getcomtodotask(string id)
    {
        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("inserttodo", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "selectcom");
                cmd.Parameters.AddWithValue("@criteriaid", id);
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
    [System.Web.Services.WebMethod]
    public static string updatetodo(string id, string taskstatus)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("inserttodo", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sno", id);
                cmd.Parameters.AddWithValue("@taskstatus", taskstatus);
                cmd.Parameters.AddWithValue("@type", "update");
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
    public static string getmeetingdetails(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("insertmeeting", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "Edit");
                cmd.Parameters.AddWithValue("@linksno", id);
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
    public static string gettodotaskdetails(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("inserttodo", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "selecttodo");
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

   
    protected void lnklogout_Click(object sender, EventArgs e)
    {
        try
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    protected void lblgoback_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../Home/Home.aspx");
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    [System.Web.Services.WebMethod]
    public static string filelist(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("managedatafile", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "list");
                cmd.Parameters.AddWithValue("@filecriteriaid",id);
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
    public static string deletelist(string id)
    {
        try
        {
            string constr = "";
            SqlCommand cmd;
            constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("managedatafile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@sno", id);
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
}