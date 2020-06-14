<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="manager-doctor">
<table>
	<tr>
		<th colspan="2">Doctor</th>
	</tr>
	<tr>
		<td>Username</td>
		<td><input type="text" name="doctor-username"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="doctor-password"></td>
	</tr>
	<tr>
		<td>Name</td>
		<td><input type="text" name="doctor-name"></td>
	</tr>
	<tr>
		<td>Gender</td>
		<td><input type="text" name="doctor-gender"></td>
	</tr>
	<tr>
		<td>Academic Rank</td>
		<td><input type="text" name="doctor-rank"></td>
	</tr>
	<tr>
		<td>Specialized Field</td>
		<td><input type="text" name="doctor-field"></td>
	</tr>
	<tr>
		<td>Bio-description</td>
		<td><input type="text" name="doctor-description"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit"></td>
	</tr>
</table>
</form>

<form method="post" action="manager-medicine">
<table>
	<tr>
		<th colspan="2">Medicine</th>
	</tr>
	<tr>
		<td>Name</td>
		<td><input type="text" name="medicine-name"></td>
	</tr>
	<tr>
		<td>Photo</td>
		<td><input type="text" name="medicine-url"></td>
	</tr>
	<tr>
		<td>Manufacturer</td>
		<td><input type="text" name="medicine-manufacturer"></td>
	</tr>
	<tr>
		<td>Description</td>
		<td><input type="text" name="medicine-description"></td>
	</tr>
	<tr>
		<td>Price</td>
		<td><input type="text" name="medicine-price"></td>
	</tr>
	<tr>
		<td>Instruction</td>
		<td><input type="text" name="medicine-instruction"></td>
	</tr>
	<tr>
		<td>Ingredients</td>
		<td><input type="text" name="medicine-ingredients"></td>
	</tr>
	<tr>
		<td>Side-effects</td>
		<td><input type="text" name="medicine-sideeffects"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit"></td>
	</tr>
</table>
</form>

<form method="post" action="manager-tool">
<table>
	<tr>
		<th colspan="2">Tool</th>
	</tr>
	<tr>
		<td>Name</td>
		<td><input type="text" name="tool-name"></td>
	</tr>
	<tr>
		<td>Photo</td>
		<td><input type="text" name="tool-photo"></td>
	</tr>
	<tr>
		<td>Manufacturer</td>
		<td><input type="text" name="tool-manufacturer"></td>
	</tr>
	<tr>
		<td>Description</td>
		<td><input type="text" name="tool-description"></td>
	</tr>
	<tr>
		<td>Price</td>
		<td><input type="text" name="tool-price"></td>
	</tr>
	<tr>
		<td>Usage</td>
		<td><input type="text" name=tool-usage></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" name="submit"></td>
	</tr>
</table>
</form>
</body>
</html>