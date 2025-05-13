<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NutriTrack</title>
    <link rel="stylesheet" type="text/css" href="basestyle.css">
</head>
<body>
    <!-- Header Section -->
    <header class="header">
        <div class="header-content">
            <img src="logo.png" alt="Logo" class="logo">
            <h1 class="title">Diet Recommendation System</h1>
        </div>
    </header>

    <!-- Contact Us Section -->
    <div class="contact-section">
        <div class="contact-form-container">
            <h2>Dietician Login</h2>
            <div id="message-text">
			    <c:out value="${message}" />
			</div>
		    <form action="checkduserlogin" method="post">
		        <input type="email" name="eemail" placeholder="Email" required>
		        <input type="password" name="epwd" placeholder="Password" required>
		        <script src="https://www.google.com/recaptcha/enterprise.js" async defer></script>
	            <div class="g-recaptcha" data-sitekey="6LdAAHoqAAAAAPnIyTAb3swRgemyNdf0Gdxi_0ZP" data-action="LOGIN"></div>
			    <p>Forgot Password? <a href="forgotpwd">Reset Password</a></p><br/>
		        
		        <button type="submit">Login</button>
		    </form>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <p>&copy; NutriTrack System - Your path to better nutrition</p>
    </footer>
</body>
</html>
