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
            <img src="/images/logo.png" alt="Logo" class="logo">
            <h1 class="title">Diet Recommendation System</h1>
        </div>
    </header>

    <!-- Contact Us Section -->
    <div class="contact-section">
        <div class="contact-form-container">
            <h2>Contact Us</h2>
            <c:out value="${message}"></c:out>
            <form action="contact" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="text" name="subject" placeholder="Subject" required>
                <textarea name="mssg" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer">
        <p>&copy; NutriTrack System - Your path to better nutrition</p>
    </footer>
</body>
</html>
