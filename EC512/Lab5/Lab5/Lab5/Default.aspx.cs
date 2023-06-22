using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab5
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            if (rbCandidates.SelectedItem == null)
            {
                lblError.Text = "Please vote for a candidate.";
                return;
            }

            int candidateId = Convert.ToInt32(rbCandidates.SelectedValue);

            SqlDataSource1.UpdateParameters["CandidateId"].DefaultValue = candidateId.ToString();

            int rowsAffected = SqlDataSource1.Update();
            if (rowsAffected > 0)
            {
                Response.Redirect("Votes.aspx");
            }
        }
    }
}