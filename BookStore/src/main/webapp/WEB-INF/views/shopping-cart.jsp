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
						<a href="/BookStore/main.do"><i class="fa fa-home"></i> 홈</a> <a
							href="/BookStore/productList.do?searchWord=">도서보기</a> 	<a
							 href="/BookStore/productView.do?bookId=${prevProduct.bookId}">상세페이지</a>				
							<span>장바구니</span>
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
						<form id="shoppingCart" action="" method="post">
							<table>
								<thead>
									<tr>
										<th>이미지</th>
										<th class="p-name">상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>합계</th>
										<th><i class="ti-close"></i></th>
									</tr>
								</thead>

								<tbody id="shoppingCartTbody">

									<c:forEach items="${cartList }" var="cartList">
										<tr id="${cartList.bookId }">
											<td class="cart-pic first-row"><img
												src="resources/custom/img/banner/${cartList.bookId}.jpg"
												
												alt=""></td>
											<td class="cart-title first-row">
												<h5>${cartList.bookName}</h5>
											</td>
											<td class="p-price first-row">${cartList.bookSaleprice}</td>
											<td class="qua-col first-row">
												<div class="quantity">
													<div class="pro-qty">
														<input type="text" name="${cartList.bookId}_buycartlistCnt" value="${cartList.buycartlistCnt}">
													</div>
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
								<a href="/BookStore/productList.do?searchWord=" class="primary-btn continue-shop">다른 도서 보러가기</a>
								<a id="updateCartTag" href="#" class="primary-btn up-cart">장바구니 최신화</a>
							</div>							
						</div>
						<div class="col-lg-4 offset-lg-4">
							<div class="proceed-checkout">
								<ul>
									<li class="cart-total" id="cartTotal">총 금액 <span>${cartListTotalPrice}</span></li>
								</ul>
<!-- 								<a href="/BookStore/sendList.do" class="proceed-btn">PROCEED TO CHECK OUT</a> -->
									<a id="proceedBtn" href="#" class="proceed-btn">결제</a>
									<input type="hidden" value="${prevProduct.bookId}" name="bookId">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

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