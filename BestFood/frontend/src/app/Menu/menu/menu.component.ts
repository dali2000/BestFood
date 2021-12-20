import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  all = true;
  dis = false;
  die = false;
  click(){
    this.all =true;
    this.die=false;
    this.dis=false;
    
    
  }
  click1(){
    this.all =false;
    this.die=true;
    this.dis=false;
  }
  click2(){
    this.all =false;
    this.die=false;
    this.dis=true;
  }

}
