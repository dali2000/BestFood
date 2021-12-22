import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-diet-foods',
  templateUrl: './diet-foods.component.html',
  styleUrls: ['./diet-foods.component.css']
})
export class DietFoodsComponent implements OnInit {

  constructor(private router:Router,private http:HttpClient) { }

  ngOnInit(): void {
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
  f = [];
}
