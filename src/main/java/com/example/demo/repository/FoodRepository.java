package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Food;

import java.time.LocalDate;
import java.util.List;


@Repository
public interface FoodRepository extends JpaRepository<Food, Integer>{

	public List<Food> findByUseremail(String useremail);
	
	@Query("SELECT f FROM Food f WHERE f.useremail = ?1 AND f.dateCreated >= ?2")
    List<Food> findRecentWeekIntake(String email, LocalDate dateCreated);

}
