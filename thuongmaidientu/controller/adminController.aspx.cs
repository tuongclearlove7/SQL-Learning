using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace do_an_thuongmaidientu.controller
{
    public partial class adminController : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string action = HttpContext.Current.Request.Form["action"];
            if (string.IsNullOrEmpty(action))
            {
                action = HttpContext.Current.Request.QueryString["action"];
                if (string.IsNullOrEmpty(action))
                {
                    action = "home_admin";
                }
            }

            switch (action)
            {
                case "home_admin":
                    Server.Transfer("~/view/homeUser/home.aspx");
                    break;

            }

        }



    }
}