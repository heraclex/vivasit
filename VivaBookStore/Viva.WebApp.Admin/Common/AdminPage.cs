using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Viva.Service;

namespace Viva.WebApp.Admin.Common
{
    public class AdminPage : System.Web.UI.Page
    {
        protected BookStoreService Service = new BookStoreService();

        protected PageStatus Status = PageStatus.Default;

        /// <summary>
        /// Represent for Status on Page
        /// This will be use in children pages
        /// </summary>
        protected enum PageStatus
        {
            /// <summary>
            /// Default Mode
            /// </summary>
            Default = 0,

            /// <summary>
            /// Add new Item on page
            /// </summary>
            Add = 1,

            /// <summary>
            /// edit item on page
            /// </summary>
            Edit = 2
        }
    }
}