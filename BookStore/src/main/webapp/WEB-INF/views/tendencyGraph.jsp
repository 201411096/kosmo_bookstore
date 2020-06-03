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
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
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
	<input type="hidden" id="customerId" name="customerId" value="${sessionScope.customer.customerId }">
	<input type="hidden" id="customerArt" name="customerArt" value="${tendency.art}">
	<input type="hidden" id="customerSocial" name="customerSocial" value="${tendency.social}">
	<input type="hidden" id="customerEconomic" name="customerEconomic" value="${tendency.economic}">
	<input type="hidden" id="customerTechnology" name="customerTechnology" value="${tendency.technology}">
	<input type="hidden" id="customerLiterature" name="customerLiterature" value="${tendency.literature}">
	<input type="hidden" id="customerHistory" name="customerHistory" value="${tendency.history}">
	<hr>
	<input type="hidden" id="totalId" name="totalId" value="${sessionScope.totalTendency.customerId }">
	<input type="hidden" id="totalArt" name="totalArt" value="${totalTendency.art}">
	<input type="hidden" id="totalSocial" name="totalSocial" value="${totalTendency.social}">
	<input type="hidden" id="totalEconomic" name="totalEconomic" value="${totalTendency.economic}">
	<input type="hidden" id="totalTechnology" name="totalTechnology" value="${totalTendency.technology}">
	<input type="hidden" id="totalLiterature" name="totalLiterature" value="${totalTendency.literature}">
	<input type="hidden" id="totalHistory" name="totalHistory" value="${totalTendency.history}">
	<hr>
	<br><br><br><br><br><br><br><br><br><br><br>
	customerId :  ${sessionScope.customer.customerId }
	<canvas id="myChart" width="400" height="400"></canvas>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/custom/js/custom_tendencyGraph.js"></script>
</body>

</html>