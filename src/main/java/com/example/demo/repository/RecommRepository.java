package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Recomm;

public interface RecommRepository extends JpaRepository<Recomm, Long>{

}
