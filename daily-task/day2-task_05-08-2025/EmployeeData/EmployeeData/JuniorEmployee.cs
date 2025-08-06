using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeData
{
    internal class JuniorEmployee : Employee
    {
        public float Experience { get; set; }
        public float Salary { get; set; }

        public JuniorEmployee(string Name, int Id, string Department, float Experience, float Salary) : base(Name, Id, Department)
        {
            this.Experience = Experience;
            this.Salary = Salary;
        }

        public override string GetInfo()
        {
            return base.GetInfo() + $"\nExperience: {Experience} years \nSalary: {Salary} USD";
        }
    }
}
