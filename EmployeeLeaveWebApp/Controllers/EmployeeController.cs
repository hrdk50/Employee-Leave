using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeLeaveWebApp.Models;
using EmployeeLeaveWebApp.Domain;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeLeaveWebApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployeeController : ControllerBase
    {
        public EmployeeController()
        {
            this.EmployeeDomain = new EmployeeDomain();
        }

        [HttpGet]
        public IActionResult Get()
        {
            var employees = this.EmployeeDomain.Get();
            return Ok(employees);
        }

        [HttpPost]
        public IActionResult Post(Employee employee)
        {
            this.EmployeeDomain.Add(employee);
            return Ok();
        }

        public EmployeeDomain EmployeeDomain { get; set; }
    }
}
