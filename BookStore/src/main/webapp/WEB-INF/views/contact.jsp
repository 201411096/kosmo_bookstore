<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<jsp:include page="/header.do"></jsp:include>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="#"><i class="fa fa-home"></i> Home</a> <span>Contact</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Map Section Begin -->
	<div class="map spad">
		<div class="container">
			<div class="map-inner">
				<iframe
					src="contact_map.do"
					height="650" style="border: 0" allowfullscreen=""> </iframe>
			</div>
		</div>
	</div>
	<!-- Map Section Begin -->

	<!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<div class="contact-title">
						<h4>Contacts Us</h4>
						<p>Contrary to popular belief, Lorem Ipsum is simply random
							text. It has roots in a piece of classical Latin literature from
							45 BC, maki years old.</p>
					</div>
					<div class="contact-widget">
						<div class="cw-item">
							<div class="ci-icon">
								<i class="ti-location-pin"></i>
							</div>
							<div class="ci-text">
								<span>Address:</span>
								<p>60-49 Road 11378 New York</p>
							</div>
						</div>
						<div class="cw-item">
							<div class="ci-icon">
								<i class="ti-mobile"></i>
							</div>
							<div class="ci-text">
								<span>Phone:</span>
								<p>+65 11.188.888</p>
							</div>
						</div>
						<div class="cw-item">
							<div class="ci-icon">
								<i class="ti-email"></i>
							</div>
							<div class="ci-text">
								<span>Email:</span>
								<p>hellocolorlib@gmail.com</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 offset-lg-1">
					<div class="contact-form">
						<div class="leave-comment">
							<h4>Leave A Comment</h4>
							<p>Our staff will call back later and answer your questions.</p>
							<form action="#" class="comment-form">
								<div class="row">
									<div class="col-lg-6">
										<input type="text" placeholder="Your name">
									</div>
									<div class="col-lg-6">
										<input type="text" placeholder="Your email">
									</div>
									<div class="col-lg-12">
										<textarea placeholder="Your message"></textarea>
										<button type="submit" class="site-btn">Send message</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->

	<!-- Partner Logo Section Begin -->
	<div class="partner-logo">
		<div class="container">
			<div class="logo-carousel owl-carousel">
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="img/logo-carousel/logo-1.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="img/logo-carousel/logo-2.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="img/logo-carousel/logo-3.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="img/logo-carousel/logo-4.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="img/logo-carousel/logo-5.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Partner Logo Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/jquery.dd.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>