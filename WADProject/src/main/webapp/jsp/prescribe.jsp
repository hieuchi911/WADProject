<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


    <!-- Products body begins -->
    <section class="product extrapad">
        <div class="container">
            <div class="row">
            	<div class="col-lg-3 col-md-5">
	            	<div class="searchbar">
                        <form method="get" action="searchitem">
                        	<input class="characters" type="text" placeholder="Search.." name="query" size="22">
                        	<button type="submit">Search</button>
                        </form>
	            	</div>
                    <div class="sidebar__item">
                        <h4>Shortcut</h4>
                        <ul>
                            <li><c:if test="${prescription.prescription.objects.size() > 0}">
                            		<a href="#checkout">Prescription</a>
                            	</c:if>
                            </li>
                        </ul>
                    </div>
            	</div>
                <div class="col-lg-9 col-md-7">
                    <div class="row">
                    	<c:forEach items="${objects.objects}" var="object" varStatus="tagStatus">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" data-setbg="${object.url}">
	                                	<div class="presmed-info-input">

		                				</div>
	                                </div>
	                                <div class="product__item__text">
	                               	    <form action="add-medicine-${object.id}" method="post">
			                				<input class="numbers" type="text" class="form-control" placeholder="Amount.." name="amount" size="40">
			                				<input class="ln" type="text" class="form-control" placeholder="Dosage.." name="dosage" size="40">
			                				<input type="submit" class="form-control" name="submit" value="Add"/>
			                			</form>
	                                    <h6><a href="#">${object.name}</a></h6>
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Products body ends -->

	<!-- Prescription body begins -->
	<c:if test="${prescription.prescription.objects.size() > 0}">
	    <section id="prescription" class="prescription extrapad">
	
	        <div class="container">
	            <div class="prescription__details__tab">
	                <div>
		                <ul class="nav nav-tabs" role="tablist">
		                    <li class="nav-item">
		                        <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
		                            aria-selected="true">Prescription</a>
		                    </li>
		                </ul>
	                <div>
	                <div class="prescription-cart">
	                    <div class="row">
	                        <div class="col-lg-4">
	                            <div class="prescription__cart__table">
		                            <form action="confirm-prescription" method="get">
		                                <table>
		                                    <thead>
		                                        <tr>
		                                            <th style="text-align: left;">Dianosis</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                        <tr>
		                                            <td><textarea class="form-control" id="diagnosis" name="diagnosis" rows="3" cols="48">It was a dark and stormy night...
		                                            </textarea>
		                                            </td>         
		                                        </tr>
		                                    </tbody>
		                                </table>
		                                <br>
		                                <table>
		                                    <thead>
		                                        <tr>
		                                            <th style="text-align: left; width: 60%;">Until</th>
		                                            <td><input type="text" class="form-control" placeholder="date..." name="from-to"></td>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    </tbody>
		                                </table>
		                                <h6> </h6>
		                                <button class="form-control">Confirm</button>
		                            </form>
	                            </div>
	                        </div>
	                        <div class="col-lg-8">
	                            <div class="prescription__cart__table">
	                                <table>
	                                    <thead>
	                                        <tr>
	                                            <th class="prescription__product">Medicine</th>
	                                            <th class="prescription__product">Quantity</th>
	                                            <th class="prescription__product">Dosage</th>
	                                            <th></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<c:forEach items="${prescription.prescription.objects}" var="object" varStatus="tagStatus">
												<tr>
		                                            <td class="prescription__cart__item">
		                                                <h5>${object.name}</h5>
		                                            </td>
		                                            <td class="prescription__cart__item">
		                                                ${object.amount}
		                                            </td>
		                                            <td class="prescription__cart__item">
		                                                ${object.dosage}
		                                            </td>
		                                            <td class="prescription__cart__item__close">
		                                                <form action="removemed-${object.id}" method="get">
															<button name="Remove"><span class="icon_close"></span></button>
														</form>
		                                            </td>
	                                        	</tr>
											</c:forEach>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
    </c:if>
	<!-- Prescription body ends -->

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