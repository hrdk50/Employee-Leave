using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeLeaveWebApp.Models;

namespace EmployeeLeaveWebApp.Domain
{
    public class EmployeeDomain : BaseDomain
    {
        public void Add(Employee employee)
        {
                this.ExecuteNonQuery($"insert into Employee(EmployeeName,PresentDate) values('{employee.EmployeeName}','{employee.PresentDate}')");
        }

        public List<Employee> Get()
        {
            var reader = this.GetReader($"select * from Employee");
            var employees = new List<Employee>();
            while (reader.Read())
            {
                var employee = new Employee();
                employee.EmployeeId = reader.GetInt32(0);
                employee.EmployeeName = reader.GetString(1);
                employee.PresentDate = reader.GetDateTime(2).ToString();
                employees.Add(employee);
            }
            return employees;
        }
    }
}
