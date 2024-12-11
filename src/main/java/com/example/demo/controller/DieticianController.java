package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.model.Dietician;
import com.example.demo.model.Feedback;
import com.example.demo.model.Food;
import com.example.demo.model.Recomm;
import com.example.demo.model.User;
import com.example.demo.service.DieticianService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/duser")
public class DieticianController {

	@Autowired
	private DieticianService dieticianService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/")
	public ModelAndView base() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("base");
		return mv;
	}
	
	@GetMapping("contactus")
	public ModelAndView contactus() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contactus");
		return mv;
	}
	
	@PostMapping("contact")
	public ModelAndView contact(HttpServletRequest request) {
		String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String subject = request.getParameter("subject");
	    String message = request.getParameter("mssg");
		Feedback feedback = new Feedback();
		feedback.setName(name);
		feedback.setEmail(email);
		feedback.setSubject(subject);
		feedback.setMssg(message);
		String responseMessage = dieticianService.saveFeedback(feedback);
		ModelAndView mv = new ModelAndView("contactus");
        mv.addObject("message", responseMessage);
		return mv; 
	}
	
	
	@PostMapping("subscribe")
	public String subscribe(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String email = request.getParameter("email");
		String message = dieticianService.subscribeToNewsletter(email);
		redirectAttributes.addFlashAttribute("message", message);
		return "redirect:/";
	}
	
	@GetMapping("duserhome")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("duserhome");
		return mv;
	}
	
	
	@GetMapping("duserreg")
	public ModelAndView duserreg() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("duserreg");
		return mv;
	}
	
	@PostMapping("insertduser")
    public ModelAndView insertDietician(HttpServletRequest request) throws Exception{
		
		String name = request.getParameter("ename");
        String email = request.getParameter("eemail");
        String contact = request.getParameter("econtact");
        String license = request.getParameter("license");
        String gender = request.getParameter("egender");
        String pwd=request.getParameter("pwd");

        Dietician dietician = new Dietician();
        dietician.setName(name);
        dietician.setEmail(email);
        dietician.setContact(contact);
        dietician.setLicense(license);
        dietician.setGender(gender);
        dietician.setPwd(pwd);
        String msg = dieticianService.registerDietician(dietician);
        
		 String subject = "Confirmation of Registration";
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	     String date=LocalDate.now().format(formatter);;
		 MimeMessage mimeMessage = mailSender.createMimeMessage();
		 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
		 helper.setTo(email);
		 helper.setSubject(subject);
		 String htmlContent =
		 "<h3>NutriTrack User Recommendation System</h3>" +
		 "<p>Date:" +date+ "</p>" +
		 "<p>Greetings " +name+ ",</p><br/>" + 
		 "<h4>This is to inform that your registration with our application was SUCCESSFUL"+",</h4><br/>" + 
		 "<br/><p>For any queries reach out to at- dummy30030@gmail.com "+"</p>" ;
		 helper.setText(htmlContent, true);
		 mailSender.send(mimeMessage);	
        
        ModelAndView mv = new ModelAndView("duserreg");
        mv.addObject("message", msg);
        return mv;
    }

	@GetMapping("duserlogin")
	public ModelAndView duserlogin() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("duserlogin");
		return mv;
	}
	
	@GetMapping("forgotpwd")
	public ModelAndView forgotpwd() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("forgotpwd");
		return mv;
	}
	
	@PostMapping("sendresetlink")
    public ModelAndView sendResetLink(HttpServletRequest request) {
		String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String confirmpassword=request.getParameter("cpwd");
        Dietician duser = dieticianService.findDieticianByEmail(email);
        String mssg;
        if (duser == null) 
            mssg="No account found with this email address";
        if(password.equals(confirmpassword)) {
        	duser.setPwd(password);
        	dieticianService.saveDuser(duser);        	
        	mssg="Your password has been successfully updated.";
        }
        else
        	mssg="Passwords Mismatch!";
        ModelAndView mv=new ModelAndView("duserlogin");
        mv.addObject("message", mssg);
        return mv;
    }
	
	@PostMapping("checkduserlogin")
    public ModelAndView checkDieticianLogin(HttpServletRequest request) {
		
		// Get the reCAPTCHA response token
	    String captchaResponse = request.getParameter("g-recaptcha-response");

	    // Validate the reCAPTCHA response
	    boolean isCaptchaValid = validateCaptcha(captchaResponse);

	    if (!isCaptchaValid) {
	        ModelAndView mv = new ModelAndView("duserlogin");
	        mv.addObject("message", "Please complete the CAPTCHA to login.");
	        return mv;
	    }
		
        String email = request.getParameter("eemail");
        String password = request.getParameter("epwd");
        Dietician dietician = dieticianService.checkDieticianLogin(email, password);
        
        ModelAndView mv = new ModelAndView();
        if (dietician != null) {
            HttpSession session = request.getSession();
            session.setAttribute("duser", dietician);
            mv.setViewName("duserhome"); // Redirect to the home page after login
        } else {
            mv.setViewName("duserreg");
            mv.addObject("message", "Login Failed! Invalid Credentials");
        }
        return mv;
    }
	
	private boolean validateCaptcha(String captchaResponse) {
	    String secretKey = "6LdAAHoqAAAAADVZJc_oeH_TbRqPm5uEfGrOEpGw"; // Your secret key from Google reCAPTCHA
	    try {
	        URL url = new URL("https://www.google.com/recaptcha/api/siteverify?secret=" + secretKey + "&response=" + captchaResponse);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        connection.setRequestMethod("POST");
	        connection.setDoOutput(true);
	        connection.getOutputStream().flush();

	        InputStreamReader reader = new InputStreamReader(connection.getInputStream());
	        BufferedReader in = new BufferedReader(reader);
	        StringBuilder response = new StringBuilder();
	        String inputLine;
	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();

	        // Check the response from Google to validate CAPTCHA
	        String jsonResponse = response.toString();
	        return jsonResponse.contains("\"success\": true");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	
    @GetMapping("duserprofile")
    public ModelAndView duserprofile() {
    	ModelAndView mv=new ModelAndView("duserprofile");
    	return mv;
    }
    
    @PostMapping("updateduserprofile")
    public ModelAndView updateduserprofile(HttpServletRequest request,@RequestParam("pic") MultipartFile picFile){
    	ModelAndView mv = new ModelAndView();
    	try {
    		String email = request.getParameter("email");
    		String name = request.getParameter("name");
    		String qualification = request.getParameter("qualification");
    		String contact = request.getParameter("contact");
    		int age = Integer.parseInt(request.getParameter("age"));
    		String gender = request.getParameter("gender");
    		
    		Dietician dietician = dieticianService.findDieticianByEmail(email);
    		if (dietician == null) 
    			throw new Exception("Dietician not found");
    		
    		dietician.setName(name);
    		dietician.setQualification(qualification);
    		dietician.setContact(contact);
    		dietician.setAge(age);
    		dietician.setGender(gender);
    		
    		if (!picFile.isEmpty()) 
    			dietician.setPic(new javax.sql.rowset.serial.SerialBlob(picFile.getBytes()));
    		
    		String msg = dieticianService.updateDieticianProfile(dietician);
    		HttpSession session = request.getSession();
    		session.setAttribute("duser", dietician);
    		
    		mv.setViewName("duserprofile");
    		mv.addObject("message", msg);
    	} 
    	catch (Exception e) {
    		mv.setViewName("duserprofile");
    		mv.addObject("message", "Error updating profile: " + e.getMessage());
    	}
    	return mv;
    }
    
    @GetMapping("duserviewallusers")
    public ModelAndView duserviewallusers() {
		ModelAndView mv=new ModelAndView();
		List<User> userlist = dieticianService.ViewAllUsers();
		mv.addObject("userlist",userlist);
		long count=dieticianService.usercount();
		mv.addObject("usercount",count);
		mv.setViewName("duserviewallusers");
		return mv;
	}
      
    @GetMapping("/viewuser/{email}")
    public String viewuser(@PathVariable String email, HttpSession session) {
        User user = dieticianService.getUserById(email);
        List<Food> foodlist = dieticianService.findWeekFoodIntake(email);
        List<Food> calfood = dieticianService.findDayFoodIntake(email);
        session.setAttribute("user", user);
        session.setAttribute("foodlist", calfood);
        
        double dayCalories = calfood.stream().mapToDouble(Food::getCalories).sum();
        user.setCalories(dayCalories);
        dieticianService.saveUser(user);
        
        Map<LocalDate, Double> weeklyCaloriesMap = foodlist.stream().filter(food -> food.getDateCreated().isAfter(LocalDate.now().minusDays(7))).collect(Collectors.groupingBy(Food::getDateCreated,Collectors.summingDouble(Food::getCalories)));
        
        List<Food> todayFoodIntake = foodlist.stream().filter(intake -> intake.getDateCreated().equals(LocalDate.now())).collect(Collectors.toList());
        
        double totalProtein = todayFoodIntake.stream().mapToDouble(Food::getProtein).sum();
        double totalCarbs = todayFoodIntake.stream().mapToDouble(Food::getCarbohydrates).sum();
        double totalFats = todayFoodIntake.stream().mapToDouble(Food::getFats).sum();
        
        session.setAttribute("tprots", totalProtein);
        session.setAttribute("tcarbs", totalCarbs);
        session.setAttribute("tfats", totalFats);
        session.setAttribute("weeklyCaloriesMap", weeklyCaloriesMap);
        		
        return "redirect:/viewuserfood";
    }
    
    @GetMapping("viewuserfood")
    public ModelAndView viewuserfood() {
    	ModelAndView mv=new ModelAndView("viewuserfood");
    	return mv;
    }
    
    
    @PostMapping("duserrecom")
    public ModelAndView duserrecom(HttpServletRequest request) {
    	ModelAndView mv=new ModelAndView();
    	String email = request.getParameter("email");
    	String name = request.getParameter("name");
        mv.addObject("email",email);
        mv.addObject("name",name);
        return mv;
    }
    
    
	 @PostMapping("duserrecomended")
	 public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	 {
		 String uname=request.getParameter("uname");
		 String demail=request.getParameter("duseremail");
		 String dname=request.getParameter("dname");
		 
		 String toemail = request.getParameter("email");
		 String subject = request.getParameter("subject");
		 String msg = request.getParameter("mssg");
		 
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	     String date=LocalDate.now().format(formatter);;
		 MimeMessage mimeMessage = mailSender.createMimeMessage();
		 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	
//		 int otp = (int)(Math.random() * 99999); // random number generation
		 helper.setTo(toemail);
		 helper.setSubject(subject);
		 String htmlContent =
		 "<h3>NutriTrack User Recommendation System</h3>" +
		 "<p>Date:" +date+ "</p>" +
		 "<p>Greetings " +uname+ ",</p><br/>" + 
		 "<h4>This is Dr." +dname+ "</h4><br/>" +msg+ 
		 "<br/><p>For any queries reach out to me at- " +demail+ "</p>" ;
//		 "<p><strong>OTP:</strong> " + otp + "</p>"
		 helper.setText(htmlContent, true);
		 
		 ModelAndView mv = new ModelAndView("viewuserfood");
		 try {
			 mailSender.send(mimeMessage);
			 mv.addObject("message", "Email Sent Successfully");			 
		 }
		 catch(Exception e) {
			 mv.addObject("message", "Email Failed to Send!");			 
		 }//String toemail, String subject, String msg, String demail, String date
		 
		 Recomm recomm=new Recomm();
		 recomm.setEmail(toemail);
		 recomm.setMssg(msg);
		 recomm.setDate(date);
		 recomm.setDuseremail(demail);
		 recomm.setSubject(subject);
		 dieticianService.saveRecomm(recomm);
		 return mv;
	 }

	@GetMapping("dusersessionexpiry")
	public String dusersessionexpiry(HttpServletRequest request,RedirectAttributes redirectAttributes) {
		HttpSession session=request.getSession();
		
		session.removeAttribute("duser");
		//invalidate - removes all session attributes
		redirectAttributes.addFlashAttribute("message", "Session Expired!");
		return "redirect:/duserreg";
	}
	
	@GetMapping("duserlogout")
	public ModelAndView duserlogout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		
		session.removeAttribute("duser");
		//invalidate - removes all session attributes
		
		ModelAndView mv=new ModelAndView("duserlogin");
		return mv;
	}	
	
}
