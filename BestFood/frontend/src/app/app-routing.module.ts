import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistreComponent } from './client/registre/registre.component';
import{LoginComponent} from'./client/login/login.component';
import { MenuComponent } from './Menu/menu/menu.component';
import { RestaurentComponent } from './restaurent/restaurent.component';
import { AllProductesComponent } from './all-productes/all-productes.component';
import { DietFoodsComponent } from './diet-foods/diet-foods.component';
import { DesertFoodsComponent } from './desert-foods/desert-foods.component';
import { ProfilComponent } from './client/profil/profil.component';
import { ContactComponent } from './contact/contact.component';


const routes: Routes = [
 {path:'Register',component:RegistreComponent },
 {path:'login',component:LoginComponent},
 {path:'contact',component:ContactComponent},

 {path:'Menu',component:MenuComponent,children:[
  {path:'allProductes',component:AllProductesComponent},
  {path:'DietFoods',component:DietFoodsComponent},
  {path:'DesertFoods',component:DesertFoodsComponent},
 ]},
 {path:'Restaurent',component:RestaurentComponent},
 {path:'profil',component:ProfilComponent},
 {path:'Menu',component:MenuComponent},
 {path:'Restaurent',component:RestaurentComponent},
 {path:'Restaurant',component:RestaurentComponent}



];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
