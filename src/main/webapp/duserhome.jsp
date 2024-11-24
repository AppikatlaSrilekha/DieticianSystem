<%@page import="com.example.demo.model.Dietician"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
<meta charset="UTF-8">
<title>NutriTrack</title>
</head>
<body>
<%@include file="duserheader.jsp" %>
<div class="container">
<%@include file="dusernavbar.jsp" %>
        <section class="content">
	        <h3>Welcome, Dieitican <%= diet.getName() %> </h3>
	        <p>Use the navigation menu to manage employees or view feedback from users.</p>
        </section>
    </div>
<%@include file="duserfooter.jsp" %>    
</body>
</html>