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
<title>Fashi | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- <link rel="stylesheet" href="resources/css/bootstrap.min.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/font-awesome.min.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/themify-icons.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/elegant-icons.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/owl.carousel.min.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/nice-select.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/jquery-ui.min.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/slicknav.min.css" -->
<!-- 	type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
		<jsp:include page="/header.do"></jsp:include>
	<!-- Header End -->
	<input type="hidden" name="art" value="${tendency.art}">
	<input type="hidden" name="social" value="${tendency.social}">
	<input type="hidden" name="economic" value="${tendency.economic}">
	<input type="hidden" name="technology" value="${tendency.technology}">
	<input type="hidden" name="literature" value="${tendency.literature}">
	<input type="hidden" name="history" value="${tendency.history}">
	<hr>
	<input type="text" name="art" value="${tendency.art}">
	<input type="text" name="social" value="${tendency.social}">
	<input type="text" name="economic" value="${tendency.economic}">
	<input type="text" name="technology" value="${tendency.technology}">
	<input type="text" name="literature" value="${tendency.literature}">
	<input type="text" name="history" value="${tendency.history}">
	<br><br><br><br><br><br><br><br><br><br><br>
	customerId :  ${sessionScope.customer.customerId }
	<br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- Footer Section Begin -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
<!-- 	<script src="resources/js/jquery-3.3.1.min.js"></script> -->
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
<!-- 	<script src="resources/js/jquery-ui.min.js"></script> -->
<!-- 	<script src="resources/js/jquery.countdown.min.js"></script> -->
<!-- 	<script src="resources/js/jquery.nice-select.min.js"></script> -->
<!-- 	<script src="resources/js/jquery.zoom.min.js"></script> -->
<!-- 	<script src="resources/js/jquery.dd.min.js"></script> -->
<!-- 	<script src="resources/js/jquery.slicknav.js"></script> -->
<!-- 	<script src="resources/js/owl.carousel.min.js"></script> -->
<!-- 	<script src="resources/js/main.js"></script> -->
<script src=""></script>
</body>

</html>