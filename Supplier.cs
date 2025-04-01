using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace Business
{
    public class Supplier
    {
        public int SupplierID { get; set; }
        public string CompanyName { get; set; }
        public string ContactPerson { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string LicenseNumber { get; set; }
        public string BusinessType { get; set; }
        public string Status { get; set; }
        public string BranchRegisteredAt { get; set; }
        public bool IsActive { get; set; }
        public string Password { get; set; }

        public int RegSupplier()
        {
            try
            {
                string sql = "INSERT INTO tblSuppliers (CompanyName, ContactPerson, Email, Phone, Address, City, Country, LicenseNumber, BusinessType, BranchRegisteredAt, Status, Password) " +
             "VALUES ('" + CompanyName + "', '" + ContactPerson + "', '" + Email + "', '" + Phone + "', '" + Address + "', '" + City + "', '" + Country + "', '" +
             LicenseNumber + "', '" + BusinessType + "', '" + BranchRegisteredAt + "', 'Pending', '" + Password + "')";

                return new DBOperation().executeQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static string GetCompanyNameById(int supplierId)
        {
            string sql = $"SELECT CompanyName FROM tblSuppliers WHERE SupplierID = {supplierId}";
            DataSet ds = new DBOperation().ExecuteSelectCommand(sql);
            return (ds?.Tables[0]?.Rows.Count > 0) ? ds.Tables[0].Rows[0]["CompanyName"].ToString() : string.Empty;
        }

        public static Dictionary<string, int> GetDashboardStats()
        {
            var stats = new Dictionary<string, int>();
            var db = new DBOperation();

            string[] queries = { "SELECT COUNT(*) AS Count FROM tblSuppliers", "SELECT COUNT(*) AS Count FROM tblSuppliers WHERE Status = 'Pending'", "SELECT COUNT(*) AS Count FROM tblSuppliers WHERE IsActive = 1" };

            try
            {
                stats["Total"] = Convert.ToInt32(db.ExecuteSelectCommand(queries[0]).Tables[0].Rows[0]["Count"]);
                stats["Pending"] = Convert.ToInt32(db.ExecuteSelectCommand(queries[1]).Tables[0].Rows[0]["Count"]);
                stats["Active"] = Convert.ToInt32(db.ExecuteSelectCommand(queries[2]).Tables[0].Rows[0]["Count"]);
            }
            catch
            {
                stats["Total"] = stats["Pending"] = stats["Active"] = 0;
            }

            return stats;
        }

        public bool loginSupplier()
        {
            try
            {
                string sql = "SELECT SupplierID, Email FROM tblSuppliers WHERE Email = @Email AND Password = @Password";

                Dictionary<string, object> parameters = new Dictionary<string, object>
                {
                    { "@Email", this.Email },
                    { "@Password", this.Password }  // Ensure password format matches DB
                };

                DBOperation dbOperation = new DBOperation();
                DataSet ds = dbOperation.ExecuteSelectCommand1(sql, parameters);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.SupplierID = Convert.ToInt32(ds.Tables[0].Rows[0]["SupplierID"]);
                    this.Email = ds.Tables[0].Rows[0]["Email"].ToString();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error during login: " + ex.Message);
                return false;
            }
        }

        public DataSet GetAllSuppliers()
        {
            try
            {
                string sql = "SELECT SupplierID, CompanyName, ContactPerson, Email, Phone, Address, " +
                            "City, Country, LicenseNumber, BusinessType, BranchRegisteredAt, Status, IsActive " +
                            "FROM tblSuppliers ORDER BY SupplierID DESC";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }

        public int UpdateSupplier()
        {
            try
            {
                string sql = "UPDATE tblSuppliers SET " +
                            "CompanyName = '" + CompanyName + "', " +
                            "ContactPerson = '" + ContactPerson + "', " +
                            "Email = '" + Email + "', " +
                            "Phone = '" + Phone + "', " +
                            "Address = '" + Address + "', " +
                            "City = '" + City + "', " +
                            "Country = '" + Country + "', " +
                            "LicenseNumber = '" + LicenseNumber + "', " +
                            "BusinessType = '" + BusinessType + "', " +
                            "BranchRegisteredAt = '" + BranchRegisteredAt + "', " +
                            "Status = '" + Status + "', " +
                            "IsActive = '" + (IsActive ? "1" : "0") + "' " +
                            "WHERE SupplierID = " + SupplierID;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public int DeleteSupplier()
        {
            try
            {
                string sql = "DELETE FROM tblSuppliers WHERE SupplierID = " + SupplierID;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public DataSet GetSupplierById()
        {
            try
            {
                string sql = "SELECT * FROM tblSuppliers WHERE SupplierID = " + SupplierID;
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }

        public int UpdateSupplierStatus()
        {
            try
            {
                string sql = "UPDATE tblSuppliers SET Status = '" + Status + "', IsActive = '" +
                            (IsActive ? "1" : "0") + "' WHERE SupplierID = " + SupplierID;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }
    }
}
