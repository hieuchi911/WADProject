<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose a doctor</title>
</head>
<body>
	Welcome! ${user.username}
	<c:forEach items="${doctors.doctors}" var="doctor" varStatus="tagStatus">
		<div class="card">
			<table>
		<tr>
			<td>Name</td>
			<td>${doctor.name}</td>
		</tr>
		
		<tr>
			<td>Gender</td>
			<td>${doctor.gender}</td>
		</tr>
		
		<tr>
			<td>Rank</td>
			<td>${doctor.rank}</td>
		</tr>
		
		<tr>
			<td>Field</td>
			<td>${doctor.field}</td>
		</tr>
		
		<tr>
			<td>Description</td>
			<td>${doctor.description}</td>
		</tr>
		
		<tr>
			<td><a href="${doctor.username}-appointment">Make an appointment with Dr. ${doctor.name}</a></td>
		</tr>
		</table>
		</div>
	</c:forEach>
	
	<a href="home.jsp">Home</a>
</body>
</html>