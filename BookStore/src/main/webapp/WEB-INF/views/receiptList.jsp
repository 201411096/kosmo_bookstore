<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>receiptList</title>

<!--     Google Font -->
<!--     <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet"> -->

<!--     Css Styles -->
<!--     <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/themify-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/elegant-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/nice-select.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/slicknav.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/style.css" type="text/css"> -->
<link rel="stylesheet" href="resources/custom/css/custom_receiptList.css" type="text/css">
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
                        <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>Shopping Cart</span>
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
                        <table>
                            <thead>
                                <tr>
                                    <th>구매번호</th>
                                    <th>구매물품</th>
                                    <th>구매날짜</th>
                                    <th>가격총합</th>
                                    <th><i class="ti-close"></i></th>
                                </tr>
                            </thead>
                            <tbody id="receiptListTbody">
                            </tbody>
                        </table>
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
<!--     <script src="js/jquery-3.3.1.min.js"></script> -->
<!--     <script src="js/bootstrap.min.js"></script> -->
<!--     <script src="js/jquery-ui.min.js"></script> -->
<!--     <script src="js/jquery.countdown.min.js"></script> -->
<!--     <script src="js/jquery.nice-select.min.js"></script> -->
<!--     <script src="js/jquery.zoom.min.js"></script> -->
<!--     <script src="js/jquery.dd.min.js"></script> -->
<!--     <script src="js/jquery.slicknav.js"></script> -->
<!--     <script src="js/owl.carousel.min.js"></script> -->
<!--     <script src="js/main.js"></script> -->
	<script src="resources/custom/js/custom_receiptList.js"></script>
</body>

</html>