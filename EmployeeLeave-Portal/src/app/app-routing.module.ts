import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { LeaveComponent } from './leave/leave.component';

const routes: Routes = [
  {path : '', component : EmployeeComponent},
  {path : 'leave', component : LeaveComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }
