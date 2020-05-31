<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template in sample_directory</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/custom/css/custom_header.css" type="text/css">
</head>
<body>
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-right">

					<c:if test="${empty sessionScope.customer}">
						<a href="/BookStore/moveToLogin.do" class="login-panel"><i
							class="fa fa-user"></i>Login</a>
					</c:if>
					<c:if test="${not empty sessionScope.customer}">
						<a href="/BookStore/logout.do" class="login-panel"><i
							class="fa fa-user"></i>Logout</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="./index.html"> <img src="img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!--search section start -->
<!--                     <div class="col-lg-7 col-md-7"> -->
<!--                         <div class="advanced-search"> -->
<!--                             <button type="button" class="category-btn">All Categories</button> -->
<!--                             <form action="#" class="input-group"> -->
<!--                                 <input type="text" placeholder="What do you need?"> -->
<!--                                 <button type="button"><i class="ti-search"></i></button> -->
<!--                             </form> -->
<!--                         </div> -->
<!--                     </div> -->
					<!--search section end -->
					<!--search section start -->
					<form class="col-lg-7 col-md-7">
					<div>
						<input class="form-control" id="listSearch" type="text" placeholder="Type something to search list items">
					  <br>
					  <ul class="list-group" id="searchList">
<!-- 					  	검색 결과를 이곳에 채움 -->
					  </ul>
					</div>
					</form>
					<!--search section end -->
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="cart-icon"><a href="#"> <i
									class="icon_bag_alt"></i> <span>${sessionScope.cartListNumber }</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table>
											<tbody>
												<c:forEach var="book" items="${sessionScope.cartList}">
													<tr>
														<td class="si-pic"><img src="img/select-product-1.jpg"
															alt=""></td>
														<td class="si-text">
														
															<div class="product-selected">
																<p>${book.bookPrice} x ${book.bookCnt}</p>
																<h6><a href="/BookStore/productView.do?bookId=${book.bookId}">${book.bookName}</a></h6>
															</div>
														
														</td>
														<td class="si-close"><i class="ti-close"></i></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="select-total">
										<span>total:</span>
										<h5><span>${sessionScope.cartListTotalPrice }</span></h5>
									</div>
									<div class="select-button">
										<a href="#" class="primary-btn view-card">VIEW CARD</a> <a
											href="#" class="primary-btn checkout-btn">CHECK OUT</a>
									</div>
								</div></li>
							<li class="cart-price"><span>${sessionScope.cartListTotalPrice }</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>All departments</span>
						<ul class="depart-hover">
							<li class="active"><a href="#">Women’s Clothing</a></li>
							<li><a href="#">Men’s Clothing</a></li>
							<li><a href="#">Underwear</a></li>
							<li><a href="#">Kid's Clothing</a></li>
							<li><a href="#">Brand Fashion</a></li>
							<li><a href="#">Accessories/Shoes</a></li>
							<li><a href="#">Luxury Brands</a></li>
							<li><a href="#">Brand Outdoor Apparel</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li><a href="./index.html">Home</a></li>
						<li><a href="./shop.html">Shop</a></li>
						<li><a href="#">Collection</a>
							<ul class="dropdown">
								<li><a href="#">Men's</a></li>
								<li><a href="#">Women's</a></li>
								<li><a href="#">Kid's</a></li>
							</ul></li>
						<li><a href="./blog.html">Blog</a></li>
						<li><a href="./contact.html">Contact</a></li>
						<li><a href="#">Pages</a>
							<ul class="dropdown">
								<li><a href="./blog-details.html">Blog Details</a></li>
								<li><a href="./shopping-cart.html">Shopping Cart</a></li>
								<li><a href="./check-out.html">Checkout</a></li>
								<li><a href="./faq.html">Faq</a></li>
								<li><a href="./register.html">Register</a></li>
								<li><a href="./login.html">Login</a></li>
							</ul></li>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.zoom.min.js"></script>
	<script src="resources/js/jquery.dd.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/custom/js/custom_header.js"></script>
</body>
</html>