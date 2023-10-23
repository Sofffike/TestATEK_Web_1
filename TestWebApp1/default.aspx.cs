using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestWebApp1
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClientScript.GetPostBackEventReference(this, string.Empty);
            // Установка onclick обработчика для гиперссылки "Выбрать"
          //  selectLink.Attributes["onclick"] = "sendRequest(); return false;";
        }
    }
}