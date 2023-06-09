package com.stocktrackr.stocktrackr.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {

	//======================================Attributes======================================
	
		@NotEmpty(message="Email is required!")
		@Email(message="Please enter a valid email!")
		private String email;
		
		@NotEmpty(message="Password is required")
		@Size(min=5, max=128, message="Password must be at least 5 characters")
		private String password;
		
	//======================================Empty Constructor======================================
		
		public LoginUser() {}
	
	//======================================Getters/Setters======================================
		
		public String getEmail() {
			return email;
		}
	
		public void setEmail(String email) {
			this.email = email;
		}
	
		public String getPassword() {
			return password;
		}
	
		public void setPassword(String password) {
			this.password = password;
		}
	}