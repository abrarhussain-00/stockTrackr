package com.stocktrackr.stocktrackr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.stocktrackr.stocktrackr.models.LoginUser;
import com.stocktrackr.stocktrackr.models.User;
import com.stocktrackr.stocktrackr.services.UserService;

@Controller
public class UserController {
//================================Bring in Service================================
	
	private final UserService userServ;

//================================Empty Constructor================================
	
	public UserController(UserService userServ) {
		this.userServ = userServ;
	}

//================================Get Routes================================
	
	//================Get Route for Login Page================
	
	@GetMapping("/login")
	public String login(@ModelAttribute("newUser") User user, @ModelAttribute("loginUser") LoginUser loginUser, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/";
		}
		return "user/loginReg.jsp";
	}

	@GetMapping("/register")
	public String register(@ModelAttribute("newUser") User user, @ModelAttribute("loginUser") LoginUser loginUser, HttpSession session) {
		if(session.getAttribute("user_id") != null) {
			return "redirect:/";
		}
		return "user/register.jsp";
	}

//================================Post Routes================================
	
	//================Post Route for Registering a User and Logging In================
	
	@PostMapping("/process/register")
	public String processRegister(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session){
		
		//=====================Validations=====================

		//=====Check if Passwords Match=====
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "Match", "Password must match");
		}
		
		//=====Reject if Email Taken=====
		
		if(userServ.getOne(newUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email is taken!");
		}
		
		//===Redirect if any of these hit===
		if(result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "user/register.jsp";
		}
		//===create User if No Errors===
		User newlyCreatedUser = userServ.registerUser(newUser);
		session.setAttribute("user_id", newlyCreatedUser.getId());
		return "redirect:/"; 
	}

	//================Post Route for Returning User and Logging In================
	
	@PostMapping("/process/login")
	public String processLogin(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
		User loggingUser = userServ.login(loginUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "user/loginReg.jsp";
		}
		session.setAttribute("user_id", loggingUser.getId());
		return "redirect:/";
	}

} 