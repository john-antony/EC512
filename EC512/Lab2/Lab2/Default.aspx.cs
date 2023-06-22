using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{

    public partial class Default : System.Web.UI.Page
    {

        protected void convertBtn_Click(object sender, EventArgs e)
        {
            // Clear any previous error messages
            errorLabel.Text = "";

            // Try to parse input values
            if (String.IsNullOrEmpty(decInput.Text) && String.IsNullOrEmpty(hexInput.Text))
            {
                errorLabel.Text = "Please enter a value in one of the input boxes.";
                return;
            }

            uint decimalValue = 0;
            if (!String.IsNullOrEmpty(decInput.Text))
            {
                if (!uint.TryParse(decInput.Text, out decimalValue))
                {
                    errorLabel.Text = "Invalid decimal input value. Please enter a positive integer.";
                    return;
                }
            }

            uint hexValue = 0;
            if (!String.IsNullOrEmpty(hexInput.Text))
            {
                try
                {
                    hexValue = Convert.ToUInt32(hexInput.Text, 16);
                }
                catch
                {
                    errorLabel.Text = "Invalid hexadecimal input value. Please enter a valid hexadecimal string.";
                    return;
                }
            }

            // Perform conversion and update result boxes
            if (decimalValue != 0)
            {
                hexInput.Text = decimalValue.ToString("X");
            }
            else if (hexValue != 0)
            {
                decInput.Text = hexValue.ToString();
            }
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            decInput.Text = "";
            hexInput.Text = "";
            errorLabel.Text = "";
        }
    }
}