using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankManagementUI
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            
                int userId = 0;
                string roles = string.Empty;
                string constr = "Data Source=HKB;Initial Catalog=TCS_ILP;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Validate_User"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username",txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password",txtPassword.Text);
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Read();
                        try
                        {
                            userId = Convert.ToInt32(reader["UserId"]);
                            roles = reader["Roles"].ToString();
                        }
                        catch (Exception ex)
                        {
                            userId = -2;
                        }
                        con.Close();
                    }
                    switch (userId)
                    {
                        case -2:
                            
               string message = "Username and/or password is incorrect ";
                 System.Text.StringBuilder sb = new System.Text.StringBuilder();
              sb.Append("<script type = 'text/javascript'>");
              sb.Append("window.onload=function(){");
              sb.Append("alert('");
              sb.Append(message);
              sb.Append("')};");
              sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                           
                            break;
                        default:
                            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txtUsername.Text, DateTime.Now, DateTime.Now.AddMinutes(2880), false, roles, FormsAuthentication.FormsCookiePath);
                            string hash = FormsAuthentication.Encrypt(ticket);
                            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);

                            if (ticket.IsPersistent)
                            {
                                cookie.Expires = ticket.Expiration;
                            }
                            Response.Cookies.Add(cookie);
                            Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text,false));
                            break;
                    }
                }
            }

        
    }
}