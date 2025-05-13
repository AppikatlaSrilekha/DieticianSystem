🥗 Dietician Recommendation System

📌 Overview
The Dietician Recommendation System is a full-featured, Spring Boot-based microservice web application developed using Java, JSP, and MySQL. It is designed to analyze users’ dietary habits in real-time, detect nutritional deficiencies, and offer personalized recommendations. This project includes interactive dashboards, role-based authentication, real-time data visualization, and session management — all tailored to promote healthy living and seamless user experience.

🧠 Key Features
🩺 Dietician/Admin Module
- Dietician Registration with Doctor License validation
- Captcha verification for bot protection
- Forgot Password
- Real time Data Analytics Dashboards using Chart.js
- Dark/Light Theme Toggle in user dashboard
- Session Management
- Analyze and visualize user dietary records for:
  - Calorie and nutrient tracking
  - Daily/weekly/monthly visual trends
- Provide manual or automated food suggestions through email based on JMS 

🛠 Technical Architecture
- Built using Spring Boot microservices (modular controllers and services)
- Uses JSP for frontend rendering and Servlet API for control flow
- Clean separation of concerns (Controller, Service, Repository, Model)
- MySQL database with secure JDBC integration
- Responsive UI with custom CSS and JavaScript

💡 Technologies Used
__________________________________________________________
| Layer         | Tech Stack                             |
|---------------|----------------------------------------|
| Frontend      | JSP, HTML, CSS, JavaScript             |
| Backend       | Java, Spring Boot, Spring MVC          |
| Visualization | Chart.js, Google Charts                |
| Security      | Spring Security, Captcha, Token Reset  |
| Database      | MySQL                                  |
| Tools/IDE     | Eclipse / CodeReady Studio             |
| Server        | Apache Tomcat                          |
----------------------------------------------------------

📁 Project Structure
DieticianRecommendationSystem/
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ ├── controller/
│ │ │ ├── service/
│ │ │ ├── model/
│ │ │ └── repository/
│ │ └── resources/
│ │ ├── application.properties
├── webapp/
│ └── WEB-INF/
│ └── views/ (JSPs)
├── sql/
│ └── schema.sql
└── README.md

Future Enhancements
1. Integrate REST APIs for mobile compatibility
2. Docker-based containerization
3. Machine Learning for advanced health recommendations
