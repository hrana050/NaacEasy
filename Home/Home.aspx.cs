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


public partial class Home_Home : System.Web.UI.Page
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
        //try
        //{
        //    if (Session["User"] != null && Session["u_role"].ToString() == "Admin")
        //    {
        //        hash = (Hashtable)Session["User"];
        //        if (!IsPostBack)
        //        {


        //        }

        //    }
        //    else if (Session["User"] != null && Session["u_role"].ToString() == "Staff")
        //    {
        //        Response.Redirect("../Home/index.aspx", false);
        //    }
        //    else
        //    {
        //        Response.Redirect("../Login.aspx", false);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        //}
    }


}