<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MED</title>
<spring:url value="/css/mainDeco.css" var="mainDeco" />
<link href="${mainDeco}" rel="stylesheet" />
</head>
<body>
	<!-- if patients -->
	<c:if test="${user.usertype == 'patient' }">
		<div class="box">
			<div class="row nav-bar"
				style="background-image: url('images/elthon50mg.jpg'); background-size: cover; background-attachment: fixed;">
				<table>
					<tr>
						<td width="150px"><a href="profile">Your profile</a></td>

						<td width="150px"><a href="shop">Shop now</a></td>

						<td width="150px"><a href="contact.jsp">Contact us</a></td>
					</tr>
				</table>
			</div>
			<!-- LEFT SIDE BAR -->
			<div class="row content">
				<div class="left-bar">
					<table>
						<tr>
							<td><a href="showDoctors">Doctors</a></td>
						</tr>
					</table>
				</div>

				<div class="content">
					<div style="flex-grow: 1; flex-basis: auto;"><h2 align="center">About us</h2><hr width="300px"></div>
					
					<div style="flex-grow: 1; flex-basis: auto;"><h2 align="center">How to use our system</h2><hr width="300px"></div>
				</div>
			</div>
			
			<div class="row footer">
				<div style="text-align: right; width: 100%;">This is a project for the course Web application development</div>
			</div>
			
		</div>
	</c:if>


	<!-- if doctors -->
	<c:if test="${user.usertype == 'doctor' }">
		<!-- NAVIGATION BAR: fixed div?-->
		<div class="nav-bar">
			<table>
				<tr>
					<td><a href="profile">Your profile</a></td>

					<td><a href="contact.jsp">Contact us</a></td>
				</tr>
			</table>
		</div>
		<!-- LEFT SIDE BAR -->
		<div class="left-bar">
			<table>
				<tr>
					<td><a href="patientRecords">Patients</a></td>
				</tr>

				<tr>
					<td><a href="accepted-requests">Appointments</a></td>
				</tr>

				<tr>
					<td><a href="appointments">Appointment requests</a></td>
				</tr>
			</table>
		</div>
	</c:if>
</body>
</html>