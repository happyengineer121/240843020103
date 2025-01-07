package com.example.insurance.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.insurance.entities.Policy;
import com.example.insurance.repositories.PolicyRepository;
@Service
public class PolicyService {
     @Autowired
	PolicyRepository prepo;
	
     
     
     public List<Policy> getAllpolicy() {  return prepo.findAll(); }
}
