using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace Business
{
    public class Tender
    {
        public int Id { get; set; }
        public string CompanyName { get; set; }
        public string ContactPerson { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string ProductName { get; set; }
        public string Manufacturer { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
        public int DeliveryTimeline { get; set; }
        public string AdditionalComments { get; set; }

        public int insertTenderForm()
        {
            try
            {
                string sql = "INSERT INTO tblTenders (CompanyName, ContactPerson, Email, PhoneNumber, ProductName, Manufacturer, UnitPrice, Quantity, DeliveryTimeline, AdditionalComments) " +
                             "VALUES ('" + CompanyName + "', '" + ContactPerson + "', '" + Email + "', '" + PhoneNumber + "', '" + ProductName + "', '" + Manufacturer + "', " + UnitPrice + ", " + Quantity + ", " + DeliveryTimeline + ", '" + AdditionalComments + "')";
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public DataSet GetAllTenders()
        {
            try
            {
                string sql = "SELECT * FROM tblTenders ORDER BY Id DESC";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }

        public int deleteTender()
        {
            try
            {
                string sql = "DELETE FROM tblTenders WHERE Id=" + Id;
                return new DBOperation().executeQuery(sql);

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
