package com.stocktrackr.stocktrackr.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.stocktrackr.stocktrackr.models.LoginUser;
import com.stocktrackr.stocktrackr.models.User;
import com.stocktrackr.stocktrackr.repositories.UserRepository;

@Service
public class UserService {
//==========================Bring In Repository==========================
	
	private final UserRepository userRepo;

//==========================Put Above in Constructor==========================
	
	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
//======================================Logic For Registering User======================================
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		//Set Password to our User
		user.setPassword(hashed);
		return userRepo.save(user);
	}

//==========================Get One User By ID==========================
	
	public User getOne(Long id) {
		Optional<User> user = userRepo.findById(id);
		return user.isPresent() ? user.get() : null;
	}
	
//==========================Get One User By Email==========================

	public User getOne(String email) {
		Optional<User> user = userRepo.findByEmail(email);
		return user.isPresent() ? user.get() : null;
	}
	
//======================================Logic For Logging User In======================================
	
	public User login(LoginUser loginUser, BindingResult result) {
		
		//===if User has errors===
		
		if(result.hasErrors()) {
			return null;
		}
		
		//===check if user is in DB===
		
		User user = getOne(loginUser.getEmail());
		if(user == null) {
			result.rejectValue("email", "Unique", "Invalid Credentials");
		return null;
		}
		
		//===Check if Password Match in DB===

		if(!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Match", "Invalid Credentials");
			return null;
		}
		return user;
	}
}