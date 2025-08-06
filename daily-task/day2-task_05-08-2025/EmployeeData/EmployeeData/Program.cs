using EmployeeData.Repo;

namespace EmployeeData;

class Program
{
    static void Main(string[] args)
    {
        //var EmployeeList = new List<Employee>();
        var employeeRepo = new EmployeeRepo<Employee>();

        var jrEmp1 = new JuniorEmployee("Alice", 1998, "IT", 3.2f, 42_000.0f);
        var jrEmp2 = new JuniorEmployee("Bob", 2000, "HR", 2.9f, 38_500.5f);
        var jrEmp3 = new JuniorEmployee("Charlie", 2002, "Finance", 3.7f, 41_200.75f);

        var srEmp1 = new JuniorEmployee("Diana", 1995, "IT", 3.9f, 55_000.0f);
        var srEmp2 = new JuniorEmployee("Edward", 1996, "Marketing", 3.5f, 52_300.0f);
        var srEmp3 = new JuniorEmployee("Fiona", 1997, "Operations", 3.8f, 50_750.25f);

        employeeRepo.Add(jrEmp1);
        employeeRepo.Add(jrEmp2);
        employeeRepo.Add(jrEmp3);
        employeeRepo.Add(srEmp1);
        employeeRepo.Add(srEmp2);
        employeeRepo.Add(srEmp3);

        var allEmployees = employeeRepo.GetAllEmployee();

        Console.WriteLine("-----");
        foreach (var emp in allEmployees)
        {
            Console.WriteLine(emp.GetInfo());
        }
    }
}