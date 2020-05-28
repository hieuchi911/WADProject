<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<a href="shop">Shop</a>
	<form action="editUser">
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
		<td><input type="submit" name="edit-username" value="Edit Profile"/>Edit Profile</td>
		<td><input type="submit" name="edit-password" value="Edit Password"/>Edit Password</td>
		</tr>
		
		<tr>
			<td><a href="home.jsp">Home</a></td>
		</tr>
	</table>
	</form>
</body>
</html>