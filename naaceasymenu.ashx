<%@ WebHandler Language="C#" Class="naaceasymenu" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.SessionState;
public class naaceasymenu : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        string cs = ConfigurationManager.ConnectionStrings["myconnectionstring"].ConnectionString;
        string loginid = "";
        string logintype = "";
        //if (context.Session["LoginID"].ToString() != null)
        //{
        //    loginid = context.Session["LoginID"].ToString();
        //    logintype = context.Session["u_role"].ToString();
        //}
        List<Menu> listmenu = new List<Menu>();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("getnaacmenumaster", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usertype", "Admin");
            cmd.Parameters.AddWithValue("@userid", 0);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Menu menuobj = new Menu();
                menuobj.id = Convert.ToInt32(rdr["Menuid"]);
                menuobj.menuparentid = Convert.ToInt32(rdr["parentid"]);
                menuobj.text = rdr["Menuname"].ToString();
                menuobj.parentid = rdr["parentid"] != "0" ? Convert.ToInt32(rdr["parentid"]) : (int?)null;
                menuobj.active = Convert.ToBoolean(rdr["isactive"]);
                menuobj.url = rdr["Menuid"].ToString();
                listmenu.Add(menuobj);

            }

        }

        List<Menu> menutree = getmenutree(listmenu, 0);
        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(menutree));
    }

    private List<Menu> getmenutree(List<Menu> list, int? parentid)
    {
        return list.Where(x => x.parentid == parentid).Select(x => new Menu()
        {
            id = x.id,
            text = x.text,
            parentid = x.parentid,
            menuparentid = x.menuparentid,
            active = x.active,
            url = x.url,
            list = getmenutree(list, x.id)
        }).ToList();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}