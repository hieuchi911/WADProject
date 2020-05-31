<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change password</title>
</head>
<body>
	<a href="shop">Shop</a>
	     
	<form id="EditPasswordForm" action="editPassword" method="post">
	<table align="center">
		<tr>
		<td>Old password</td>
		<td><input type="password" name="oldpw"></td>
		</tr>
		<tr>
			<td>New password</td>
			<td><input type="password" name="newpw"/></td>
		</tr>
		<tr>
			<td>New password again</td>
			<td><input type="password" name="newpwCf"/></td>
		</tr>
		<tr>
		<td style="font-style: italic; color: red;">${message}</td>
		</tr>
        
        <tr>
			<td><input type="submit" value="Update"></td>
		</tr>
		<tr>
			<td><a href="home.jsp">Home</a></td>
		</tr>
	</table>
	</form>
</body>
</html>