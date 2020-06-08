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
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/font-awesome.min.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/themify-icons.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/elegant-icons.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/owl.carousel.min.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/nice-select.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/jquery-ui.min.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/slicknav.min.css" -->
<!--    type="text/css"> -->
<!-- <link rel="stylesheet" href="resources/css/style.css" type="text/css"> -->
   <link rel="stylesheet" href="resources/custom/css/main.css" type="text/css">
   <link rel="stylesheet" href="resources/custom/css/custom_tendencyGraph.css">
</head>
<body>
<%-- <% --%>
<!-- // 	if(request.getParameter("customer")==null) -->
<!-- // 		response.sendRedirect("moveToLogin.do"); -->
<%-- %> --%>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>

   <!-- Header Section Begin -->
      <jsp:include page="/header.do"></jsp:include>
   <!-- Header End -->
   <hr>
   
   <div class="col-lg-11">
      <div class="row">
         <!-- 차트  -->
         <div class="col-lg-5">
            <!--    차트 부분 시작 -->
            <div id="myChartContainer">
               <canvas id="myChart" width="600" height="600"></canvas>
            </div>
            <div>
                
            </div>
            <!--    차트 부분 끝 -->
         </div>
         
         <div class="col-lg-3">
         <div id='recommendMaxTitle'></div>
            <div class="product-item">
               <div id="recommendMaxBookContent"></div>
         </div>
         </div>
         
         <div class="col-lg-3">
         <div id='recommendMinTitle'></div>
            <div class="product-item">
                   <div id="recommendMinBookContent"></div>         
               </div>
         </div>
         
         





      </div>
   </div>

   <!-- Footer Section Begin -->
   <jsp:include page="/footer.do"></jsp:include>
   <!-- Footer Section End -->

   <!-- Js Plugins -->
<!--    <script src="resources/js/jquery-3.3.1.min.js"></script> -->
<!--    <script src="resources/js/bootstrap.min.js"></script> -->
<!--    <script src="resources/js/jquery-ui.min.js"></script> -->
<!--    <script src="resources/js/jquery.countdown.min.js"></script> -->
<!--    <script src="resources/js/jquery.nice-select.min.js"></script> -->
<!--    <script src="resources/js/jquery.zoom.min.js"></script> -->
<!--    <script src="resources/js/jquery.dd.min.js"></script> -->
<!--    <script src="resources/js/jquery.slicknav.js"></script> -->
<!--    <script src="resources/js/owl.carousel.min.js"></script> -->
<!--    <script src="resources/js/main.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="resources/custom/js/custom_ajax_tendencyGraph.js"></script>
<!-- <script src="resources/custom/js/custom_ajax_observe_tendencyGraph.js"></script> -->
</body>

</html>