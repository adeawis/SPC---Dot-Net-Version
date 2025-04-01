using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace Business
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string UserType { get; set; } // supplier, pharmacy, staff, admin
        public string Email { get; set; }
        public string ContactNo { get; set; }
        public bool IsActive { get; set; }

        public int RegUser()
        {
            try
            {
                string sql = "INSERT INTO tblUsers VALUES ('" + Username + "', '" + Password + "', '" + UserType + "', '" + Email + "', '" + ContactNo + "', '" + IsActive + "')";
                return new DBOperation().executeQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool FetchUsers()
        {
            try
            {
                string sql = $"SELECT UserId, Username, UserType FROM tblUsers " +
                             $"WHERE Username='{Username}' AND Password='{Password}' AND IsActive=1";

                Console.WriteLine("Executing SQL Query: " + sql);  // Debugging log

                DBOperation dBOperation = new DBOperation();
                DataSet ds = dBOperation.ExecuteSelectCommand(sql);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Console.WriteLine("User found in database!");  // Debugging log

                    UserId = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
                    Username = ds.Tables[0].Rows[0][1].ToString();
                    UserType = ds.Tables[0].Rows[0][2].ToString();
                    return true;
                }
                else
                {
                    Console.WriteLine("User NOT found in database.");  // Debugging log
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fetching user: " + ex.Message);
                throw;
            }
        }

        public DataSet GetAllUsers()
        {
            try
            {
                string sql = "SELECT UserId, Username, UserType, Email, ContactNo, IsActive FROM tblUsers ORDER BY UserId DESC";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch
            {
                throw;
            }
        }

        public int UpdateUser()
        {
            try
            {
                string sql = "UPDATE tblUsers SET Username = '" + Username + "', UserType = '" + UserType +
                            "', Email = '" + Email + "', ContactNo = '" + ContactNo +
                            "', IsActive = '" + IsActive + "' WHERE UserId = " + UserId;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }

        public int DeleteUser()
        {
            try
            {
                string sql = "DELETE FROM tblUsers WHERE UserId = " + UserId;
                return new DBOperation().executeQuery(sql);
            }
            catch
            {
                throw;
            }
        }
    }
}

