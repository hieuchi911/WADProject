<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="img/favicon.png" type="image/png">
<title>Medcare Medical</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/animate-css/animate.css">
<!-- main css -->
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/responsive.css">
<title>Welcome</title>
</head>
<body>
	<!--================Header Menu Area =================-->
	<!-- if patients -->
		
	<header class="header_area">
		<div class="top_menu row m0">
			<div class="container">
				<div class="float-left">
					<a class="dn_btn" href="mailto:medical@example.com"><i
						class="ti-email"></i>medical@example.com</a> <span class="dn_btn">
						<i class="ti-location-pin"></i>Find our Location
					</span>
				</div>
				<div class="float-right">
					<ul class="list header_social">
						<li><a href="#"><i class="ti-facebook"></i></a></li>
						<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
						<li><a href="#"><i class="ti-linkedin"></i></a></li>
						<li><a href="#"><i class="ti-skype"></i></a></li>
						<li><a href="#"><i class="ti-vimeo-alt"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index"><img
						src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
			</nav>
		</div>
	</header>
		

	<div class="login-registration">
		<form:form id="regForm" modelAttribute="patient" action="registerProcess" method="post">
			<fieldset>
				<table align="center">
					<tr>
						<td><form:label path="username">Username</form:label></td>
						<td><form:input class="form-control" path="username" name="username" id="username" /></td>
					</tr>
					<tr>
						<td><form:label path="password">Password</form:label></td>
						<td><form:password class="form-control" path="password" name="password" id="password" /></td>
					</tr>
					<tr>
						<td><label>Confirm Password</label></td>
						<td><input class="form-control" type="password" name="confirm-password" id="confirm-password"/></td>
					</tr>
					<tr style="display:none;">
						<td><form:input path="usertype" name="usertype" id="usertype" value="patient" />Patient</td>
					</tr>
					
					<tr>
						<td></td>
						<td><form:button class="form-control" id="register" name="register">Register</form:button></td>
					</tr>
					<tr>
						<td colspan="2" style="font-style: italic; color: red;">${message}</td>
					</tr>
				</table>
			</fieldset>
		</form:form>
	</div>
		

		
	<footer class="footer-area area-padding-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 single-footer-widget">
					<h4>About this website</h4>
					<p>This is a project for the course Web application development</p>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between">
				<p class="col-lg-8 col-sm-12 footer-text m-0">
					
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
						class="fab fa-twitter"></i></a> <a href="#"><i
						class="fab fa-dribbble"></i></a> <a href="#"><i
						class="fab fa-linkedin"></i></a>
				</div>
			</div>
		</div>
	</footer>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>