<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write a symptom report</title>
</head>
<body>
<a href="shop">Shop</a>
	     
	<form:form id="sympReport" modelAttribute="symptomReport" action="addSymptomRp" method="post">
	<table align="center">
		<tr>
			<td><form:label path="gender">Sex</form:label></td>
			<td><form:input path="gender" name="gender" id="gender" /></td>
		</tr>
		
		<tr>
			<td><form:label path="dob">Date of birth</form:label></td>
			<td><form:input path="dob" name="dob" id="dob" /></td>
		</tr>
		
		<tr>
			<td><form:label path="id">ID card number</form:label></td>
			<td><form:input path="id" name="id" id="id" /></td>
		</tr>
		
		<tr>
			<td><form:label path="address">Address</form:label></td>
			<td><form:input path="address" name="address" id="address" /></td>
		</tr>
		<tr>
			<td><form:label path="description">Medical Description</form:label></td>
			<td><form:input path="description" name="description" id="description" /></td>
		</tr>
		
		<tr>
			<tr><td><form:button id="register" name="register">Submit</form:button></td>
		</tr>
		<tr>
			<td><a href="home.jsp">Home</a></td>
		</tr>
	</table>
	</form:form>

</body>
</html>