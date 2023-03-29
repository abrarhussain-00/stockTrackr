package com.stocktrackr.stocktrackr.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stocktrackr.stocktrackr.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>{
	Optional<Category>findByName(String name);
	List<Category>findAll();
}