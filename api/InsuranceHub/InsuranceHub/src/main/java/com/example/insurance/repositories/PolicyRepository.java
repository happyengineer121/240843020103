package com.example.insurance.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.insurance.entities.Policy;

public interface PolicyRepository extends JpaRepository<Policy, Integer> {
}
