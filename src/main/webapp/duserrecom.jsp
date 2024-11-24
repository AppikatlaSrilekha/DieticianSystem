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
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%@include file="duserheader.jsp" %>
<div class="container">
<%@include file="dusernavbar.jsp" %>
        <section class="content">
            <h2>Feedback</h2>
		    <form action="duserrecomended" method="POST">
		        <label for="email">User's Email:</label>
		        <input type="email" name="email" id="email"  value="${email}" required>
		        
		        <label for="subject">Subject:</label>
		        <input type="text" name="subject" id="subject" required>
		        
		        <label for="mssg">Message:</label>
		        <textarea name="mssg" id="mssg" rows="8" required>Give your valuable feedback and recommendations only here!</textarea>
		        
		        <input type="hidden" name="uname" value="${name}" required="required"/>
		        <input type="hidden" name="dname" value="${duser.name}" required="required"/>
		        <input type="hidden" name="duseremail" value="${duser.email}" required="required"/>
		        <button type="submit">Send Recommendation</button>
		    </form>
        </section>
       </div>
<%@include file="duserfooter.jsp" %>  
</body>
</html>