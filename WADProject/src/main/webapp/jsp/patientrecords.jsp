<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*, java.util.*"%>
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

<link rel="stylesheet" href="css/style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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

    <!-- Products body begins -->
    <section class="auser extrapad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                            <div class="searchbar">
                                <form method="get" action="searchitem">
                                    <input type="text" placeholder="Search.." name="query" size="20">
                                    <button type="submit">Submit</button>
                                </form>
                            </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="row">
                        <c:forEach items="${doctors.objects}" var="doctor" varStatus="tagStatus">
                                <div class="auser-card container">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <img
                                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGjTgg70t-gQ0i66piGNEeoHVYff0uopb-3cXeDUH6GoMgpq7x&usqp=CAU"
                                                width="50%">
                                        </div>
                                        <div class="col-lg-10"><br>
                                            <h3>${prescription.patient}</h3>
                                            <hr>

                                            <table>
                                                <tr>
                                                    <td>Diagnosis</td>
                                                    <td>${prescription.diagnosis}</td>
                                                </tr>
                                                <tr>
                                                    <td>Next appointment</td>
                                                    <td>${prescription.from_to}</td>
                                                </tr>
                                            </table>
                                            <br>
                                            <!-- <form method="get" action="">  -->
                                                <p><button>Prescription Details</button></p>
                                            <!-- </form>  -->
                                        </div>
                                    </div>
                                <hr>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Products body ends -->

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