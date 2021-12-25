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
  token:any;
  ngOnInit(): void {
    this.token = localStorage.getItem('token')
    this.getAllFood()
  }
  data :any;
  foods:any;
  
  n=1

 

  getAllFood(){
    this.http.get("http://localhost:3000/food/foods").subscribe(res =>{
      
      this.data = res;
     this.foods =this.data.food;
    
    });

  }

  plus() {
    this.n++;
  }
  mins() {
    this.n--;
    if (this.n <2) {
      this.n = 1;
    }
  }
  fod={
    _id:null,
    token:"",
    quantity:""
  }
    buy(id:any){
    
    this.fod._id = id;
    this.fod.token = this.token;
    this.fod.quantity = this.n.toString();
    
 
     this.n = 1
     console.log(this.fod)
    this.http.post("http://localhost:3000/cart/cart/",this.fod).subscribe(res=>{
      console.log(res)
    })
  
  }

}
