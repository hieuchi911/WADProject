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
	<!-- showDoctors and symptomRp left here temporarily-->
	
	<a href="showDoctors">Doctors</a>
	<a href="symptomRp">Write a symptom report</a>
	
	<!-- showDoctors and symptomRp left here temporarily-->
	
	<form action="editUser">
	<table>
		<tr>
			<td>Welcome! ${user.username}</td>
		</tr>
		
		<tr>
			<td>Name</td>
			<td>${user.name}</td>
		</tr>
		
		<tr>
			<td>Gender</td>
			<td>${user.gender}</td>
		</tr>
		
		<tr>
			<td>Phone</td>
			<td>${user.phone}</td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td>${user.address}</td>
		</tr>
		
		<tr>
			<td>Description</td>
			<td>${user.description}</td>
		</tr>
		<tr>
		<td><input type="submit" name="edit-profile" value="Edit Profile"/>Edit Profile</td>
		<td><input type="submit" name="edit-password" value="Edit Password"/>Edit Password</td>
		</tr>
		<tr>
			<td><a href="home.jsp">Home</a></td>
		</tr>
		
	</table>
	</form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</body>
</html>