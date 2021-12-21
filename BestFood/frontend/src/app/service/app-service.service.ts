import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AppServiceService {

  constructor(private http:HttpClient) { }
  

  login(data:any){
    this.http.post("http://localhost:3000/user/login",data)
  }
}
