using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            List<ServiceItem> services = new List<ServiceItem>
            {
                new ServiceItem
                {
                    Title = "Manufacturing Excellence",
                    Description = "Our state-of-the-art manufacturing facilities produce high-quality pharmaceutical products, with plans for expansion to meet growing demands.",
                    ImageUrl = "~/Images/manufacturing-icon.png"
                },
                new ServiceItem
                {
                    Title = "Nationwide Distribution",
                    Description = "Through our network of SPC pharmacies and dealer partnerships, we ensure medications reach every corner of the nation.",
                    ImageUrl = "~/Images/distribution-icon.png"
                },
                new ServiceItem
                {
                    Title = "Digital Innovation",
                    Description = "We leverage cutting-edge technology to streamline operations, from supplier registration to inventory management and order processing.",
                    ImageUrl = "~/Images/technology-icon.png"
                }
            };

            rptServices.DataSource = services;
            rptServices.DataBind();
        }
    }

    public class ServiceItem
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
    }
}
