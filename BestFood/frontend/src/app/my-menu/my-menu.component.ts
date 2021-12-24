import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import jwtDecode from 'jwt-decode';

@Component({
  selector: 'app-my-menu',
  templateUrl: './my-menu.component.html',
  styleUrls: ['./my-menu.component.css']
})
export class MyMenuComponent implements OnInit {

  constructor(private router: Router, private http: HttpClient) { }


  token: any;
  resto: any;
  data: any;
  foods: any;
  food :any

  ngOnInit(): void {
    this.token = localStorage.getItem('token');
    this.data = jwtDecode(this.token);
    this.resto = this.data.restaurant.foods;
   
    this.getAllFood()
  }
  n=0
  getAllFood() {
    this.http.get("http://localhost:3000/food/foods").subscribe(res => {

      this.data = res;
      this.foods = this.data.food;
      // console.log(this.resto)
      for (var i = 0; i < this.foods.length; i++) {
        for (var j = 0; j < this.resto.length; j++) {

          if (this.foods[i]._id == this.resto[j]) {

            
            this.food = this.foods[i]
            this.n++
          }

        }
      }
   
    });
    console.log(this.food)

  }
}
