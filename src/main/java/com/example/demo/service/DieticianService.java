package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Dietician;
import com.example.demo.model.Feedback;
import com.example.demo.model.Food;
import com.example.demo.model.Recomm;
import com.example.demo.model.User;

public interface DieticianService {

	public String registerDietician(Dietician dietician);
	public Dietician checkDieticianLogin(String email, String password);
	public String saveFeedback(Feedback feedback);
	public String subscribeToNewsletter(String email);
	public String updateDieticianProfile(Dietician dietician);
	public Dietician findDieticianByEmail(String email);
	public List<User> ViewAllUsers();
	public long usercount();
	public User getUserById(String email);
	public List<Food> getFoodByUserId(String email);
	public List<Food> findDayFoodIntake(String email);
	public List<Food> findWeekFoodIntake(String email);
	public void saveUser(User user);
	public void saveDuser(Dietician duser);
	public void saveRecomm(Recomm recomm);
}
