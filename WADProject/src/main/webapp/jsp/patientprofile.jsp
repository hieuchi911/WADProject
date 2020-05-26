<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<table>
		<tr>
			<td>Welcome! ${patient.username}</td>
		</tr>
		
		<tr>
			<td>Name</td>
			<td>${patient.name}</td>
		</tr>
		
		<tr>
			<td>Gender</td>
			<td>${patient.gender}</td>
		</tr>
		
		<tr>
			<td>Phone</td>
			<td>${patient.phone}</td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td>${patient.address}</td>
		</tr>
		
		<tr>
			<td>Description</td>
			<td>${patient.description}</td>
		</tr>
		
		<tr>
			<td><a href="home.jsp">Home</a></td>
		</tr>
	</table>
</body>
</html>