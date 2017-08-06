using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    /// <summary>
    /// Summary description for VivaWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class VivaWebService : System.Web.Services.WebService
    {
        private readonly BookStoreService service = new BookStoreService();

        public VivaWebService()
        {

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Customer Login(string username, string password)
        {
            var customer = this.service.GetCustomerByUserName(username);
            if (customer != null && customer.Password == password)
            {
                // If Login Success, Store user id to session
                if (HttpContext.Current.Session["currentuser"] == null)
                {
                    HttpContext.Current.Session.Add("currentuser", customer);
                }
                
                return customer;
            }
            return null;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool Logout()
        {
            // Delete current session of user
            HttpContext.Current.Session["currentuser"] = null;
            return true;
        }
    }
}
