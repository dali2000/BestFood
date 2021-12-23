import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-all-productes',
  templateUrl: './all-productes.component.html',
  styleUrls: ['./all-productes.component.css']
})
export class AllProductesComponent implements OnInit {

  constructor(private router:Router,private http:HttpClient) { }

  ngOnInit(): void {
    this.getAllFood()
  }
  data :any;
  foods:any;
  n=0

  fd = {
    _id:"",
    qte:0
  }
  getAllFood(){
    this.http.get("http://localhost:3000/food/foods").subscribe(res =>{
      
      this.data = res;
     this.foods =this.data.food;
     console.log(this.foods);
    })
  }

  plus(){
    this.n ++;
  }
  mins(){
    this.n --;
    if(this.n<0){
      this.n=0;
    }
  }
  buy(){
    
    this.fd.qte = this.n;
    // this.fd._id = this.food._id;
    console.log(this.fd._id )
  }
}
