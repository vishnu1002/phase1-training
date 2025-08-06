using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeData.Repo
{
    internal interface IEmployeeRepo<T>
    {
        List<T> GetAllEmployee();
        void Add(T employee);
    }
}
