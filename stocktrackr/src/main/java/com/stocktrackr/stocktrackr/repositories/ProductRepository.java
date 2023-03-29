package com.stocktrackr.stocktrackr.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stocktrackr.stocktrackr.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
	Optional<Product>findById(Long id);
	Optional<Product>findByName(String name);
	List<Product>findAll();
}
