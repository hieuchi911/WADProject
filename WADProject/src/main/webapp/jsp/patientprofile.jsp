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
<title>Patient</title>

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

    <section class="banner-area d-flex align-items-center" style="background-image: url(https://image.freepik.com/free-photo/blur-hospital_1203-7957.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                	
                </div>
            </div>
        </div>
    </section>

    <!--================End Home Banner Area =================-->
	
	<!--================ Main page: edit profile, edit symptom report, edit password =================-->
	
	<div class="row">
		<table align="center">
			<tr>
				<td style="font-style: italic; color: red;">${message}</td>
			</tr>
		</table>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-2" style="padding: 25px;">
				<table align="center">
					<tr>
						<td><a href="showDoctors">Doctors</a></td>
					</tr>

					<tr>
						<td><a href="patient-accepted-requests">Appointments</a></td>
					</tr>
				</table>
			</div>
			<div class="col">
				<div class="row">
					<div class="col card-team__body text-center">
						<h3>
							<a href="#">Personal information</a><hr width="200px">
						</h3>
						<form:form id="patientForm" name="patientForm" modelAttribute="editUser" action="editPatient">
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Username</div>
								<div class="col-5">
									<form:input class="form-control characters" path="username" name="username" value="${user.username}" disabled="true"></form:input>
								</div>
								<div class="col"></div>
							</div>
							<hr>
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Name</div>
								<div class="col-5">
									<form:input class="form-control letters" path="name" name="name" value="${user.name}" disabled="true" required="true"></form:input>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Gender</div>
								<div class="col-5">
									<form:input class="form-control letters" path="gender" name="gender" value="${user.gender}" disabled="true" required="true"></form:input>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">	
								<div class="col-1"></div>								
								<div class="col-3" style="text-align: right">Phone</div>
								<div class="col-5">
									<form:input class="form-control numbers" path="phone" name="phone" value="${user.phone}" disabled="true" required="true"></form:input>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Address</div>
								<div class="col-5">
									<form:input class="form-control ln" path="address" name="address" value="${user.address}" disabled="true" required="true"></form:input>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 150px">
								<div class="col-4"></div>
								<div class="col-3">
									<button class="form-control" id="edit-basic" type="button">Edit</button>
									<hr>
									<button class="form-control" id="edit-password" type="button">Change Password</button>
								</div>
								<div class="col-2">
									<button class="form-control" id="edit-basic-confirm" type="submit" name="submit" value="Confirm">Confirm</button>
								</div>
							</div>
						</form:form>
					</div>
					
					<div class="w-100"></div>
					
					<div class="col card-team__body text-center" id="passwordSection" style="display: none;">
						<form action="editPassword" method="post">
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">Old Password</div>
								<div class="col-5">
									<input class="form-control" type="password" name="oldpw" required/>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right">New Password</div>
								<div class="col-5">
									<input class="form-control" type="password" name="newpw" required/>
								</div>
								<div class="col"></div>
							</div>
							
							<div class="row" style="height: 50px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right;">Confirm New Password</div>
								<div class="col-5">
									<input class="form-control" type="password" name="newpwCf" required/>
								</div>
								<div class="col"></div>
							</div>
							<div class="row" style="height: 50px">
								<div class="col-4"></div>
								<div class="col-5">
									<input class="form-control" type="submit" name="edit-password" value="Confirm" />
								</div>
								<div class="col"></div>
							</div>
						</form>
					</div>
					
					<div class="w-100"></div>
					<div class="col card-team__body text-center">
						<hr>
						<h3>
							<a href="#">Symptom report</a><hr width="200px">
						</h3>
						<form id="report" name="patientMedicalForm" action="editDescription" method="post">
							<div class="row" style="height: 270px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right;">
									Allergy
								</div>
								<div class="col-5">
									<textarea class="form-control" name="allergy" style="height: 250px" disabled>${user.description.allergy}</textarea>
								</div>
							</div>
							
							<div class="row" style="height: 270px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right;">
									Background disease
								</div>
								<div class="col-5">
									<textarea class="form-control" name="background" style="height: 250px" disabled>${user.description.background}</textarea>
								</div>
							</div>
							<div class="row" style="height: 270px">
								<div class="col-1"></div>
								<div class="col-3" style="text-align: right;">
									Current symptoms/well-being
								</div>
								<div class="col-5">
									<textarea class="form-control" name="current" style="height: 250px" disabled>${user.description.current}</textarea>
								</div>
							</div>
							<div class="row" style="height: 75px">
								<div class="col-4"></div>
								<div class="col-3">
									<button id="edit-report" class="form-control" type="button">Edit</button>
								</div>
								<div class="col-2">
									<input id="edit-report-confirm" class="form-control" type="submit" name="submit" value="Confirm" />
								</div>
								<div class="col"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div> <!--  End of row -->

	<!--================ End of main page: edit profile, edit symptom report, edit password =================-->

	<!-- start footer Area -->
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
	<!-- End footer Area -->

	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>