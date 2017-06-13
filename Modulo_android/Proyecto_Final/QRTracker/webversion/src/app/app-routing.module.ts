import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ClienteComponent } from './cliente.component';
import { PaqueteComponent } from './paquete.component'
import { FuncionarioComponent } from './funcionario.component'

const routes: Routes = [
  {path:'', redirectTo: '/clientes', pathMatch: 'full'},
  {path:'clientes', component: ClienteComponent},
  {path:'paquetes', component: PaqueteComponent},
  {path:'funcionarios', component: FuncionarioComponent},
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})

export class AppRoutingModule{}
