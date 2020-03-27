using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeLeaveWebApp.Models
{
    public class Leave
    {
        public int LeaveId { get; set; }
        public string FirstDate { get; set; }
        public string LastDate { get; set; }
        public int EmployeeId { get; set; }
    }
}
