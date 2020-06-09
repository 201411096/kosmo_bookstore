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
               <!-- -------------------- search section start 검색 부분 시작 -------------------- -->
               <form class="col-lg-7 col-md-7" action="/BookStore/productList.do">
               <div>
                  <input class="form-control" name="searchWord" id="listSearch" type="text" placeholder="검색어를 입력하세요">
                 <br>
                 <ul class="list-group" id="searchList">
                  <!--검색 결과를 이곳에 채움 -->
                 </ul>
               </div>
               </form>
               <!-- -------------------- search section end 검색 부분 끝 -------------------- -->
               <div class="col-lg-3 text-right col-md-3">
                  <ul class="nav-right">
                     <li class="cart-icon"><a href="#"> <i class="icon_bag_alt"></i>
                      <span class="cartListNumber">${sessionScope.cartListNumber }</span>
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
                                                <p class="cartListPriceAndCnt">${book.bookSaleprice} x ${book.buycartlistCnt}</p>
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
                              <h5><span class="cartListTotalPrice">${sessionScope.cartListTotalPrice }</span></h5>
                           </div>
                           <div class="select-button">
                              <a href="moveToCartList.do" class="primary-btn view-card">VIEW CART</a>
                              <a href="buyList.do" class="primary-btn checkout-btn">CHECK OUT</a>
                              <br>
<!--                               <a href="/BookStore/ajax_tendencyGraph.do" class="primary-btn view-card">TENDENCY GRAPH</a> -->
<!--                               <a href="/BookStore/receiptList.do" class="primary-btn checkout-btn">RECEIPT</a> -->
								<a href="/BookStore/receiptList.do" class="primary-btn view-card">RECEIPT</a>
                                 
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
                  <i class="ti-menu"></i> <span>책 장르</span>
                  <ul class="depart-hover">
                     <li><a href="/BookStore/productList.do?searchWord=ART">Art 미술</a></li>
                     <li><a href="/BookStore/productList.do?searchWord=ECONOMIC">Economic 경제</a></li>
                     <li><a href="/BookStore/productList.do?searchWord=HISTORY">History 역사</a></li>
                     <li><a href="/BookStore/productList.do?searchWord=LITERATURE">Literature 문학</a></li>
                     <li><a href="/BookStore/productList.do?searchWord=SOCIAL">Social 사회</a></li>
                     <li><a href="/BookStore/productList.do?searchWord=TECHNOLOGY">Tech 기술</a></li>
                  </ul>
               </div>
            </div>
            <nav class="nav-menu mobile-menu">
               <ul>
                  <li><a href="/BookStore/main.do">홈</a></li>
                  <li><a href="/BookStore/productList.do?searchWord=">도서보기</a></li>
                  <li><a href="/BookStore/ajax_tendencyGraph.do">My Reading Rhythm</a>
                  <li><a href="/BookStore/contact.do">오시는 길</a></li>
                  <li><a href="#">페이지</a>
                     <ul class="dropdown">
                        <li><a href="/BookStore/shopping-cart.do">장바구니</a></li>
                        <li><a href="/BookStore/moveToRegister.do">회원가입</a></li>
                        <li><a href="/BookStore/moveToLogin.do">로그인</a></li>
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