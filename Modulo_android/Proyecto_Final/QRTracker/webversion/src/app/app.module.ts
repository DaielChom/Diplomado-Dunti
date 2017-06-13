import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouterModule }   from '@angular/router';
import { AppRoutingModule }     from './app-routing.module';

import { AppComponent }  from './app.component';
import { ClienteComponent } from './cliente.component';
import { PaqueteComponent } from './paquete.component'
import { FuncionarioComponent } from './funcionario.component'


@NgModule({
  imports:      [ BrowserModule, AppRoutingModule ],
  declarations: [ AppComponent, ClienteComponent, PaqueteComponent, FuncionarioComponent],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }
