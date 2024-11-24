package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="recomm_table")
public class Recomm {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-generate unique ID
    private Long id;
	@Column(nullable = false)
	private String uemail;
	@Lob // To support large text data
	@Column(nullable = false)
	private String mssg;
	@Column(nullable = false)
	private String subject;
	@Column(nullable = false)
	private String duseremail;
	@Column(nullable = false)
	private String date;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getDuseremail() {
		return duseremail;
	}
	public void setDuseremail(String duseremail) {
		this.duseremail = duseremail;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return uemail;
	}
	public void setEmail(String email) {
		this.uemail = email;
	}
	public String getMssg() {
		return mssg;
	}
	public void setMssg(String mssg) {
		this.mssg = mssg;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

}
