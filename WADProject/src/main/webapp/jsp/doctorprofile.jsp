<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Medcare Medical</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<!-- main css -->
<link rel="stylesheet" href="css/content.css" type="text/css">
<link rel="stylesheet" href="css/frame.css" type="text/css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<!--================Header Menu Area =================-->
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
						src="images/misc/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="homepage">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="profile">My profile</a></li>
							<li class="nav-item"><a class="nav-link" href="shop">Shop now</a></li>
							<li class="nav-item"><a class="nav-link" href="contact">Contact us</a></li>
							<li class="nav-item"><a class="nav-link" href="logout">Log out</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================Header Menu Area =================-->

	<!--================Home Banner Area =================-->

	<section class="banner-area d-flex align-items-center"
		style="background-image: url(https://image.freepik.com/free-photo/blur-hospital_1203-7957.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-8"></div>
			</div>
		</div>
	</section>

	<!--================End Home Banner Area =================-->

	<div class="container-fluid">
		<div class="row">
			<div class="col-3" style="padding: 25px;">
				<table align="center">
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
			<div class="col">
				<div class="row">
					<div class="col card-team__body text-center">
						<h3>
							<a href="#">Personal information</a><hr width="200px">
						</h3>
						<form:form id="patientForm" name="patientForm"
							modelAttribute="editUser" action="editPatient">
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Username</div>
								<div class="col-5 form-control">
									${user.username}
								</div>
								<div class="col"></div>
							</div>
							<hr>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Name</div>
								<div class="col-5 form-control">
									${user.name}
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Gender</div>
								<div class="col-5 form-control">
									${user.gender}
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Academic Rank</div>
								<div class="col-5 form-control">
									${user.rank}
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Specialized Field</div>
								<div class="col-5 form-control">
									${user.field}
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 280px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Doctor Description</div>
								<div class="col-5 form-control" style="height: 250px">
									${user.description}
								</div>
								<div class="col"></div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<!--  End of row -->
	<!--================ End of main page: edit profile, edit symptom report, edit password =================-->
	
	
	
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>