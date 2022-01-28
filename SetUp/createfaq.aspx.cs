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

public partial class SetUp_createfaq : System.Web.UI.Page
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
        try
        {
            if (Session["User"] != null)
            {
                hash = (Hashtable)Session["User"];
                if (!IsPostBack)
                {
                    bindmenu();
                }

            }
            else
            {
                Response.Redirect("../Login.aspx", false);
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
            ddl_menu.DataSource = dt;
            ddl_menu.DataTextField = "Menuname";
            ddl_menu.DataValueField = "menuid";
            ddl_menu.DataBind();
            ddl_menu.Items.Insert(0, new ListItem("Select Menu", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    [WebMethod]
    public static string addfaq(vmfaq vmfaqobj)
    {
        try
        {
            string constr = "";
            SqlCommand cmd;
            constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("managefaq", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            if (vmfaqobj.type == "Save")
            {
                cmd.Parameters.AddWithValue("@faqsno", 0);
            }
            else
            {
                cmd.Parameters.AddWithValue("@faqsno", vmfaqobj.faqsno);
            }
            cmd.Parameters.AddWithValue("@faqquestion", vmfaqobj.question);
            cmd.Parameters.AddWithValue("@criteriasno", vmfaqobj.criteriasno);
            cmd.Parameters.AddWithValue("@faqanswer", vmfaqobj.answer);
            cmd.Parameters.AddWithValue("@isactive", vmfaqobj.status);
            cmd.Parameters.AddWithValue("@type", vmfaqobj.type);
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
    public static string Getdata(string id)
    {

        string constr = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("managefaq", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@type", "getRecords");
                cmd.Parameters.AddWithValue("@faqsno", id);
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