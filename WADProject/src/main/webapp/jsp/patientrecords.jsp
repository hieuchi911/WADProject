<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient records</title>
</head>
<body>
	Welcome! ${user.username}

	<c:forEach items="${patientsRecords.objects}" var="prescription" varStatus="tagStatus">
		<div class="card">
		<table>
		<tr>
			<td>Name</td>
			<td>${prescription.patient}</td>
		</tr>
		
		<tr>
			<td>Diagnosis</td>
			<td>${prescription.diagnosis}</td>
		</tr>
		
		<tr>
			<td>From - to</td>
			<td>${prescription.from_to}</td>
		</tr>
		
		</table>
		</div>
	</c:forEach>
	
	<a href="home.jsp">Home</a>
</body>
</html>