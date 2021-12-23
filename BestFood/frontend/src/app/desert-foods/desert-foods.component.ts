import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-desert-foods',
  templateUrl: './desert-foods.component.html',
  styleUrls: ['./desert-foods.component.css']
})
export class DesertFoodsComponent implements OnInit {

  constructor(private router:Router,private http:HttpClient) { }
  token:any;
  ngOnInit(): void {
    this.token = localStorage.getItem('token')
    this.getAllFood()
  }
  data :any;
  foods:any;
  getAllFood(){
    this.http.get("http://localhost:3000/food/foods").subscribe(res =>{
      
      this.data = res;
     this.foods =this.data.food;
    
    });

  }
   n = 0;
  fd = {
    _id: "",
    qte: 0
  }

  plus() {
    this.n++;
  }
  mins() {
    this.n--;
    if (this.n < 0) {
      this.n = 0;
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
    
 
     this.n = 0
     console.log(this.fod)
    this.http.post("http://localhost:3000/cart/cart/",this.fod).subscribe(res=>{
      console.log(res)
    })
  }

}

