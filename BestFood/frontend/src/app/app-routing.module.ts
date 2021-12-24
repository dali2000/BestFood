import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistreComponent } from './client/registre/registre.component';
import { LoginComponent } from './client/login/login.component';
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
import { RestaurentRegisterComponent } from './restaurent/restaurent-register/restaurent-register.component';
import { HomeComponent } from './home/home.component';
import { RestaurentLoginComponent } from './restaurent/restaurent-login/restaurent-login.component';
import { AddFoodComponent } from './restaurent/add-food/add-food.component';
import { RestaurentProfilComponent } from './restaurent/restaurent-profil/restaurent-profil.component';
import { MyMenuComponent } from './my-menu/my-menu.component';



const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'Register', component: RegistreComponent },
  { path: 'RegisterRestaurent', component: RestaurentRegisterComponent },
  { path: 'RestaurentLogin', component: RestaurentLoginComponent },
  { path: 'RestaurentProfil', component: RestaurentProfilComponent }, 
  { path: 'MyMenu', component: MyMenuComponent },
  { path: 'AddFood', component: AddFoodComponent },
  { path: 'login', component: LoginComponent },
  { path: 'contact', component: ContactComponent },

  { path: 'profil', component: ProfilComponent },
  { path: 'updateprofil', component: UpdateProfilComponent },
  { path: 'historique', component: HistoriqueComponent },

  { path: 'basket', component: BasketComponent },



  {
    path: 'Menu', component: MenuComponent, children: [
      { path: 'allProductes', component: AllProductesComponent },
      { path: 'DietFoods', component: DietFoodsComponent },
      { path: 'DesertFoods', component: DesertFoodsComponent },
    ]
  },
  { path: 'Restaurent', component: RestaurentComponent },
  { path: 'Menu', component: MenuComponent },
  { path: 'Restaurent', component: RestaurentComponent },
  { path: 'Restaurant', component: RestaurentComponent },
  { path: 'RestaurantMenu/:email', component: RestaurentMenuComponent }



];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
