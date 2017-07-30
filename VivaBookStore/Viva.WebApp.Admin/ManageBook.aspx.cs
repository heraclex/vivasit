using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL;
using Viva.DAL.Entities;

namespace Viva.WebApp.Admin
{
    public partial class ManageBook : Common.AdminPage
    {
        protected Book bookEntity { get; set; }

        protected List<Category> Categories { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.bookEntity = new Book();
            this.Categories = this.Service.GetAllCategories();
        }

        private void GenerateCategoryDropDown()
        {
            this.ddCategory.DataSource = this.Categories;
            this.ddCategory.DataTextField = "CategoryName";
            this.ddCategory.DataValueField = "Id";
            this.ddCategory.DataBind();
        }

        protected void btnImgUpload_Click(object sender, EventArgs e)
        {
            if (fileUploadImage.HasFile)
            {
                string strname = fileUploadImage.FileName.ToString();
                var pic = new Picture()
                {
                    PictureBinary = fileUploadImage.FileBytes
                };

                this.Service.InsertPicture(pic);

            }
        }
    }
}