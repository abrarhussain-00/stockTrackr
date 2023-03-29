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
import org.springframework.web.bind.annotation.PutMapping;

import com.stocktrackr.stocktrackr.models.Product;
import com.stocktrackr.stocktrackr.services.CategoryService;
import com.stocktrackr.stocktrackr.services.ProductService;
import com.stocktrackr.stocktrackr.services.UserService;

@Controller
public class ProductController {
    private final UserService userServ;
    private final CategoryService categoryServ;
    private final ProductService productServ;

    public ProductController(UserService userServ, CategoryService categoryServ, ProductService productServ) {
        this.userServ = userServ;
        this.categoryServ = categoryServ;
        this.productServ = productServ;
    }

    @GetMapping("/products")
    public String product(@ModelAttribute("productName") Product product, HttpSession session, Model model){
        if(session.getAttribute("user_id")==null){
			return "redirect:/login";
		}
        model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
        model.addAttribute("allProducts", productServ.getAll());
        return "main/products.jsp";
	} 

    @GetMapping("/products/create")
    public String createProduct(@ModelAttribute("productName") Product product, HttpSession session, Model model){
        if(session.getAttribute("user_id")==null){
			return "redirect:/login";
		}
        model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
        model.addAttribute("allProducts", productServ.getAll());
        model.addAttribute("allCategories", categoryServ.getAll());
        return "main/create.jsp";
	} 

    @PostMapping("/products/process")
    public String processCreateProduct(@Valid @ModelAttribute("productName") Product product, BindingResult result,
    HttpSession session, Model model) {
        if(productServ.titleExist(product.getName())){
			System.out.println("--->testing");
			result.rejectValue("name", "Unique", "Product already exists!");
		}
		
		if (result.hasErrors()) {
            model.addAttribute("allProducts", productServ.getAll());
            model.addAttribute("allCategories", categoryServ.getAll());
			return "main/create.jsp";
		}
		

		productServ.create(product);
		return "redirect:/products";
	}

    @GetMapping("/products/{id}/edit")
    public String editProduct(@PathVariable("id") Long id, Model  model, HttpSession session){
        model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
        model.addAttribute("productName", productServ.getOne(id));
        model.addAttribute("allCategories", categoryServ.getAll());
        return "main/edit.jsp";
    }

	@PutMapping("/process/{id}/edit")
	public String processEditProduct(@Valid @ModelAttribute("productName") Product product, BindingResult result,
			HttpSession session, Model model) {
		
		if (result.hasErrors()) {
			return "main/edit.jsp";
		}
        model.addAttribute("user", userServ.getOne((Long)session.getAttribute("user_id")));
        model.addAttribute("allCategories", categoryServ.getAll());
		productServ.update(product);
		return "redirect:/products";
	}
    
    @DeleteMapping("/products/{id}")
	public String delete(@PathVariable("id") Long id) {
		productServ.delete(id);
		return "redirect:/";
	}
}
