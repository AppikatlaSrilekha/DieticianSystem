package com.example.demo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.example.demo.model.Dietician;
import com.example.demo.model.Feedback;
import com.example.demo.model.Food;
import com.example.demo.model.Recomm;
import com.example.demo.model.Subscription;
import com.example.demo.model.User;
import com.example.demo.repository.DieticianRepository;
import com.example.demo.repository.FeedbackRepository;
import com.example.demo.repository.FoodRepository;
import com.example.demo.repository.LicenseRepository;
import com.example.demo.repository.RecommRepository;
import com.example.demo.repository.SubscriptionRepository;
import com.example.demo.repository.UserRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class DieticianServiceImpl implements DieticianService{

	@Autowired
	private DieticianRepository dieticianRepository;
	@Autowired
	private FoodRepository foodRepository;
	@Autowired
	private SubscriptionRepository subscriptionRepository;
	@Autowired
	private LicenseRepository licenseRepository;
	@Autowired
	private FeedbackRepository feedbackRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RecommRepository recommRepository;

	
    public String registerDietician(Dietician dietician) {
        if (licenseRepository.findByCode(dietician.getLicense()) != null) {
        	if(dieticianRepository.findByEmail(dietician.getEmail())!=null)
        		return "Registration Not Successfull!";
        	else {
        		dieticianRepository.save(dietician);
        		
//                try {
//                    sendRegistrationEmail(dietician.getEmail(), dietician.getName());
//                } catch (MessagingException e) {
//                    e.printStackTrace();
//                    return "Registration Successful, but email failed to send.";
//                }
        		
        		return "Registration Successful!";
        	}
        }
        return "License doesn't exists. Please use a different license.";
    }

    
	public Dietician checkDieticianLogin(String email, String password) {
		return dieticianRepository.checkduserlogin(email, password);
	}
	
	public String saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
        return "Thank you for your feedback!";
    }

	public String subscribeToNewsletter(String email) {
		if (subscriptionRepository.existsById(email)) {
            return "This email is already subscribed!";
        } else {
            Subscription s = new Subscription();
            s.setEmail(email);
            subscriptionRepository.save(s);
            return "Subscription successful!";
        }
	}
	
	public String updateDieticianProfile(Dietician dietician) {
        if (dieticianRepository.existsById(dietician.getEmail())) {
            dieticianRepository.save(dietician);
            return "Profile updated successfully";
        } else 
            return "Dietician not found";
    }

    public Dietician findDieticianByEmail(String email) {
        return dieticianRepository.findById(email).orElse(null);
    }

    public User getUserById(String email) {
    	return userRepository.findByEmail(email);
    }
    
    public List<Food> getFoodByUserId(String email){
    	return foodRepository.findByUseremail(email);
    }
    
	@Override
	public List<User> ViewAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public long usercount() {
		return userRepository.count();
	}

	@Override
	public List<Food> findWeekFoodIntake(String email) {
		LocalDate oneWeekAgo = LocalDate.now().minusDays(7);
        return foodRepository.findRecentWeekIntake(email, oneWeekAgo);
	}
	
	public List<Food> findDayFoodIntake(String email) {
		LocalDate today=LocalDate.now();
        return foodRepository.findRecentWeekIntake(email, today);
	}
	
	public void saveUser(User user) {
        userRepository.save(user);
    }
	
	public void saveDuser(Dietician duser) {
		dieticianRepository.save(duser);
	}


	@Override
	public void saveRecomm(Recomm recomm) {
		recommRepository.save(recomm);
	}
	
}
