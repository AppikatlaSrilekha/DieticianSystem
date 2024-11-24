package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Dietician;

@Repository
public interface DieticianRepository extends JpaRepository<Dietician, String>{

	@Query("select d from Dietician d where d.email=?1 and d.pwd=?2")
	public Dietician checkduserlogin(String eemail, String epwd);
	
	public Dietician findByEmail(String email);
}
