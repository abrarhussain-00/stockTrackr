package com.stocktrackr.stocktrackr.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.stocktrackr.stocktrackr.models.Product;
import com.stocktrackr.stocktrackr.models.Category;

import com.stocktrackr.stocktrackr.repositories.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepo;

	

    public ProductService(ProductRepository productRepo) {
        this.productRepo = productRepo;

    }
	
	// get all products
	public List<Product> getAllProducts(){
		return productRepo.findAll();
	}
	
	// get categories for product
	public List<Category> getCategoriesForProduct(Long productId){
		Optional<Product> product = productRepo.findById(productId);
        return product.isPresent() ? (List<Category>) product.get().getCategories() : null;
	}

	// get one product by id
    public Product getOne(@Valid Long id) {
		Optional<Product> name = productRepo.findById(id);
		return name.isPresent() ? name.get() : null;
	}
	//if product already exists
	public boolean titleExist(String productName) {   
		Optional<Product> product = productRepo.findByName(productName);
		return product.isPresent() ? true : false;
	}
	
	// get all products 
    public List<Product> getAll() {
		return (List<Product>) productRepo.findAll();
	}
    
	//create product
	public Product create(Product product) {
		return productRepo.save(product);
	}

	//update product
	public Product update(Product product) {
		return productRepo.save(product);
	}

	//delete product
	public void delete(Long id) {
		productRepo.deleteById(id);
	}

}
