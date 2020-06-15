<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/styles.css">
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

    <!-- Medical Shop header begins -->
    <section class="header-section set-bg" data-setbg="https://i.pinimg.com/originals/b7/31/49/b73149619e0f63405ed036fcede60045.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="header__text">
                        <h2>Medical Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Medical Shop header ends -->
    
    <!-- Products body begins -->
    <section class="product extrapad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                            <div class="searchbar">
                            	<form method="get" action="searchitem">
	                                <input class="ln" type="text" placeholder="Search.." name="query" size="22">
	                                <button type="submit">Submit</button>
                                </form>
                            </div>
                            <div class="sidebar__item">
                            <h4>Category</h4>
                            <ul>
                                <li><a href="#">Medical Tools</a></li>
                                <li><a href="#">Medicine</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="row">
                    	<c:forEach items="${objects.objects}" var="object" varStatus="tagStatus">
							<div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${object.url}">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="shopitem-${object.id}">${object.name}</a></h6>
	                                    <h5>${object.price}</h5>
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                    <div class="row">
	                    <div class="col-lg-12">
	                        <div class="shoping__cart__btns">
	                            <a href="shopCheckout" class="primary-btn cart-btn cart-btn-right">GO TO CART</a>
	                        </div>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Products body ends -->
    
    <hr>
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