package com.stocktrackr.stocktrackr.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.stocktrackr.stocktrackr.models.Category;
import com.stocktrackr.stocktrackr.repositories.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepo;

	public CategoryService(CategoryRepository categoryRepo) {
		this.categoryRepo = categoryRepo;
	}
	
	public Category getOne(Long id) {
		Optional<Category> name = categoryRepo.findById(id);
		return name.isPresent() ? name.get() : null;
	}
	
	public boolean titleExist(String categoryName) {  
		Optional<Category> category = categoryRepo.findByName(categoryName); 
		return category.isPresent() ? true : false;
	}

	public List<Category> getAll() {
		return (List<Category>) categoryRepo.findAll();
	}

	public Category create(Category category) {
		return categoryRepo.save(category);
	}

	public Category update(Category category) {
		return categoryRepo.save(category);
	}

	public void delete(Long id) {
		categoryRepo.deleteById(id);
	}
}
