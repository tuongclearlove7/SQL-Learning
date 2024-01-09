using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace do_an_thuongmaidientu.controller
{
    public partial class homeController : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string action = HttpContext.Current.Request.Form["action"];
            if (string.IsNullOrEmpty(action))
            {
                action = HttpContext.Current.Request.QueryString["action"];
                if (string.IsNullOrEmpty(action))
                {
                    action = "home_user";
                }
            }

            switch (action)
            {
                case "home_user":
                    //Server.Transfer("~/view/homeUser/home.aspx");
                    Response.Redirect("~/view/homeUser/home.aspx");
                    break;
                case "giohang":
                    Response.Redirect("~/view/homeUser/giohang.aspx");
                    break;
            }

        }



    }
}