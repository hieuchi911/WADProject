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

	<c:forEach items="${doctors.objects}" var="doctor" varStatus="tagStatus">
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
			<!-- If appointment's from_to with this doctor is not null, then print out from_to-->
		<c:if test = "${appointment-doctor.username != null }">
			<tr>
				<td>From_to: ${appointment-doctor.username.from_to}</td>
			</tr>
		</c:if>
		
			<!-- If appointment's from_to with this doctor is null, request is not yet processed-->
		<c:if test = "${appointment-(doctor.username) == null }">
			<tr>
				<td>Pending request</td>
			</tr>
		</c:if>
		
			<!-- If appointment's with this doctor is not made yet, enable patient to make appointment-->
		<c:if test="${haveappointment-(doctor.username) != 1 }">
			<tr>
				<td><a href="${doctor.username}-appointment">Make an appointment with Dr. ${doctor.name}</a></td>
			</tr>
		</c:if>
		<tr>
			<td style="font-style: italic; color: red;">${message_request}</td>
		</tr>
		
		</table>
		</div>
	</c:forEach>
	
	<a href="home.jsp">Home</a>
</body>
</html>