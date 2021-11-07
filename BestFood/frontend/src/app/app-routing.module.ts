import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistreComponent } from './client/registre/registre.component';
import { MenuComponent } from './Menu/menu/menu.component';
import { RestaurantComponent } from './restaurant/restaurant.component';

const routes: Routes = [
 {path:'Register',component:RegistreComponent },
 {path:'Menu',component:MenuComponent},
 {path:'Restaurant',component:RestaurantComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
