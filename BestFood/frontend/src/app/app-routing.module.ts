import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistreComponent } from './client/registre/registre.component';
import{LoginComponent} from'./client/login/login.component';
import { MenuComponent } from './Menu/menu/menu.component';
import {RestaurentComponent} from './restaurent/restaurent.component'
import { RestaurantComponent } from './restaurant/restaurant.component';
import { ProfilComponent } from './client/profil/profil.component';


const routes: Routes = [
 {path:'Register',component:RegistreComponent },
 {path:'login',component:LoginComponent},
 {path:'profil',component:ProfilComponent},
 {path:'Menu',component:MenuComponent},
 {path:'Restaurent',component:RestaurentComponent},
 {path:'Restaurant',component:RestaurantComponent}


];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
