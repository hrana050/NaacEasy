using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for vmtodo
/// </summary>
public class vmtodo
{
	public vmtodo()
	{
	
	}
    public string sno { get; set; }
    public int criteriaid { get; set; }
    public string taskname { get; set; }
    public int assignto { get; set; }
    public string assigndate { get; set; }
    public string enddtae { get; set; }
    public int taskstatus { get; set; }
    public string remark { get; set; }
}