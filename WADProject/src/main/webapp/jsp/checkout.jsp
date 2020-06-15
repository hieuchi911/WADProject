<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored = "false" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Shopping</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	<!-- main css -->
	<link rel="stylesheet" href="css/frame.css" type="text/css">
	<link rel="stylesheet" href="css/responsive.css">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="css/content.css" type="text/css">
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
    
    <!-- Item Details header begins -->
    <section class="header-section set-bg" data-setbg="https://i.pinimg.com/originals/b7/31/49/b73149619e0f63405ed036fcede60045.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="header__text">
                        <h2>Checkout</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Item Details header ends -->

    <!-- Checkout Section Begin -->
    <c:set var="total" value="${0}"/>
    <section class="checkout extrapad">
        <div class="container">
            <div class="shopping-cart">
                <h4>Cart Summary</h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
									<c:forEach items="${objects}" var="object">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <img src="${object.url}" alt="${object.name}" style="width:200px">
                                            <h5>${object.name}</h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                            $${object.price}
                                        </td>
                                        <td class="shoping__cart__quantity">
                                            ${object.amount}
                                        </td>
                                        <td class="shoping__cart__total">
                                        	<c:set var="total" value="${total + object.price * object.amount}" />
                                            $${object.price * object.amount}
                                        </td>
                                        <td class="shoping__cart__item__close">
                                        	<form action="remove-item">
                                        		<button name="remove" value="${object.objectid}"><span class="icon_close"></span></button>
                                        	</form>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="shop" class="primary-btn cart-btn cart-btn-right">CONTINUE SHOPPING</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Payment Details</h4>
                <form method="post" action="confirmTransaction">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="checkout__input">
                                <p>Card Number<span>*</span></p>
                                <input class="numbers" type="text" required>
                            </div>
                            <div class="checkout__input">
                                <p>Cart Name<span>*</span></p>
                                <input class="letters" type="text" required>
                            </div>
                            <div class="checkout__input">
                                <p>Expiry Date<span>*</span></p>
                                <input type="date" required>
                            </div>
                            <div class="checkout__input">
                                <p>Code<span>*</span></p>
                                <input class="characters" type="text" required>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="shoping__checkout">
                                <h5>Cart Total</h5>
                                <ul>
                                    <li>Subtotal <span><c:out value = "${total}"/></span></li>
                                    <li>Total <span><c:out value = "${total}"/></span></li>
                                </ul>
                                <button class="primary-btn">CHECKOUT</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
	
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