import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  user = {
    username: '',
    password: '',
  };
  message = '';
  
      


  onSubmit() {

        console.log("Login Successful",this.user.username);

    console.log('Username:', this.user.username);
    console.log('Password:', this.user.password);
        
 if (this.user.username && this.user.password) {
      this.message = 'Login Successful';
    } else {
      this.message = 'Please enter valid details';
    } 
 }
}
