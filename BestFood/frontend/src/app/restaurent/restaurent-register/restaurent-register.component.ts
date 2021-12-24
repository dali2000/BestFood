import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-restaurent-register',
  templateUrl: './restaurent-register.component.html',
  styleUrls: ['./restaurent-register.component.css']
})
export class RestaurentRegisterComponent implements OnInit {


  constructor(private http:HttpClient) { }

  ngOnInit(): void {
  }
  form = {
    email: null,
    password: null,
    phone: null,
    name: null,
    position: null,
    logo: null,
    cover: null,
    description: null

  }

  register(form: any) {
    this.http.post("http://localhost:3000/resto/register/", form).subscribe(res=>{
      console.log(res)
    });
  }

}
