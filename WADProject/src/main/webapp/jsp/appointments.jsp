<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Requests</title>
</head>
<body>
	Welcome! ${user.username}

	<c:forEach items="${appointments.objects}" var="appointment" varStatus="tagStatus">
		<div class="card">
			<table>
		<tr>
			<td>Patient name</td>
			<td>${appointment.patient}</td> <!-- Patient's name -->
		</tr>
		
		<tr>
			<td>Illness description</td>
			<td>${appointment.illness_description}</td>
		</tr>
		
		<tr>
			<td>From - to</td>
			<td>${appointment.from_to}</td>
		</tr>
		
		<tr>
			<td><a href="${appointment.patient}-rejectRequest">Reject request</a></td>
			<td><a href="${appointment.patient}-acceptRequest">Accept request</a></td>
		</tr>
		
		<tr>
			<td>${message_reject}</td>
		</tr>
		
		<tr>
			<td>${message_accept}</td>
		</tr>
		</table>
		</div>
	</c:forEach>
	
	<a href="home.jsp">Home</a>
</body>
</html>