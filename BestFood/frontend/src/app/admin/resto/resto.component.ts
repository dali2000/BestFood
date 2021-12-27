import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-resto',
  templateUrl: './resto.component.html',
  styleUrls: ['./resto.component.css']
})
export class RestoComponent implements OnInit {

  constructor(private router:Router,private http:HttpClient) { }

  ngOnInit(): void {
    this.getResto()
  }
  data:any;
  restos:any;

  getResto(){
    this.http.get("http://localhost:3000/resto/restaurants").subscribe(res =>{

      this.data = res;
     this.restos =this.data.restaurants;
     console.log(this.restos);
    })
  }

}
