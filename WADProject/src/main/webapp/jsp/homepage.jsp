<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<link rel="stylesheet" href="css/responsive.css">
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
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
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
		
	<!--================Home Banner Area =================-->

	<section class="banner-area d-flex align-items-center" style="height: 500px">
		<div class="container">
			<div class="row">
                <div class="col-md-8 col-lg-6 col-xl-5">
                </div>
            </div>
		</div>
	</section>

	<!--================End Home Banner Area =================-->

		
	<div class="container-fluid">
		<div class="row">
			<!--  First column as Left bar -->
			<div class="col-3" style="padding: 25px;">
				
				<c:if test="${user.usertype == 'patient' }">
					<table align="center">
						<tr>
							<td><a href="showDoctors">Doctors</a></td>
						</tr>
		
						<tr>
							<td><a href="patient-accepted-requests">Appointments</a></td>
						</tr>

					</table>
				</c:if>
				
				<c:if test="${user.usertype == 'doctor' }">
					<table align="center">
						<tr>
							<td><a href="patientRecords">Patients</a></td>
						</tr>
	
						<tr>
							<td><a href="accepted-requests">Appointments</a></td>
						</tr>
	
						<tr>
							<td><a href="appointments">Requests</a></td>
						</tr>
					</table>
				</c:if>
			</div>
			<!--  Second column as main content-->
			<div class="col">
	            <div class="row align-items-center" style="margin: 25px;">
	                <div class="col">
	                    <div class="about-content">
	                        <h4>About this website</h4><hr align="left" width="200px">
	                        <h6>An online platform that offers distant examinations</h6><br>
	                        <p>Using this platform, patients can do online shopping for medicines or medical tools.
	                        It amalgamates online shopping fuction of Lazada with appointment scheduling function of Grab,
	                        which brings new experience to patients and doctors. <a href="#">Learn more</a></p>
	                    </div>
	                </div>
	            </div>
	            
                <div class="row" style="margin: 25px;">
                	<div class="col">
                	<h4>Main functions</h4><hr align="left" width="200px">
                	</div>
                	
                	<div class="w-100"></div>
                	
                    <div class="col-md">
                        <div class="card card-feature text-center text-lg-left">

                            <h3 class="card-feature__title"><span class="card-feature__icon">
                                <i class="ti-heart-broken"></i>
                            </span>Online Shopping</h3>
                            <p class="card-feature__subtitle">Buy medicines yourself or based on prescription</p>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="card card-feature text-center text-lg-left">

                            <h3 class="card-feature__title"><span class="card-feature__icon">
                                <i class="ti-headphone-alt"></i>
                            </span>Online Appointment</h3>
                            <p class="card-feature__subtitle">Meet your doctor online</p>
                        </div>
                    </div>
                </div>
		    </div>
		</div>
	</div>
		
		<section class="brands-area background_one">
        
    	</section>
		
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