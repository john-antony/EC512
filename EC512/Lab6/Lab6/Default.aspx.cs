using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab6
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<string>();
                }
                List<string> cart = (List<string>)Session["Cart"];
                StatusLabel.Text = cart.Count == 0 ? "0 items in cart" : $"{cart.Count} items in cart.";
            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            if (ItemList.SelectedIndex < 0)
            {
                StatusLabel.Text = "Select an item";
                return;
            }
            List<string> cart = (List<string>)Session["Cart"];
            cart.Add(ItemList.SelectedValue);
            Session["Cart"] = cart;
            StatusLabel.Text = string.Format("Item added. {0} added in cart.", cart.Count);
            ItemList.ClearSelection();
            
        }

        protected void ViewCartButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewCart.aspx");
        }

    }
}