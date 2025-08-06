using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeData.Repo
{
    internal class EmployeeRepo<T> : IEmployeeRepo<T>
    {
        List<T> ListEmployees = new List<T>();

        public void Add(T employee)
        {
            ListEmployees.Add(employee);
        }

        public List<T> GetAllEmployee()
        {
            return ListEmployees;
        }
    }
}
