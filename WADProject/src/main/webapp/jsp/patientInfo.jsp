<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Information</title>
</head>
<body>
	<form:form id="patientForm" modelAttribute="patient" action="registerPatient" method="post">

		<table align="center">
			<tr>
				<td>Welcome! ${user.username}</td>
			</tr>
			<tr>
				<td><form:label path="name">Full Name</form:label></td>
				<td><form:input path="name" name="name" id="name" /></td>
			</tr>
			<tr>
				<td><form:label path="gender">Sex</form:label></td>
				<td><form:input path="gender" name="gender" id="gender" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone number</form:label></td>
				<td><form:input path="phone" name="phone" id="phone" /></td>
			</tr>
			<tr>
				<td><form:label path="address">Address</form:label></td>
				<td><form:input path="address" name="address" id="address" /></td>
			</tr>
			<tr>
				<td><form:label path="description">Medical Description</form:label></td>
				<td><form:input path="description" name="description" id="description" /></td>
			</tr>
			
			<tr style="display:none;">
				<td></td>
            	<td><form:input path="username" name="username" id="username" value="${user.username}" readonly="true"/></td>
            </tr>
            <tr>
				<tr><td><form:button id="register" name="register">Register</form:button></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="home.jsp">Home</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>