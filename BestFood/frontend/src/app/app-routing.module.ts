import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistreComponent } from './client/registre/registre.component';
import { RestaurantComponent } from './restaurant/restaurant.component';

const routes: Routes = [
 {path:'Register',component:RegistreComponent },
 {path:'Restaurant',component:RestaurantComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
