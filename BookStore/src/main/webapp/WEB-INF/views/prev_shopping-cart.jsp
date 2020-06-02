<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

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
<!--     <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/themify-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->
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
					<div class="breadcrumb-text product-more">
						<a href="./home.html"><i class="fa fa-home"></i> Home</a> <a
							href="./shop.html">Shop</a> <span>Shopping Cart</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<form id="shoppingCart" action="">
							<table>
								<thead>
									<tr>
										<th>Image</th>
										<th class="p-name">Product Name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
										<th><i class="ti-close"></i></th>
									</tr>
								</thead>

								<tbody id="shoppingCartTbody">

									<c:forEach items="${cartList }" var="cartList">
										<tr id="${cartList.bookId }">
											<td class="cart-pic first-row"><img
												src="resources/img/cart-page/product-${cartList.bookId}.jpg"
												alt=""></td>
											<td class="cart-title first-row">
												<h5>${cartList.bookName}</h5>
											</td>
											<td class="p-price first-row">${cartList.bookSaleprice}</td>
											<td class="qua-col first-row">
												<div class="quantity">
													<div class="pro-qty">
														<input type="text" name="buycartlistCnt" value="${cartList.buycartlistCnt}">
													</div>
<!-- 													bookId를 보낼..? -->
													<input type="hidden" name="bookId" value="${cartList.bookId } ">
												</div>
											</td>
											<td class="total-price first-row">${cartList.bookTotalPrice}</td>
											<td class="close-td first-row"><i class="ti-close"></i></td>
										</tr>
									</c:forEach>


								</tbody>

							</table>
						</form>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="cart-buttons">
								<a href="#" class="primary-btn continue-shop">Continue shopping</a>
<!-- 									 <a href="updateCartList.do" class="primary-btn up-cart">Update cart</a> -->
										<a id="updateCartTag" href="#" class="primary-btn up-cart">Update cart</a>
							</div>
							<div class="discount-coupon">
								<h6>Discount Codes</h6>
								<form action="#" class="coupon-form">
									<input type="text" placeholder="Enter your codes">
									<button type="submit" class="site-btn coupon-btn">Apply</button>
								</form>
							</div>
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="subtotal" id="subTotal">Subtotal <span>${cartListTotalPrice}</span></li>
									<li class="cart-total" id="cartTotal">Total <span>${cartListTotalPrice}</span></li>
								</ul>
								<a href="#" class="proceed-btn">PROCEED TO CHECK OUT</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<!-- Partner Logo Section Begin -->
	<div class="partner-logo">
		<div class="container">
			<div class="logo-carousel owl-carousel">
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="resources/img/logo-carousel/logo-1.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="resources/img/logo-carousel/logo-2.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="resources/img/logo-carousel/logo-3.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="resources/img/logo-carousel/logo-4.png" alt="">
					</div>
				</div>
				<div class="logo-item">
					<div class="tablecell-inner">
						<img src="resources/img/logo-carousel/logo-5.png" alt="">
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
	<!--     <script src="resources/js/jquery-3.3.1.min.js"></script> -->
	<!--     <script src="resources/js/bootstrap.min.js"></script> -->
	<!--     <script src="resources/js/jquery-ui.min.js"></script> -->
	<!--     <script src="resources/js/jquery.countdown.min.js"></script> -->
	<!--     <script src="resources/js/jquery.nice-select.min.js"></script> -->
	<!--     <script src="resources/js/jquery.zoom.min.js"></script> -->
	<!--     <script src="resources/js/jquery.dd.min.js"></script> -->
	<!--     <script src="resources/js/jquery.slicknav.js"></script> -->
	<!--     <script src="resources/js/owl.carousel.min.js"></script> -->
	<!--     <script src="resources/js/main.js"></script> -->
	<script src="resources/custom/js/custom_shoppingCart.js"></script>
</body>

</html>