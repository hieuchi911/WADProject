<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Shopping</title>

    <link rel="icon" href="img/favicon.png" type="image/png">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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

    
    <!-- Item Details header begins -->
    <section class="header-section set-bg" data-setbg="https://i.pinimg.com/originals/b7/31/49/b73149619e0f63405ed036fcede60045.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="header__text">
                        <h2>Item Details</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Item Details header ends -->
    
	<!-- Products details body begins -->
    <section class="product-details extrapad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${object.url}" alt="${object.name}">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                    	<form:form modelAttribute="cartobject" action="addItem2Cart" method="post">
                        	<h3>${object.name}</h3>
                        	<form:hidden path="objectid" value="${object.id}"/>

	                        <div class="product__details__price">${object.price}</div>
	                        <p>${object.description}</p>
	                        <div class="product__details__quantity">
	                            <div class="quantity">
	                                <div class="pro-qty">
	                                    <form:input path="amount" value="1"/>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <button class="primary-btn">ADD TO CARD</button>
	                        
	                        <ul>
								<li><b>Made in</b> <span>${object.manufacturer}</span></li>                            
								<li><b>Availability</b> <span>In Stock</span></li>
	                            <li><b>Shipping</b> <span>01 day shipping.</span></li>
	                            <li><b>Share on</b>
	                                <div class="share">
	                                    <a href="#"><i class="fa fa-facebook"></i></a>
	                                    <a href="#"><i class="fa fa-twitter"></i></a>
	                                    <a href="#"><i class="fa fa-instagram"></i></a>
	                                    <a href="#"><i class="fa fa-pinterest"></i></a>
	                                </div>
	                            </li>
	                            <li><a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a></li>
	                        </ul>
                        </form:form>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Product Description</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Usage</h6>
                                    <p>${object.usage}.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Products details body ends -->
    
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
    <!-- Js Plugins -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>