using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace Business
{
    public class Order
    {
        public int OrderID { get; set; }
        public int DrugID { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }
        public DateTime OrderDate { get; set; }
        public string Status { get; set; }

        public int insert()
        {
            try
            {
                string sql = "INSERT INTO tblOrders (DrugID, UserId, Quantity, OrderDate, Status) " +
                             "VALUES (" + DrugID + ", " + UserId + ", " + Quantity + ", '" + OrderDate.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + Status + "')";
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public int update()
        {
            try
            {
                string sql = "UPDATE tblOrders SET DrugID=" + DrugID + ", UserId=" + UserId + ", Quantity=" + Quantity +
                             ", OrderDate='" + OrderDate.ToString("yyyy-MM-dd HH:mm:ss") + "', Status='" + Status + "' WHERE OrderID=" + OrderID;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public int delete()
        {
            try
            {
                string sql = "DELETE FROM tblOrders WHERE OrderID=" + OrderID;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public bool selectByOrderId()
        {
            try
            {
                string sql = "SELECT * FROM tblOrders WHERE OrderID=" + OrderID;
                DBOperation db = new DBOperation();
                DataSet ds = db.ExecuteSelectCommand(sql);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    OrderID = Convert.ToInt32(ds.Tables[0].Rows[0]["OrderID"]);
                    DrugID = Convert.ToInt32(ds.Tables[0].Rows[0]["DrugID"]);
                    UserId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserId"]);
                    Quantity = Convert.ToInt32(ds.Tables[0].Rows[0]["Quantity"]);
                    OrderDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["OrderDate"]);
                    Status = ds.Tables[0].Rows[0]["Status"].ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

        public DataSet selectOrderHistory(int userId)
        {
            try
            {
                string sql = "SELECT * FROM tblOrders WHERE UserId = " + userId + " ORDER BY OrderDate DESC";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }


        public DataSet selectAll()
        {
            try
            {
                string sql = "SELECT * FROM tblOrders";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }

        public int updateDrugQuantity(int drugId, int orderedQuantity)
        {
            try
            {
                string sql = "UPDATE tblDrugs SET Quantity = Quantity - " + orderedQuantity +
                             " WHERE DrugID = " + drugId + " AND Quantity >= " + orderedQuantity;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public DataSet selectOrderHistoryWithDrugDetails(int userId)
        {
            try
            {
                // Define the SQL query with parameters
                string sql = @"
            SELECT o.OrderID, o.Quantity, o.OrderDate, o.Status, 
                   d.DrugName, d.UnitPrice, 
                   (o.Quantity * d.UnitPrice) AS TotalPrice
            FROM tblOrders o
            INNER JOIN tblDrugs d ON o.DrugID = d.DrugID
            WHERE o.UserId = @UserId
            ORDER BY o.OrderDate DESC";

                // Prepare parameters as a dictionary
                Dictionary<string, object> parameters = new Dictionary<string, object>
        {
            { "@UserId", userId }
        };

                // Call the ExecuteSelectCommand1 method
                DBOperation db = new DBOperation();
                return db.ExecuteSelectCommand1(sql, parameters);
            }
            catch
            {
                throw;
            }
        }
    }
}
