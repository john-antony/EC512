using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab6
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> cart = (List<string>)Session["Cart"];
                CartList.DataSource = cart;
                CartList.DataBind();
            }
        }

        protected void ContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void EmptyCart_Click(object sender, EventArgs e)
        {
            Session["Cart"] = new List<string>();
            CartList.Items.Clear();

        }
    }
}