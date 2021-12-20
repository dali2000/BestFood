import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

  constructor(private router:Router) { }
  user:any;
  user1:any;
  token:any;
  test = true;
  name = null;
  role = null;
  test2 = true;
  ngOnInit(): void {
    
    this.token = localStorage.getItem('token');
    //this.user = jwtDecode(this.token);
    console.log(this.token);
    console.log(this.user);
   // this.getdata();


  }
  public check =true
  public toggle(){
    if(this.check==true){
      this.check=false
    }
    else{
      this.check=true
    }
    
  }

  

  
  }


