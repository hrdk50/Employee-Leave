import { Component, OnInit } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { RestService } from '../rest.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {
  employees:any = [];

  constructor(public rest:RestService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit(): void {
    this.getEmployee();
  }

  getEmployee(){
    this.employees = [];
    this.rest.getEmployees().subscribe((data : {}) => 
    {
      console.log(data);
      this.employees = data;
    })
  }
}
