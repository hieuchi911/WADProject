<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<title>Welcome</title>
	<script>
		function toggleFormInputs() {
			if (document.patientForm.name.disabled == false) {
				document.patientForm.name.disabled = true;
				document.patientForm.gender.disabled = true;
				document.patientForm.phone.disabled = true;
				document.patientForm.address.disabled = true;
				document.patientForm.submit.style.display = "none";
			} else {
				document.patientForm.name.disabled = false;
				document.patientForm.gender.disabled = false;
				document.patientForm.phone.disabled = false;
				document.patientForm.address.disabled = false;
				document.patientForm.submit.style.display = "block";
			}
		}
		
		function toggleDescriptionInputs() {
			if (document.patientMedicalForm.allergy.disabled == false) {
				document.patientMedicalForm.allergy.disabled = true;
				document.patientMedicalForm.background.disabled = true;
				document.patientMedicalForm.current.disabled = true;
				document.patientMedicalForm.submit.style.display = "none";
			} else {
				document.patientMedicalForm.allergy.disabled = false;
				document.patientMedicalForm.background.disabled = false;
				document.patientMedicalForm.current.disabled = false;
				document.patientMedicalForm.submit.style.display = "block";
			}
		}
		
		function togglePasswordInputs() {
			let ps = document.getElementById("passwordSection")
			if (ps.style.display != "none") {
				ps.style.display = "none";
			} else {
				ps.style.display = "block";
			}
		}
	</script>
</head>
<body onLoad="toggleFormInputs(); toggleDescriptionInputs(); togglePasswordInputs()">
	<a href="shop">Shop</a>	
	<a href="showDoctors">Doctors</a>
	<a href="patient-accepted-requests">Appointments</a>

	
	<form:form id="patientForm" name="patientForm" modelAttribute="editUser" action="editPatient">
	<table>
		<tr>
			<td><form:input path="username" name="username" value="${user.username}" disabled="true"></form:input> <hr></td>
		</tr>
		
		<tr>
			<td>Name</td>
			<td>
				<form:input path="name" name="name" value="${user.name}"></form:input>
			</td>
		</tr>
		
		<tr>
			<td>Gender</td>
			<td>
				<form:input path="gender" name="gender" value="${user.gender}"></form:input>
			</td>
		</tr>
		
		<tr>
			<td>Phone</td>
			<td>
				<form:input path="phone" name="phone" value="${user.phone}"></form:input>
			</td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td>
				<form:input path="address" name="address" value="${user.address}"></form:input>
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="button" onclick="toggleFormInputs()">Edit</button>
			</td>
			<td>
				<button type="submit" name="submit" value="Confirm">Confirm</button>
			</td>
		</tr>
	</table>
	</form:form>
	<hr>
	
	<form name="patientMedicalForm" action="editDescription" method="post">
		<table>
			<tr>
				<td>Allergy</td>
				<td>
					<textarea name="allergy">${user.description.allergy}</textarea>
				</td>
			</tr>
			<tr>
				<td>Background disease</td>
				<td>
					<textarea name="background">${user.description.background}</textarea>
				</td>
			</tr>
			<tr>
				<td>Current symptoms/well-being</td>
				<td>
					<textarea name="current">${user.description.current}</textarea>
				</td>
			</tr>
			<tr>
				<td><button type="button" onclick="toggleDescriptionInputs()">Edit Medical Description</button></td>
				<td><input type="submit" name="submit" value="Confirm"/></td>
			</tr>
		</table>
	</form>
	<hr>
	
	<form action="editPassword" method="post">
		<button type="button" onclick="togglePasswordInputs()">Change Password</button>
		<div id="passwordSection">
			<table>
				<tr>
					<td>Old Password</td> 
					<td><input type="password" name="oldpw"/></td>
				</tr>
				<tr>
					<td>New Password</td> 
					<td><input type="password" name="newpw"/></td>
				</tr>
				<tr>
					<td>New Password</td> 
					<td><input type="password" name="newpwCf"/></td>
				</tr>
			</table>
			<input type="submit" name="edit-password" value="Confirm"/>
		</div>
	</form>
	
	
	
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
		
		<tr>
			<td><a href="homepage">Homepage</a></td>
			<td><a href="home.jsp">Home</a></td>
		</tr>
	</table>
	
</body>
</html>