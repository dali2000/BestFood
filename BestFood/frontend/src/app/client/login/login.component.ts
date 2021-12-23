import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import jwtDecode from 'jwt-decode';
import { Observable } from 'rxjs';
import { DataServiceService } from 'src/app/service/data-service.service';



@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(service:DataServiceService ,private http:HttpClient, private router:Router) {}
  data:any;
  token:any;
  user:any;

  ngOnInit(): void {
   
  }
  public form = {
    email:null,
    password:null
  }
  
  // authU(f:any){
  //   let data=f.value
  //   this.http.get("http://localhost:3000/test").subscribe(response=>console.log(response),err=>console.log(err))


  // }
  login(form:any){
    this.http.post("http://localhost:3000/user/login/",form).subscribe(res=>{
      this.data = res;
      this.token = this.data.token;
     const headers =new Headers();
     headers.append('Authorization', `jwt ${this.token}`);
     localStorage.setItem('token',this.token);
        this.token = localStorage.getItem('token');
        this.user = jwtDecode(this.token);
        //console.log(this.user);

        //redirect after login
        if(this.token !=null){
           this.router.navigate((['/profil']))
         }
         else{
          this.router.navigate((['/login']))

         }
    }
  );

  //console.log(this.token)

 
  
  }

  
}
