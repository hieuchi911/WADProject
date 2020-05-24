<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome</title>
	<style>
		.card {
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			max-width: 300px;
			padding-bottom: 12px;
			margin: auto;
			text-align: center;
			font-family: arial;
		}
		
		.card img:hover {
			opacity: 0.7;
		}
	</style>
</head>
<body>
	<a href="home.jsp">Home</a>
	<c:forEach items="${objects.objects}" var="object" varStatus="tagStatus">
		<div class="card">
			<a href="">
			   <img src="${object.url}" alt="${object.name}" style="width:100%">
			</a>
			<h1>${object.name}</h1>
			<p>Made by ${object.manufacturer} </p>
		</div>
	</c:forEach>
</body>
</html>