<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="../shop">Shop</a>
	Welcome! ${user.gender}
	
	<form:form modelAttribute="cartobject" action="../addItem2Cart" method="post">
		<table>
			<tr> 
				<td colspan="2">
					<img src="../${object.url}" alt="${object.name}" style="width:400px">
					<form:hidden path="objectid" value="${object.id}"/>
				</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>${object.name}</td>
			</tr>
	
			<tr>
				<td>Manufacturer</td>
				<td>${object.manufacturer}</td>
			</tr>
	
			<tr>
				<td>Description</td>
				<td>${object.description}</td>
			</tr>
	
			<tr>
				<td>Price</td>
				<td>${object.price}</td>
			</tr>
			
			<tr>
				<td>Amount</td>
				<td><form:input path="amount"/></td>
			</tr>
			
			<tr>
				<td><input type="submit" name="submit" value="Add to cart"/></td>
				<td><a href="../logout">Home</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>