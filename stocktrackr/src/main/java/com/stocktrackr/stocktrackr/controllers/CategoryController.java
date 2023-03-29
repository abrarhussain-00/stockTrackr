package com.stocktrackr.stocktrackr.controllers;



import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.stocktrackr.stocktrackr.models.Category;
import com.stocktrackr.stocktrackr.services.CategoryService;
import com.stocktrackr.stocktrackr.services.UserService;

@Controller
public class CategoryController {
    private final UserService userServ;
    private final CategoryService categoryServ;

    public CategoryController(UserService userServ, CategoryService categoryServ){
        this.userServ = userServ;
        this.categoryServ = categoryServ;
    }

	@GetMapping("/categories/create")
	public String createCategory(@ModelAttribute("categoryName") Category category, HttpSession session, Model model) {
		if(session.getAttribute("user_id")==null){
			return "redirect:/login";
		}
		model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
		model.addAttribute("allCategories", categoryServ.getAll());
		return "main/categories.jsp";
	} 

    @PostMapping("/categories/process")
    public String processCreateCategory(@Valid @ModelAttribute("categoryName") Category category, BindingResult result,
    HttpSession session, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
			model.addAttribute("allCategories", categoryServ.getAll());
			return "main/categories.jsp";
		}
		

		categoryServ.create(category);
		return "redirect:/categories/create";
	}
	
	@DeleteMapping("/categories/{id}")
	public String delete(@PathVariable("id") Long id) {
		categoryServ.delete(id);
		return "redirect:/";
	}
}
