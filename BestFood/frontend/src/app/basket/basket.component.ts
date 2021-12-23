import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.css']
})
export class BasketComponent implements OnInit {

  constructor(private route: ActivatedRoute, private router: Router, private http: HttpClient) { }


  public form = {

    token:""
  }
  ngOnInit(): void {


    this.getbasket(this.form)
  }
  data :any;
  carts:any;
  total=0
  getbasket(form:any){
    form.token = localStorage.getItem('token')
    let headers = new HttpHeaders({'token': form.token})

    console.log(headers)
    this.http.get("http://localhost:3000/cart/cart",{headers:headers}).subscribe(res=>{
      this.data = res;
      this.carts = this.data.cart;
      console.log(this.carts)

      for(let i = 0; i < this.carts.length; i++){
        
        this.total+=parseInt(this.carts[i].order.price)
        
      }

    })

  }

}