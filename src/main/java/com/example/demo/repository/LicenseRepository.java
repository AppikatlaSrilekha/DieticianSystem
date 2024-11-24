package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.demo.model.License;


public interface LicenseRepository extends JpaRepository<License, Integer>{

	public License findByCode(String code);
	
}
