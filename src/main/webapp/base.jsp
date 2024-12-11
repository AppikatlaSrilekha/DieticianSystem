<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriTrack</title>
    <link rel="stylesheet" type="text/css" href="basestyle.css">
    <style>
    /* Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    color: #333;
    line-height: 1.6;
    background-color: #f5f5dc;
}

/* Message Box Styles */
.message-box {
    padding: 15px 20px;
    margin: 15px 0;
    font-size: 1.2rem;
    color: #333; /* Dark text for readability */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    transition: all 0.3s ease-in-out;
    background-color: rgba(240, 240, 255, 0.7); /* Light blue background */
    border-left: 5px solid #2196F3; /* Blue border for info */
}

#message-text {
    color: #0073e6; /* Blue shade */
    font-size: 1.2em;
    font-weight: bold;
    padding: 10px 0; /* Adds space above and below the text */
    text-align: center; /* Centers the text horizontally */
    line-height: 1.5;
}

.hero {
    position: relative;
    text-align: center;
    height: 100vh;
    color: #f5f5dc;
    background-image: url('https://cdn.unenvironment.org/styles/article_billboard_image/s3/2024-09/Untitled%20design%20(12).png?itok=EUrFtKpd');
    background-size: cover; /* Ensures the image covers the entire area */
    background-repeat: no-repeat; /* Prevents the image from tiling */
    background-position: center center; /* Centers the image */
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    overflow: hidden;
}

.hero-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -1;
    opacity: 0.9;
}

.hero-content {
    z-index: 1;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.hero-content .logo {
    height: 80px;
    margin-bottom: 20px;
}

.hero-content h1 {
    font-size: 3.5rem;
    margin-bottom: 10px;
    color: #f5f5dc;
}

.hero-content p {
    font-size: 1.5rem;
    max-width: 600px;
    margin: 0 auto;
    color: #f4f4f9;
}


/* 2nd Section: Layout with Image Background */
.content-section {
    position: relative;
    height: 100vh;
    background-image: url('https://ntfb.org/wp-content/uploads/2024/11/meal-prepping.jpg');
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    padding: 40px;
}

.content-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.05); /* Low transparency (10% opacity) */
    z-index: 0;
}

.content-container {
    display: flex;
    justify-content: space-between;
    width: 100%;
    color: black;
    z-index: 1;
}

.left-content {
    width: 40%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.page-box {
    background-color: rgba(241, 233, 233, 0.5);
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.right-content {
    width: 55%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: center;
}

.right-content h2 {
    font-size: 3rem;
    margin-bottom: 30px;
}

.page-box-right {
    background-color: rgba(241, 233, 233, 0.5);
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}



.third-section {
    position: relative;
    height: 100vh;
    background-image: url('data:image/jpeg;base64,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');
    background-size: cover;
    background-position: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 40px;
}

.third-section h2 {
    color: white;
    font-size: 3.5rem;
    margin-bottom: 40px;
    text-align: center;
}

.content-box {
    background-color: #f5f5dc;
    padding: 30px;
    width: 30%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    text-align: center;
}

.content-box h3 {
    margin-bottom: 15px;
    font-size: 1.8rem;
}

.content-box p {
    font-size: 1.2rem;
}

/* 4th Section: Left Content with Login Button and Right Image */
.fourth-section {
    display: flex;
    height: 100vh;
    align-items: center;
    padding: 40px;
    background-color: #f5f5dc;
}

.left-side {
    width: 40%;
    padding: 20px;
}

.left-side h2 {
    font-size: 2.5rem;
    margin-bottom: 20px;
}

.left-side p {
    font-size: 1.2rem;
    margin-bottom: 20px;
}

.login-button {
    padding: 10px 20px;
    font-size: 1.2rem;
    background-color: #36393b;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.login-button:hover {
    background-color: black;
}

.right-side {
    width: 60%;
    height: 100%;
    background-image: url('https://i.pinimg.com/736x/a3/15/3a/a3153a6ad79ce1f96821c0754193c87d.jpg');
    background-size: cover;
    background-position: center;
}

.fifth-section {
    text-align: center;
    padding: 40px;
    background-color: #f4f4f9;
    background-image: url('https://img.freepik.com/premium-photo/various-spices-hexagonal-jars_323634-91.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}

.fifth-section h2 {
    font-size: 3.5rem;
    color: #333;
    margin-bottom: 40px;
}

.content-columns {
    display: flex;
    justify-content: space-between;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
}

.content-item {
    width: 30%;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    margin: 0 10px;
}

.content-item h3 {
    margin-bottom: 15px;
    font-size: 1.8rem;
}

.content-item p {
    font-size: 1.2rem;
}

.explore-button {
    margin-top: 40px;
    padding: 10px 20px;
    font-size: 1.2rem;
    background-color: #36393b;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.explore-button:hover {
    background-color: black;
}

/* Contact Us Section: Full-width layout */
.last-section {
    width: 100%;
    background-color: #3e4346;
    color: #f5f5dc;
    padding: 10px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.contact-container {
    max-width: 1200px;
    width: 100%;
    display: grid;
    grid-template-columns: 1fr 0.5fr;
    gap: 20px;
}

.logo-section img {
    width: 50px;
}

.logo-section a {
    color: white;
    text-decoration: none;
}

.good-sentence {
    font-size: 1.2em;
    margin: 20px 0;
    text-align: center;
}

.social-address, .resources-subscribe {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

h4 {
    margin-bottom: 10px;
}

.social-media ul, .resources ul {
    list-style: none;
    padding: 0;
}

.social-media ul li, .resources ul li {
    margin: 5px 0;
}

.social-media ul li a, .resources ul li a {
    color: white;
    text-decoration: none;
}

.subscribe form {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.subscribe input {
    padding: 10px;
    border: none;
    border-radius: 5px;
    width: 100%;
}

.subscribe button {
    padding: 10px;
    background-color: rgb(104, 81, 81);
    color: #f5f5dc;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.subscribe button:hover {
    background-color: #0f0f0f;
}

/* Contact Us Section Styles */
/* Contact Us Section */
.contact-section {
    background-image: url('');
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.contact-form-container {
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 400px; /* Fixed width for form */
    text-align: center;
}

.contact-form-container h2 {
    margin-bottom: 20px;
    font-size: 2rem;
}

.contact-form-container input,
.contact-form-container textarea {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1rem;
}

.contact-form-container button {
    padding: 10px;
    background-color: #36393b;
    color: #f5f5dc;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 1rem;
}

.contact-form-container button:hover {
    background-color: black;
}

/* Header and Footer Styles */
/* Header Styles */
.header {
    background-color: #3e4346;
    color:#f5f5dc;
    padding: 10px 20px; /* Added padding for better spacing */
}

.header-content {
    display: flex;
    align-items: center; /* Align items vertically centered */
    justify-content: space-between; /* Space between logo and title */
}

.logo {
    height: 50px; /* Set a height for the logo */
}

.title {
    margin-left: 20px; /* Space between logo and title */
}

.footer {
    background-color: #3e4346;
    color: #f5f5dc;
    padding: 10px 0;
    text-align: center;
    position: relative;
    bottom: 0;
    width: 100%;
}


/* Footer Styles */
footer {
    margin-top: auto;
    padding: 10px;
    background-color: #3e4346;
    color: white;
    text-align: center;
    width: 100%;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    .content-container, .content-columns, .fourth-section, .last-section .contact-container {
        flex-direction: column;
        align-items: center;
    }

    .content-box, .page-box, .page-box-right {
        width: 80%;
    }
}

    </style>
</head>
<body>
    <!-- 1st Section: Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <img src="https://cdn-icons-png.flaticon.com/512/2771/2771406.png" alt="Logo" class="logo">
            <h1>Diet Recommendation &</h1>
            <h1>Nutrition Monitoring System</h1>
        </div>
    </section>

    <!-- 2nd Section: Left and Right content with another background image -->
    <section class="content-section">
        <div class="content-container">
            <!-- Left Content -->
            <div class="left-content">
                <div class="page-box">
                    <h3>What is Nutrient Deficit?</h3>
                    <p>Lack of essential nutrients, leading to health issues like fatigue and impaired growth.</p>
                </div>
                <div class="page-box">
                    <h3>How Can I Balance My Diet?</h3>
                    <p>Watch your portion sizes, limit processed foods by reducing sugar and unhealthy fats</p>
                </div>
                <div class="page-box">
                    <h3>Why is This Important for Me?</h3>
                    <p>A balanced diet supports overall health, energy levels, and prevents chronic diseases, especially during growth periods</p>
                </div>
            </div>

            <!-- Right Content -->
            <div class="right-content">
                <h2>Your Burning <br>Questions Answered!</h2>
                <div class="page-box-right">
                    <h3>Can I Eat Junk Food?</h3>
                    <p>Occasional junk food is fine, but it should be limited. Focus on healthier options for regular meals.</p>
                </div>
                <div class="page-box-right">
                    <h3>How Do I Track My Nutrients?</h3>
                    <p>Track your nutrients using apps like NutriTrack, keeping a food diary, or consulting a dietitian.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- 3rd Section: Centered Heading and Three Page-Type Contents -->
    <section class="third-section">
        <h2>Different Meal Plans Offered</h2>
        <div class="content-columns">
            <div class="content-box">
                <h3>Therapeutic Diet</h3>
                <p>This type of diet is specifically designed to address and manage a particular medical condition or symptom. For instance, a low-sodium diet for hypertension or a diabetic-friendly diet for managing blood sugar levels. It plays a key role in healing or controlling disease symptoms.</p>
            </div>
            <div class="content-box">
                <h3>Maintenance Diet</h3>
                <p>This is the everyday diet that people follow to maintain their health and nutritional needs. It is balanced and sustainable, providing the body with necessary nutrients for daily functioning without drastic changes.</p>
            </div>
            <div class="content-box">
                <h3>Experimental Diet</h3>
                <p>This type of diet is usually short-term and followed to test out new eating methods or food combinations. It is often used to explore the impact of specific diets on health, such as trying a ketogenic or intermittent fasting diet to see how it affects weight or energy levels.</p>
            </div>
        </div>
    </section>

     <!-- 4th Section: Left Content with Login Button and Right Image -->
     <section class="fourth-section">
        <div class="left-side">
            <h2>What we Offer?</h2>
            <p>Our web application helps improve dietary health for children and adolescents by offering:
                Analyze eating habits to spot missing nutrients and suggest ways to fix them.
                Admins can update nutritional data, track user health, and adjust recommendations to stay up-to-date.
                Users can keep track of their nutrient intake and make adjustments as needed.
                Timely Alerts: If a deficiency is detected, the app sends alerts and recommendations for quick action.
                </p>
            <button class="login-button" onclick="location.href='duserreg.jsp'" style="color:wheat">LOGIN/SIGNUP</button>
        </div>
        <div class="right-side"></div>
    </section>

    <!-- 5th Section: Centered Heading and Three Contents with a Button -->
    <section class="fifth-section">
        <h2>Facts about Diet and Nutrition</h2>
        <div class="content-columns">
            <div class="content-item">
                <h3>Situation</h3>
                <p>Poor dietary habits and nutrient deficiencies among children and adolescents leading to various health issues such as obesity, malnutrition, and chronic diseases</p>
            </div>
            <div class="content-item">
                <h3>Response by Public</h3>
                <p>People are becoming more aware of healthy eating, but there's still confusion about what a balanced diet is, often resulting in reliance on processed foods or fad diets.</p>
            </div>
            <div class="content-item">
                <h3>Suggestible Action</h3>
                <p>Educate on balanced diets with whole foods and encourage personalized meal plans. Promote healthy eating habits through collaboration among schools, parents, and communities.</p>
            </div>
        </div>
        <button class="explore-button" onclick="location.href='contactus.jsp'" style="color:wheat">CONTACT US</button>
    </section>

    <!-- Last Section: Contact Us -->
    <section class="last-section full-width">
        <div class="contact-container">
            <!-- Logo, Heading, and Description -->
            <div class="logo-section">            
                <img src="https://cdn-icons-png.flaticon.com/512/2771/2771406.png" alt="Logo" class="logo">
                <h2>NutriTrack System</h2>
                <a href="https://appikatlasrilekha.github.io/NutriTrack/">https://appikatlasrilekha.github.io/NutriTrack/</a>
            </div>

            <!-- Good Sentence -->
            <div class="good-sentence">
                <p>"Effortlessly track your diet and receive tailored meal plans to fill any nutrient gaps, ensuring you maintain a healthy and balanced lifestyle"</p>
            </div>

            <!-- Social media and Address -->
            <div class="social-address">
                <div class="social-media">
                    <h4>Follow Us</h4>
                    <ul>
                        <li>LinkedIn <a href="#">@nutriTrack</a></li>
                        <li>Instagram <a href="#">@nutriTrack</a></li>
                        <li>Telegram <a href="#">@NutriTrack</a></li>
                    </ul>
                </div>
                <div class="address">
                    <h4>Our Address</h4>
                    <p>123, Donno Residency, Anywhere Street, Nowhere City, Cantbefound State - 224453</p>
                </div>
            </div>

            <!-- Resources and Subscribe Section -->
            <div class="resources-subscribe">
                <div class="resources">
                    <h4>Resources</h4>
                    <ul>
                        <li><a href="https://www.calculator.net/bmi-calculator.html">BMI Calculator</a></li>
                        <li><a href="https://www.calculator.net/body-fat-calculator.html">Body Fat Calculator</a></li>
                        <li><a href="https://www.calculator.net/calorie-calculator.html">Calorie Calculator</a></li>
                    </ul>
                </div>
                <div class="subscribe">
                    <h4>Subscribe for Updates</h4>
                    <form action="subscribe" method="POST">
                        <input type="email" name="email" placeholder="Enter your email" required>
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
                <c:if test="${not empty message}">
				    <script>
				        alert('${message}');
				    </script>
				</c:if>
            </div>
        </div>
    </section>
    <footer>
        <p>&copy; 2024 Health System. All rights reserved.</p>
    </footer>
</body>
</html>
