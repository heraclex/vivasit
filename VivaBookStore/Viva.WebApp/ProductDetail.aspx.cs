﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        private readonly BookStoreService service = new BookStoreService();
        protected Book book = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            var bookidString = Request.QueryString["bookid"];
            if (bookidString != null)
            {
                var bookid = 0;
                var isConvertToIntSuccess = Int32.TryParse(bookidString, out bookid);
                if (isConvertToIntSuccess == true && bookid > 0)
                {
                   this.book = this.service.GetBookByID(bookid);                    
                }
            }
            //protected string GetPictureUrlFromBytes(byte[] pictureBinary)
            //{
            //    string base64String = Convert.ToBase64String(pictureBinary, 0, pictureBinary.Length);
            //    return "data:image/png;base64," + base64String;
            //}


        }
    }
}