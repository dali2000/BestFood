import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-add-food',
  templateUrl: './add-food.component.html',
  styleUrls: ['./add-food.component.css']
})
export class AddFoodComponent implements OnInit {

  constructor(private route: ActivatedRoute, private router: Router, private http: HttpClient) { }

  ngOnInit(): void {
    this.token = localStorage.getItem('token');
    this.food.token = this.token;
  }
  token:any;
 
  
  food = {
    name:null,
    price:null,
    img: null,
    category:null,
    token:null
  }
  
 
  addFood(food:any){
    this.http.post("http://localhost:3000/food/food/",food).subscribe(res =>{
      console.log(res)
    })
  }
}
