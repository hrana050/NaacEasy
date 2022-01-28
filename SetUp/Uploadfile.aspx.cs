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
using System.Collections.Generic;

public partial class SetUp_Uploadfile : System.Web.UI.Page
{
    string constr = "";
    string parentid;
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    Hashtable hash;
    string sno;
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

    public void Bindgrid()
    {
        try
        {
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageFiles", con);
            cmd.CommandType = CommandType.StoredProcedure;
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

    public void Clear()
    {
        try
        {
            txt_filename.Text = "";
            ViewState["fileid"] = null;
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
            cmd = new SqlCommand("ManageFiles", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));
            if (ViewState["fileid"] == null)
            {
                cmd.Parameters.AddWithValue("@fileid", 0);
                if (FileUpload1.HasFile)
                {
                    cmd.Parameters.AddWithValue("@Type", "Save");

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('Please Choose File');", true);
                    successdiv.Visible = false;
                }
            }
            else
            {

                cmd.Parameters.AddWithValue("@filename", txt_filename.Text);
                cmd.Parameters.AddWithValue("@filepath", ViewState["filepath"]);
                cmd.Parameters.AddWithValue("@fileid", ViewState["fileid"]);
                cmd.Parameters.AddWithValue("@Type", "Update");
            }
            con.Open();

            int HasRow = (int)cmd.ExecuteScalar();
            updateimage(HasRow);
            con.Close();
            if (HasRow > 0)
            {
                Bindgrid();
                Clear();
                successdiv.Visible = true;
                errordiv.Visible = false;
            }
            else
            {
                errordiv.Visible = true;
                successdiv.Visible = false;

            }

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    public void updateimage(int id)
    {
        string strFileName;
        if (FileUpload1.HasFile)
        {
            string OriginalfileName = Convert.ToString(FileUpload1.FileName);
            string strFileType = System.IO.Path.GetExtension(OriginalfileName).ToString().ToLower();
            strFileName = (id + strFileType);
            FileUpload1.SaveAs(Server.MapPath(("~/UpLoad/" + (strFileName))));
            hash = new Hashtable();
            hash = (Hashtable)Session["User"];
            SqlConnection con = new SqlConnection(constr);
            cmd = new SqlCommand("ManageFiles", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));
            cmd.Parameters.AddWithValue("@filename", txt_filename.Text);
            cmd.Parameters.AddWithValue("@filepath", strFileName);
            cmd.Parameters.AddWithValue("@FileId", id);
            cmd.Parameters.AddWithValue("@Type", "Update");
            con.Open();
            cmd.ExecuteNonQuery();
            Clear();
        }
        else
        {
            if (btn_save.Text == "Save")
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('PLease select file...');", true);
            }
            else
            {

            }
        }
    }
    protected void grdrecord_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "lnkEdit")
            {
                SqlConnection con = new SqlConnection(constr);
                cmd = new SqlCommand("ManageFiles", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FileId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));
                cmd.Parameters.AddWithValue("@Type", "GetRecords");
                con.Open();
                DataTable dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                txt_filename.Text = dt.Rows[0]["filename"].ToString();
                ViewState["filename"] = dt.Rows[0]["filename"].ToString();
                ViewState["filepath"] = dt.Rows[0]["filepath"].ToString();
                ViewState["fileid"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
            else if (e.CommandName == "delete")
            {
                SqlConnection con = new SqlConnection(constr);
                cmd = new SqlCommand("ManageFiles", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FileId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@User", Convert.ToString(hash["Name"].ToString()));
                cmd.Parameters.AddWithValue("@Type", "delete");
                con.Open();
                DataTable dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
                Bindgrid();
                successdiv.Visible = false;
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('Record delete Successfully..!');", true);

            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "validate", "javascript: alert('" + ex.Message + "');", true);
        }
    }

    protected void grdrecord_RowDeleting(object sender, GridViewCommandEventArgs e)
    {

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

    protected void grdrecord_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}