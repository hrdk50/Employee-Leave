using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmployeeLeaveWebApp.Models;

namespace EmployeeLeaveWebApp.Domain
{
    public class LeaveDomain : BaseDomain
    {
        public void Add(Leave leave)
        {
            this.ExecuteNonQuery($"insert into Leave(FirstDate,LastDate,EmployeeId) values('{leave.FirstDate}','{leave.LastDate}',{leave.EmployeeId})");   
        }
        public List<Leave> Get(int LeaveId)
        {
            var reader = this.GetReader($"select * from Leave where LeaveId = {LeaveId}");
            var leaves = new List<Leave>();
            while (reader.Read())
            {
                var leave = new Leave();
                leave.LeaveId = reader.GetInt32(0);
                leave.FirstDate = reader.GetDateTime(1).ToString();
                leave.LastDate = reader.GetDateTime(2).ToString();
                leave.EmployeeId = reader.GetInt32(3);
                leaves.Add(leave);
            }
            return leaves;
        }
    }
}
