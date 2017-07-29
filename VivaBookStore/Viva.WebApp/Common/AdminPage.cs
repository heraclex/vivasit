using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Viva.Service;

namespace Viva.WebApp.Common
{
    public class AdminPage : System.Web.UI.Page
    {
        protected BookStoreService Service = new BookStoreService();        
    }
}