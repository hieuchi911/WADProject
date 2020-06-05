<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accepted appointments</title>
</head>
<body>

	<c:forEach items="${appointments.objects}" var="appointment" varStatus="tagStatus">
		<c:if test="${appointment.from_to != 'none'}">
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
			
			</table>
			</div>
		</c:if>
	</c:forEach>
	<table>		
		<tr>
			<td style="font-style: italic; color: red;">${message_accept}</td>
		</tr>
	</table>
	
	<a href="home.jsp">Home</a>

</body>
</html>