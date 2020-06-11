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
<link rel="stylesheet" href="resources/custom/css/main.css" type="text/css">
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
                  <a href="/BookStore/main.do"><i class="fa fa-home"></i> 홈</a> <span>도서보기</span>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Breadcrumb Section Begin -->

   <!-- Product Shop Section Begin -->
   <section class="product-shop spad">
      <div class="container">
            <div class="col-lg-12">
            <div class="col-lg-9 order-1 order-lg-2 offset-lg-1">
               <div class="product-list2">
                  <div class="row">
                     <!-- test부분 시작 -->
                     <c:forEach var="book" items="${searchList}">
                        <div class="col-lg-4 col-sm-6">
                           <div class="product-item">
                              <div class="pi-pic">
                                 <img src="resources/custom/img/banner/${book.bookId }.jpg" alt="">
                                 <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                 </div>
                                 <ul>
                                    <li class="w-icon active"><a href="#"><i
                                          class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                    <li class="w-icon"><a href="#"><i
                                          class="fa fa-random"></i></a></li>
                                 </ul>
                              </div>
                              <div class="pi-text">
                                 <div class="catagory-name">${book.bookGenre }</div>
                                    <a href="/BookStore/productView.do?bookId=${book.bookId}"><h5>${book.bookName }</h5></a>
                                 <div class="product-price">
                                    ${book.bookSaleprice}
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <!-- test부분 끝 -->
                  </div>
               </div>
               <div class="loading-more">
                  <i class="icon_loading"></i> <a href="#"> Loading More </a>
               </div>
            </div>
               </div>
      </div>
   </section>
   <!-- Product Shop Section End -->



   <!-- Footer Section Begin -->
   <jsp:include page="/footer.do"></jsp:include>
   <!-- Footer Section End -->

   <!-- Js Plugins -->
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
</body>

</html>