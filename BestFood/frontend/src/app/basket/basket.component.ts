import { HttpClient } from '@angular/common/http';
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

    token:null
  }
  ngOnInit(): void {
    
    
    this.getbasket(this.form)
  }

  getbasket(form:any){
    form.token = localStorage.getItem('token')
    
    console.log(form)
    this.http.get("http://localhost:3000/cart/cart",form.token).subscribe(res=>{
      console.log(res)
    })
  }

}
