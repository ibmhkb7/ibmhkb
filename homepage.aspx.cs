using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BankManagementUI
{
    public partial class homepage : System.Web.UI.Page
    {
      
            protected void Page_Load(object sender, EventArgs e)
       {
    if (Request.UrlReferrer == null || string.IsNullOrEmpty(Request.UrlReferrer.AbsolutePath))
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
           
        }

      

        protected void Button2_Click(object sender, EventArgs e)
        {
            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
            FormsAuthenticationTicket ticket = id.Ticket;
            string userData = ticket.UserData;

            if (userData == "cashier")
            {
                Response.Redirect("~/Cashier");
            }
            else if (userData == "executive")
            {
                Response.Redirect("~/Executive");
            }

        }
    }
}