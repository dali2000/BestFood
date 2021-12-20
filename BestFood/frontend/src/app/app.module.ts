import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { RegistreComponent } from './client/registre/registre.component';
import { FormsModule } from '@angular/forms';
import { LoginComponent } from './client/login/login.component';
import { MenuComponent } from './Menu/menu/menu.component';
import { FooterComponent } from './footer/footer.component';
import { HomeComponent } from './home/home.component';
import { AllProductesComponent } from './all-productes/all-productes.component';
import { RestaurentComponent } from './restaurent/restaurent.component';
import { DietFoodsComponent } from './diet-foods/diet-foods.component';
import { DesertFoodsComponent } from './desert-foods/desert-foods.component';
import { ProfilComponent } from './client/profil/profil.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { ContactComponent } from './contact/contact.component';


@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    RegistreComponent,
    LoginComponent,
    MenuComponent,
    FooterComponent,
    HomeComponent,
    AllProductesComponent,
    RestaurentComponent,
    DietFoodsComponent,
    DesertFoodsComponent,
    ProfilComponent,
    SidebarComponent,
    ContactComponent
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
