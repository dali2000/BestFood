import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-restaurent-menu',
  templateUrl: './restaurent-menu.component.html',
  styleUrls: ['./restaurent-menu.component.css']
})
export class RestaurentMenuComponent implements OnInit {
  public email: string | null | undefined;
  public resto: any;
  data: any;
  restos: any;
  food: any
  nb = 0;
  constructor(private route: ActivatedRoute, private router: Router, private http: HttpClient) { }

  ngOnInit(): void {

    this.route.paramMap.subscribe(params => {
      const RestaurantEmail = params.get("email");
      this.email = RestaurantEmail

    });

    this.http.get("http://localhost:3000/resto/restaurants").subscribe(res => {

      this.data = res;
      this.restos = this.data.restaurants;
      this.nb = this.restos.length
      for (let i = 0; i < this.nb; i++) {

        if (this.restos[i].email == this.email) {
          this.resto = this.restos[i];
          this.food = this.resto.foods;
          console.log(this.food)
        }
      }

    })


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
  buy(id:any){
    this.fd.qte = this.n;
     this.fd._id = id;
    console.log(this.fd)
  }





}




