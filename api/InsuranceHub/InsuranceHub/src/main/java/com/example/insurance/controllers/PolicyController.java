package com.example.insurance.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.insurance.entities.Policy;
import com.example.insurance.services.PolicyService;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins="http://localhost:5173")
public class PolicyController {
	

	@Autowired
	PolicyService pservice;
	
	
	@GetMapping("/viewpolicy")
	public List<Policy> getAllUsers()
	{ 
		return pservice.getAllpolicy();
		
	}
	
	
	
	
	
}
