using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeData
{
    internal class Employee
    {
        public string Name { get; set; }
        public int Id { get; set; }
        public string Department { get; set; }

        public Employee(string Name, int Id, string Department)
        {
            this.Name = Name;
            this.Id = Id;
            this.Department = Department;
        }

        public virtual string GetInfo()
        {
            return $"\nEmployee Name: {Name} \nId: {Id} \nDepartment: {Department}";

        }
    }
}
