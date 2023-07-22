using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MPEmpleado : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Delogueo_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
}
