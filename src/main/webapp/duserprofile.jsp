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
<div class="container profile-page">
        <section class="content">
	        <h3>MY PROFILE</h3>
	        <div id="message-text">
			    <c:out value="${message}" />
			</div>
			<form action="updateduserprofile" method="post" enctype="multipart/form-data">
			    
			    <label>Profile Picture:</label><br/>
	            <% 
	                if (diet.getPic() != null) { 
	                    byte[] imgData = diet.getPic().getBytes(1, (int) diet.getPic().length());
	                    String base64Image = new String(java.util.Base64.getEncoder().encode(imgData));
	            %>
	                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Profile Picture" width="150" height="150"/><br/>
	            <% } %>
	            <input type="file" name="pic" accept="image/*" /><br/>
            
			    <label>Name:</label>
			    <input type="text" name="name" value="${duser.name}" required /><br/>
			    
			    
			    <label>Age:</label>
			    <input type="number" name="age" value="${duser.age}" required /><br/>
			    
			    <label>Gender:</label><br/>
	            <input type="radio" name="gender" value="Male" <c:if test="${duser.gender == 'Male'}">checked</c:if> /> Male
	            <input type="radio" name="gender" value="Female" <c:if test="${duser.gender == 'Female'}">checked</c:if> /> Female<br/>
			    
			
			    <label>Qualification:</label>
			    <input type="text" name="qualification" value="${duser.qualification}" required /><br/>
			    
			    <label>Email:</label>
			    <input type="email" name="email" value="${duser.email}" required/>
			    
			    <label>Contact:</label>
			    <input type="text" name="contact" value="${duser.contact}" required /><br/>
			
			    <button type="submit">Update Profile</button>
			</form>
        </section>
       </div>
    </div>
<%@include file="duserfooter.jsp" %>  
</body>
</html>
