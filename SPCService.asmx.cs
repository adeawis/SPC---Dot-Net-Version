using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DA;
using Business;
using System.Data;

namespace StatePharmaceuticalCooperations
{
    /// <summary>
    /// Summary description for SPCService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SPCService : System.Web.Services.WebService
    {

        [WebMethod]
        public int RegisterUser(int UserId, string UserName, string Password, string UserType, string Email, string ContactNo, bool IsActive)
        {
            try
            {
                User user = new User();
                user.UserId = UserId;
                user.Username = UserName;
                user.Password = Password;
                user.UserType = UserType;
                user.Email = Email;
                user.ContactNo = ContactNo;
                user.IsActive = IsActive;
                return user.RegUser();
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod]
        public User ValidateUser(string Username, string Password)
        {
            try
            {
                User user = new User();
                user.Username = Username.Trim();
                user.Password = Password.Trim();

                if (user.FetchUsers()) // Fetch user data from the database
                {
                    if (string.IsNullOrEmpty(user.UserType))
                    {
                        Console.WriteLine("UserType is null or empty. Login failed.");
                        return null;
                    }
                    return user;
                }
                else
                {
                    Console.WriteLine("Invalid login credentials.");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error validating user: " + ex.Message);
                return null;
            }
        }

        [WebMethod]
        public DataSet GetAllUsers()
        {
            try
            {
                User user = new User();
                return user.GetAllUsers();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int UpdateUser(int userId, string username, string userType, string email, string contactNo, bool isActive)
        {
            try
            {
                User user = new User
                {
                    UserId = userId,
                    Username = username,
                    UserType = userType,
                    Email = email,
                    ContactNo = contactNo,
                    IsActive = isActive
                };
                return user.UpdateUser();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int DeleteUser(int userId)
        {
            try
            {
                User user = new User
                {
                    UserId = userId
                };
                return user.DeleteUser();
            }
            catch
            {
                throw;
            }
        }

        // drug codes

        [WebMethod]
        public int addDrugs(string name, string description, int stock, decimal price, string manufacturer, string status)
        {
            try
            {
                Drug drug = new Drug();
                drug.DrugName = name;
                drug.Description = description;
                drug.Quantity = stock;
                drug.UnitPrice = price;
                drug.ManufacturingPlant = manufacturer;
                drug.Status = status;

                return drug.add();
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod]
        public DataSet GetAllDrugs()
        {
            try
            {
                Drug drug = new Drug();
                return drug.getAll();
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        // supplier codes

        [WebMethod]
        public int RegisterSupplier(string companyName, string contactPerson, string email, string phone, string address, string city, string country, string licenseNumber, string businessType, string branchRegisteredAt, string password)
        {
            try
            {
                Supplier sup = new Supplier();
                sup.CompanyName = companyName;
                sup.ContactPerson = contactPerson;
                sup.Email = email;
                sup.Phone = phone;
                sup.Address = address;
                sup.City = city;
                sup.Country = country;
                sup.LicenseNumber = licenseNumber;
                sup.BusinessType = businessType;
                sup.BranchRegisteredAt = branchRegisteredAt;
                sup.Password = password;
                return sup.RegSupplier();
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod]
        public Supplier LoginSupplier(string email, string password)
        {
            try
            {
                Supplier sup = new Supplier
                {
                    Email = email.Trim(),
                    Password = password.Trim()
                };

                if (sup.loginSupplier()) // Fetch from DB
                {
                    return sup;
                }
                else
                {
                    return null; // Login failed
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Service error: " + ex.Message);
                return null;
            }
        }

        [WebMethod]
        public DataSet GetAllSuppliers()
        {
            try
            {
                Supplier supplier = new Supplier();
                return supplier.GetAllSuppliers();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int UpdateSupplier(int supplierId, string companyName, string contactPerson, string email,
            string phone, string address, string city, string country, string licenseNumber,
            string businessType, string branchRegisteredAt, string status, bool isActive)
        {
            try
            {
                Supplier supplier = new Supplier
                {
                    SupplierID = supplierId,
                    CompanyName = companyName,
                    ContactPerson = contactPerson,
                    Email = email,
                    Phone = phone,
                    Address = address,
                    City = city,
                    Country = country,
                    LicenseNumber = licenseNumber,
                    BusinessType = businessType,
                    BranchRegisteredAt = branchRegisteredAt,
                    Status = status,
                    IsActive = isActive
                };
                return supplier.UpdateSupplier();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int DeleteSupplier(int supplierId)
        {
            try
            {
                Supplier supplier = new Supplier
                {
                    SupplierID = supplierId
                };
                return supplier.DeleteSupplier();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int UpdateSupplierStatus(int supplierId, string status, bool isActive)
        {
            try
            {
                Supplier supplier = new Supplier
                {
                    SupplierID = supplierId,
                    Status = status,
                    IsActive = isActive
                };
                return supplier.UpdateSupplierStatus();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public List<string> searchByDrugName(string drugName)
        {
            try
            {
                Drug drug = new Drug();
                drug.DrugName = drugName;
                return drug.selectByName();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                throw;
            }
        }


        [WebMethod]
        public int updateDrug(int drugId, string name, string description, int stock, decimal price, string manufacturer, string status)
        {
            try
            {
                Drug drug = new Drug();
                drug.DrugID = drugId;
                drug.DrugName = name;
                drug.Description = description;
                drug.Quantity = stock;
                drug.UnitPrice = (decimal)price;
                drug.ManufacturingPlant = manufacturer;
                drug.Status = status;
                return drug.update();
            }
            catch (Exception)
            {
                throw;
            }
        }

        [WebMethod]
        public int deleteDrug(int drugId)
        {
            try
            {
                Drug drug = new Drug();
                drug.DrugID = drugId;
                return drug.delete();
            }
            catch (Exception)
            {
                throw;
            }
        }

        // tender codes

        [WebMethod]

        public int insertTender(string companyName, string contactPerson, string email, string phoneNumber, string productName, string manufacturer, decimal unitPrice, int quantity, int deliveryTimeline, string additionalComments)
        {
            try
            {
                Tender tender = new Tender
                {
                    CompanyName = companyName,
                    ContactPerson = contactPerson,
                    Email = email,
                    PhoneNumber = phoneNumber,
                    ProductName = productName,
                    Manufacturer = manufacturer,
                    UnitPrice = unitPrice,
                    Quantity = quantity,
                    DeliveryTimeline = deliveryTimeline,
                    AdditionalComments = additionalComments
                };

                return tender.insertTenderForm();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public DataSet GetAllTenders()
        {
            try
            {
                Tender tender = new Tender();
                return tender.GetAllTenders();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int deleteTenders(int id)
        {
            try
            {
                Tender tender = new Tender();
                tender.Id = id;
                return tender.deleteTender();
            }
            catch (Exception)
            {
                throw;
            }
        }

        // codes for Ordering

        [WebMethod]
        public DataSet getOrderHistoryByUserId(int userId)
        {
            try
            {
                Order order = new Order();
                return order.selectOrderHistory(userId);
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int InsertOrder(int drugId, int userId, int quantity, DateTime orderDate, string status)
        {
            try
            {
                Order order = new Order();
                order.DrugID = drugId;
                order.UserId = userId;
                order.Quantity = quantity;
                order.OrderDate = orderDate;
                order.Status = status;
                return order.insert();
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]
        public int UpdateOrder(int orderId, int drugId, int userId, int quantity, DateTime orderDate, string status)
        {
            try
            {
                Order order = new Order();
                order.OrderID = orderId;
                order.DrugID = drugId;
                order.UserId = userId;
                order.Quantity = quantity;
                order.OrderDate = orderDate;
                order.Status = status;
                return order.update();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int DeleteOrder(int orderId)
        {
            try
            {
                Order order = new Order();
                order.OrderID = orderId;
                return order.delete();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public bool FindOrderById(int orderId)
        {
            try
            {
                Order order = new Order();
                order.OrderID = orderId;
                return order.selectByOrderId();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public DataSet GetOrderHistory(int userId)
        {
            try
            {
                Order order = new Order();
                return order.selectOrderHistory(userId);
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public DataSet GetAllOrders()
        {
            try
            {
                Order order = new Order();
                return order.selectAll();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public int UpdateDrugQuantity(int drugId, int orderedQuantity)
        {
            try
            {
                Order order = new Order();
                return order.updateDrugQuantity(drugId, orderedQuantity);
            }
            catch
            {
                throw;
            }
        }

        // order history code
        [WebMethod]
        public DataSet GetOrderHistoryWithDrugDetails(int userId)
        {
            try
            {
                Order order = new Order();
                return order.selectOrderHistoryWithDrugDetails(userId);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error retrieving order history with drug details: " + ex.Message);
                throw;
            }
        }
    }
}
