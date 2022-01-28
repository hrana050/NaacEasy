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


public partial class SetUp_Menu : System.Web.UI.Page
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
                    Bindgrid();
                    menubind();
                   
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

    public enum MenuType
    {
        All = 0,
        SetUp = 1,
        ImportData = 2,
        Actions = 3,
        Reports = 4
    }


    public void Bindgrid()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageMenu", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Menu", null);
            cmd.Parameters.AddWithValue("@User", null);
            cmd.Parameters.AddWithValue("@Type", "GetRecords");
            con.Open();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();
            grdrecord.DataSource = dt;
            grdrecord.DataBind();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }

    }
    public void menubind()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageMenu", con);
            cmd.Parameters.AddWithValue("@Menu", null);
            cmd.Parameters.AddWithValue("@User", null);
            cmd.Parameters.AddWithValue("@Type", "GetRecords");
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ddl_menu.DataSource = dt;
            ddl_menu.DataTextField = "Menuname";
            ddl_menu.DataValueField = "Menuid";
            ddl_menu.DataBind();
            ddl_menu.Items.Insert(0, new ListItem("New Base Menu", "0"));
            con.Close();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    public void Clear()
    {
        try
        {
            txt_menu.Text = string.Empty;
            ViewState["MenuId"] = null;
            btn_save.Text = "Save";
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            hash = new Hashtable();
            hash = (Hashtable)Session["User"];
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageMenu", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Menu", txt_menu.Text);
            cmd.Parameters.AddWithValue("@parentid", ddl_menu.SelectedValue);
            cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));

            if (ViewState["MenuId"] == null)
            {
                cmd.Parameters.AddWithValue("@MenuID", 0);
                cmd.Parameters.AddWithValue("@Type", "Save");
            }
            else
            {
                cmd.Parameters.AddWithValue("@MenuID", ViewState["MenuId"]);
                cmd.Parameters.AddWithValue("@Type", "Update");
            }
            con.Open();

            int HasRow = (int)cmd.ExecuteScalar();
            con.Close();
            if (HasRow == 1)
            {
                Bindgrid();
                menubind();
                Clear();
                successdiv.Visible = true;
                errordiv.Visible = false;
            }
            else
            {
                errordiv.Visible = true;
                successdiv.Visible = false;
                lblerrormsg.Text = txt_menu.Text;
            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    protected void grdrecord_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "lnkEdit")
            {
                SqlConnection con = new SqlConnection(constr);
                cmd = new SqlCommand("ManageMenu", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MenuID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@Menu", txt_menu.Text);
                cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));
                cmd.Parameters.AddWithValue("@Type", "GetRecords");
                con.Open();
                DataTable dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                ddl_menu.SelectedValue = dt.Rows[0]["parentid"].ToString();
                txt_menu.Text = dt.Rows[0]["Menuname"].ToString();
                //if (dt.Rows[0]["IsActive"].ToString() == "0")
                //{
                //    ddl_menu.SelectedValue = "0";
                //}
                //else
                //{
                //    ddl_menu.SelectedValue = "1";
                //}

                ViewState["MenuId"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Clear();
            Bindgrid();

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    [WebMethod]
    public static string ChecklevelAvailability(string levelname)
    {
        string retval = "";
        string conString = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        SqlConnection conn = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("CheckmenuAvailability", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@menuname", levelname);
        conn.Open();
        int HasRow = (int)cmd.ExecuteScalar();
        if (HasRow > 0)
        {
            retval = "true";
        }
        else
        {
            retval = "false";
        }
        return retval;
    }
    
}