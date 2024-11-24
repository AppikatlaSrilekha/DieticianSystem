<%@page import="java.util.List"%>
<%@page import="com.example.demo.model.Food"%>
<%@page import="com.example.demo.model.Dietician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	Dietician diet=(Dietician) session.getAttribute("duser");
	if(diet==null){
		response.sendRedirect("dusersessionexpiry");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
    <title>NutriTrack</title>
</head>
<body>
<%@include file="duserheader.jsp" %>
<div class="container">
<%@include file="dusernavbar.jsp" %>
<div class="container profile-page">
	<section class="content">
        <h3>User Details: ${user.name}</h3>
        <div id="message-text">
			    <c:out value="${message}" />
			</div>
        <c:if test="${not empty user.pic}">
            <img src="data:image/jpeg;base64,${user.pic}" alt="Profile Image" width="150"/>
        </c:if>
        <c:if test="${empty user.pic}">
            <img src="/images/default.png" alt="Default Profile Image" width="150"/>
        </c:if>

        <h4>Email: ${user.email}</h4>
        <h4>Contact: ${user.contact}</h4>
        <h4>Age: ${user.age}</h4>
        <h4>Calories: ${user.calories}</h4>
        <h4>Gender: ${user.gender}</h4>
        ${u}

        <h3>Food Intake</h3>
        <table>
            <tr>
                <th>Food Name</th>
                <th>Protein</th>
                <th>Carbohydrates</th>
                <th>Fats</th>
                <th>Calories</th>
            </tr>
            <c:forEach items="${foodlist}" var="food">
                <tr>
                    <td><c:out value="${food.name}"/></td>
                    <td><c:out value="${food.protein}"/></td>
                    <td><c:out value="${food.carbohydrates}"/></td>
                    <td><c:out value="${food.fats}"/></td>
                    <td><c:out value="${food.calories}"/></td>
                </tr>
            </c:forEach>
        </table>

        <h3>Analyze from Visualizations</h3>

        <!-- Provide recommendation form -->
        <form action="duserrecom" method="POST">
            <h2>Weekly Caloric Intake (Bar Chart)</h2>
			<canvas id="weeklyCaloriesChart"></canvas>
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<script>
			    const weeklyCaloriesData = {
			        labels: [
			        	<c:forEach var="entry" items="${weeklyCaloriesMap}">
				            "${entry.key}", <!-- Display the date -->
				        </c:forEach>
			        ],
			        datasets: [{
			            label: 'Calories',
			            data: [
			                <c:forEach var="entry" items="${weeklyCaloriesMap}">
			                    ${entry.value},  // Display each calorie value
			                </c:forEach>
			            ],
			            backgroundColor: 'rgba(54, 162, 235, 0.5)'
			        }]
			    };
			
			    const weeklyCaloriesConfig = {
			        type: 'bar',
			        data: weeklyCaloriesData,
			        options: {
			            scales: {
			                x: { title: { display: true, text: 'Date' } },
			                y: { title: { display: true, text: 'Calories' } }
			            }
			        }
			    };
			
			    new Chart(document.getElementById('weeklyCaloriesChart'), weeklyCaloriesConfig);
			</script>
			
			<h2>Today's Macronutrient Intake (Pie Chart)</h2>
			<canvas id="macronutrientPieChart"></canvas>
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<script>
			    const macronutrientData = {
			        labels: ['Protein', 'Carbs', 'Fats'],
			        datasets: [{
			            data: [${tprots}, ${tcarbs},${tfats}],
			            backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
			        }]
			    };
			
			    const macronutrientConfig = {
			        type: 'pie',
			        data: macronutrientData,
			        options: {
			            responsive: true,
			            plugins: {
			                legend: {
			                    position: 'top',
			                }
			            }
			        }
			    };
			
			    new Chart(document.getElementById('macronutrientPieChart'), macronutrientConfig);
			</script>
			<input type="hidden" name="name" value="${user.name}" required="required"/>
            <input type="hidden" name="email" value="${user.email}" required="required"/>
            <br/>
            <button type="submit">Provide Recommendation</button>
        </form>
    </section>
</div>
</div>
<%@include file="duserfooter.jsp" %>  
</body>
</html>