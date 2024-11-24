<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriTrack</title>
    <link rel="stylesheet" type="text/css" href="basestyle.css">
</head>
<body>
    <!-- 1st Section: Hero Section -->
    <section class="hero">
        <img src='${pageContext.request.contextPath}/images/2.jpeg' alt="Hero Image" class="hero-image">
        <div class="hero-content">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="logo">
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
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="logo">
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
