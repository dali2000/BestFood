import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { AppServiceService } from 'src/app/service/app-service.service';




@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private auth:AppServiceService,private http:HttpClient) {}

 

  ngOnInit(): void {
   
  }
  
  authU(f:any){
    let data=f.value
    this.http.get("http://localhost:3000/test").subscribe(response=>console.log(response),err=>console.log(err))
    
    


  }
  
}
