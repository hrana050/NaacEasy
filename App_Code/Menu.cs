using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Menu
/// </summary>
public class Menu
{
	public Menu()
	{
	
	}
    public int id { get; set; }
    public string text { get; set; }
    public int? parentid { get; set; }
    public int? menuparentid { get; set; }
    public bool active { get; set; }
    public List<Menu> list { get; set; }
    public string url { get; set; }

}