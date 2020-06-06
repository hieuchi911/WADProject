<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p>Welcome! ${user.name}</p>
	
	<c:forEach items="${objects.objects}" var="object" varStatus="tagStatus">
		<form action="add-medicine-${object.id}" method="post">
		<div class="card">
		    <img src="${object.url}" alt="${object.name}" style="width:100px">
			<h1>${object.name}</h1>
			<p>Made by ${object.manufacturer} </p>
			<input type="text" name="amount"/>
			<input type="submit" name="submit"/>
		</div>
		</form>
	</c:forEach>
	<hr>
	
	<c:if test="${prescription.prescription.objects.size() > 0}">
		<table>
			<tr>
				<td>Medicine name</td>
				<td>Amount</td>
				<td></td>
			</tr>
		<c:forEach items="${prescription.prescription.objects}" var="object" varStatus="tagStatus">
			<tr>
				<td>${object.name}</td>
				<td>${object.amount}</td>
				<td>
					<form action="removemed-${object.id}" method="get">
						<button name="Remove">Remove</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		</table>
		<form action="confirm-prescription" method="get">
			<input type="text" name="diagnosis"/>
			<input type="text" name="from-to"/>
			<button name="confirm">Confirm</button>
		</form>
	</c:if>
</body>
</html>