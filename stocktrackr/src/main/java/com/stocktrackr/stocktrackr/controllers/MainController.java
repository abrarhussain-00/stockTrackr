package com.stocktrackr.stocktrackr.controllers;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.stocktrackr.stocktrackr.services.CategoryService;
import com.stocktrackr.stocktrackr.services.ProductService;
import com.stocktrackr.stocktrackr.services.UserService;

@Controller
public class MainController {
	private final UserService userServ;
	private final CategoryService categoryServ;
	private final ProductService productServ;

//================================Empty Constructor================================

	public MainController(UserService userServ, CategoryService categoryServ, ProductService productServ) {
		this.userServ = userServ;
		this.categoryServ = categoryServ;
		this.productServ = productServ;
	}
	
//================================Get Routes================================

	@GetMapping("/")
	public String home( HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/register";
		}
		model.addAttribute("loggedInUser", userServ.getOne((Long) session.getAttribute("user_id")))	
			.addAttribute("allProducts", productServ.getAll())
			.addAttribute("allCategories", categoryServ.getAll());
		return "main/dashboard.jsp";
	} 

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
//================================Post Routes================================


}