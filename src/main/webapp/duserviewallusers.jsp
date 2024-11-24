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
	        <h3>View All Users </h3>
	        <h4>Total Users = <c:out value="${usercount}" /> </h4>
	        <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${userlist}" var="user">
            <tr>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.contact}"/></td>
                <td>
                <button type="button" onclick="window.location.href='<c:url value='viewuser/${user.email}'/>'">View More</button>
                </td>
            </tr>
        </c:forEach>
		    </table>
        </section>
       </div>
    </div>
<%@include file="duserfooter.jsp" %>  
</body>
</html>