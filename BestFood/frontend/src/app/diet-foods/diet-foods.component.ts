import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-diet-foods',
  templateUrl: './diet-foods.component.html',
  styleUrls: ['./diet-foods.component.css']
})
export class DietFoodsComponent implements OnInit {

  constructor(private router: Router, private http: HttpClient,route: ActivatedRoute) { }
  token:any;
  ngOnInit(): void {
    this.token = localStorage.getItem('token')
    this.getAllFood()
  }
  data :any;
  foods:any;
 
  foodDiet:any= [];
  j = 0;
  getAllFood(){
    this.http.get("http://localhost:3000/food/foods").subscribe(res =>{
      
      this.data = res;
     this.foods =this.data.food;
     
      for(var i=0; i<this.foods.length;i++){
        if(this.foods[i].category == "diet"){
          console.log(this.foods[i])
          this.foodDiet[this.j] = this.foods[i]
          this.j++;
        }
      }
      console.log(this.foodDiet)
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

