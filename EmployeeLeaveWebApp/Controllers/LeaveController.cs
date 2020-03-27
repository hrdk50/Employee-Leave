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
    public class LeaveController : ControllerBase
    {
        public LeaveController()
        {
            this.LeaveDomain = new LeaveDomain();
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var leaves = this.LeaveDomain.Get(id);
            return Ok(leaves);
        }

        [HttpPost]
        public IActionResult Post(Leave leave)
        {
            this.LeaveDomain.Add(leave);
            return Ok();
        }

        public LeaveDomain LeaveDomain { get; set; }
    }
}
