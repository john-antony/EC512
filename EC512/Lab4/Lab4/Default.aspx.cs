using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab4
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the currencies to the DropDownList control
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\janto\\OneDrive\\Desktop\\EC512\\Lab4\\Lab4\\App_Data\\Conversions.mdf;Integrated Security=True";
                string query = "SELECT Currency, Rate FROM Rates ORDER BY Currency";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string currency = reader["Currency"].ToString();
                                decimal rate = (decimal)reader["Rate"];
                                ListItem item = new ListItem(currency, rate.ToString());
                                ddlCurrency.Items.Add(item);
                            }
                        }
                    }
                }
            }
        }

        protected void btnToUSD_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                decimal amount = decimal.Parse(txtAmount.Text);
                decimal rate = decimal.Parse(ddlCurrency.SelectedValue);
                decimal usdAmount = amount / rate;
                lblResult.Text = string.Format("{0:C}", usdAmount);
            }
        }

        protected void btnFromUSD_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                decimal amount = decimal.Parse(txtAmount.Text);
                decimal rate = decimal.Parse(ddlCurrency.SelectedValue);
                decimal convertedAmount = amount * rate;
                lblResult.Text = string.Format("{0:C}", convertedAmount);
            }
        }
    }
}