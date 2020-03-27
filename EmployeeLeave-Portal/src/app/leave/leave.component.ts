import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-leave',
  templateUrl: './leave.component.html',
  styleUrls: ['./leave.component.css']
})
export class LeaveComponent implements OnInit {
  leaveFormGroup: FormGroup;
  constructor(private formBuilder: FormBuilder) { }
  date = new Date();

  ngOnInit(): void {
    this.leaveFormGroup = this.formBuilder.group({
      employeeName: ['', Validators.required],
      startDate: ['', Validators.required],
      endDate: ['', Validators.required]
    })
     this.date.setDate(this.date.getDate() + 7 );

  }
validateStartDate(){

  console.log(this.date);
  if(new Date(this.leaveFormGroup.controls['startDate'].value) < this.date){
    alert("You can apply your leave after 7 days of present Date");
  }
  else{
    console.log(new Date( this.leaveFormGroup.controls.startDate.value));
  }
}
  onSubmit() {

   if (this.leaveFormGroup.controls.startDate.value < this.leaveFormGroup.controls.endDate.value) {
      console.log("Leave Date is Valid");
      console.log(this.leaveFormGroup.value);
      alert("Your leave is granted");
    }
    else {
      alert("End date should be grater then start date.");
    }
  }

}
