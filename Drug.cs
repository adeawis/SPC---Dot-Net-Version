using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA;

namespace Business
{
    public class Drug
    {
        public int DrugID { get; set; }
        public string DrugName { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public string ManufacturingPlant { get; set; }
        public string Status { get; set; }

        public int add()
        {
            try
            {
                string sql = "INSERT INTO tblDrugs VALUES ('" + DrugName + "', '" + Description + "', " + Quantity + ", " + UnitPrice + ", '" + ManufacturingPlant + "', '" + Status + "')";
                return new DBOperation().executeQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public int update()
        {
            try
            {
                string sql = "UPDATE tblDrugs SET DrugName='" + DrugName + "', Description='" + Description + "', Quantity=" + Quantity + ", UnitPrice=" + UnitPrice + ", Plant='" + ManufacturingPlant + "', Status='" + Status + "' WHERE DrugID=" + DrugID;
                return new DBOperation().executeQuery(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public int delete()
        {
            try
            {
                string sql = "DELETE FROM tblDrugs WHERE DrugID=" + DrugID;
                return new DBOperation().executeQuery(sql);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<string> selectByName()
        {
            try
            {

                string sql = "SELECT * FROM tblDrugs WHERE DrugName = @DrugName";


                DBOperation dBOperation = new DBOperation();


                var parameters = new Dictionary<string, object>
                {
                    { "@DrugName", this.DrugName }
                };


                DataSet ds = dBOperation.ExecuteSelectCommand1(sql, parameters);

                List<string> list = new List<string>();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    // Extract data from the first row and add it to the list
                    //list.Add(Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()).ToString());
                    list.Add(ds.Tables[0].Rows[0][1].ToString());
                    list.Add(ds.Tables[0].Rows[0][2].ToString());
                    //list.Add(Convert.ToInt32(ds.Tables[0].Rows[0][3].ToString()).ToString());
                    list.Add(Convert.ToDecimal(ds.Tables[0].Rows[0][4].ToString()).ToString());
                    list.Add(ds.Tables[0].Rows[0][5].ToString());
                    list.Add(ds.Tables[0].Rows[0][6].ToString());
                    return list;
                }
                else
                {
                    return list;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in selectByName: " + ex.Message);
                throw;
            }
        }

        //public List<string> GetManufacturingPlants()
        //{
        //    try
        //    {
        //        string sql = "SELECT DISTINCT Plant FROM tblDrugs ORDER BY ManufacturingPlant";
        //        DataSet ds = new DBOperation().ExecuteSelectCommand(sql);

        //        List<string> plants = new List<string>();

        //        foreach (DataRow row in ds.Tables[0].Rows)
        //        {
        //            plants.Add(row["ManufacturingPlant"].ToString());
        //        }

        //        return plants;
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}
        public DataSet getAll()
        {
            try
            {
                string sql = "SELECT * FROM tblDrugs";
                return new DBOperation().ExecuteSelectCommand(sql);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool updateStock()
        {
            try
            {
                string sql = $"UPDATE tblDrugs SET Quantity = Quantity + {Quantity} WHERE DrugID = {DrugID}";
                DBOperation dBOperation = new DBOperation();
                DataSet ds = dBOperation.ExecuteSelectCommand(sql);
                return true;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
