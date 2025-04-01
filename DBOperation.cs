using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DA
{
    public class DBOperation
    {
        private SqlConnection con = new SqlConnection("Data Source=LENOVO-ADA\\SQLEXPRESS; Initial Catalog=SPC; Trusted_Connection=True;");

        public int executeQuery(string sql)
        {
            try
            {
                con.Open();
                SqlCommand com = new SqlCommand(sql, con);
                return com.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        public DataSet ExecuteSelectCommand(string sql)
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (SqlException ex)  // Catch SQL exception
            {
                Console.WriteLine("SQL Exception: " + ex.Message);
                Console.WriteLine("SQL Query: " + sql);
                throw; // Rethrow the exception to see the error in Debug Output
            }
            finally
            {
                con.Close();
            }
        }

        public DataSet ExecuteSelectCommand1(string sql, Dictionary<string, object> parameters)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                foreach (var param in parameters)
                {
                    cmd.Parameters.AddWithValue(param.Key, param.Value);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error: " + ex.Message);
                throw;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
