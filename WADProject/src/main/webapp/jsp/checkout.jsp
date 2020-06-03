<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored = "false" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>Item</td>
			<td>Number</td>
			<td>Cost</td>
		</tr>
		
		<c:set var="total" value="${0}"/>
		<c:forEach items="${objects}" var="object">
	   	<tr>
	   		<td>
	   			<img src="${object.url}" alt="${object.name}" style="width:200px"><br>
	   			${object.name}
	   		</td>
			<td>${object.amount}</td>
			<td>${object.price * object.amount}</td>
			<c:set var="total" value="${total + object.price * object.amount}" />
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3">Total cost is: <c:out value = "${total}"/></td>
		</tr>
	</table>
	<hr>
	
	<p>Confirm with your VISA card for payment</p>
	<form method="post" action="confirmTransaction">
		<table>
			<tr>
				<td>Card number</td>
				<td><input type="text" name="cardnumber"></td>
			</tr>
			<tr>
				<td>Card name</td>
				<td><input type="text" name="cardname"></td>
			</tr>
			<tr>
				<td>Expiry Date</td>
				<td><input type="date" name="carddate"></td>
			</tr>
			<tr>
				<td>Code</td>
				<td><input type="text" name="cardcode"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="confirm" value="Confirm"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>