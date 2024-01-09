using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace do_an_thuongmaidientu.controller
{
    public partial class loginController : System.Web.UI.Page
    {
        Models.ketnoi_database ketnoi = new Models.ketnoi_database();

        protected void Page_Load(object sender, EventArgs e)
        {
            string action = HttpContext.Current.Request.Form["action"];
            if (string.IsNullOrEmpty(action))
            {
                action = HttpContext.Current.Request.QueryString["action"];
                if (string.IsNullOrEmpty(action))
                {
                    action = "login";
                }
            }

            if (HttpContext.Current.Session["is_valid_admin"] == null)
            {
                 action = "login";
            }

            switch (action) {
                case "login":
                    //Response.Redirect("./view/homeUser/loginPage.aspx");
                    Server.Transfer("~/view/homeUser/loginPage.aspx");
                    break;
                case "logout":
                   
                    break;
                           
            }



        }
    }
}