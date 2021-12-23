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
import { UpdateProfilComponent } from './client/update-profil/update-profil.component';
import { HistoriqueComponent } from './client/historique/historique.component';
import { BasketComponent } from './basket/basket.component';
import { RestaurentMenuComponent } from './restaurent-menu/restaurent-menu.component';



const routes: Routes = [

 {path:'Register',component:RegistreComponent },
 {path:'login',component:LoginComponent},
 {path:'contact',component:ContactComponent},

 {path:'profil',component:ProfilComponent},
  {path:'updateprofil',component:UpdateProfilComponent},
  {path:'historique',component:HistoriqueComponent},

  {path:'basket',component:BasketComponent},

 

 {path:'Menu',component:MenuComponent,children:[
  {path:'allProductes',component:AllProductesComponent},
  {path:'DietFoods',component:DietFoodsComponent},
  {path:'DesertFoods',component:DesertFoodsComponent},
 ]},
 {path:'Restaurent',component:RestaurentComponent},
 {path:'Menu',component:MenuComponent},
 {path:'Restaurent',component:RestaurentComponent},
 {path:'Restaurant',component:RestaurentComponent},
 {path:'RestaurantMenu/:email',component:RestaurentMenuComponent}



];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
