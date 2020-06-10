<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="resources/custom/img/hero/hero-new2.png">
                <div class="container">
                    <div class="row">
                    
                        <div class="col-lg-5">
                            <span>여름신간</span>
                            <h2 id=mainTitle>여름에 쓰여진 책</h2>
                            <p>당신의 시원한 여름밤을 위한 추천도서</p>
                            <a href="/BookStore/productList.do?searchWord=" class="primary-btn">도서보기</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>인기 <span>절정</span></h2>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="resources/custom/img/hero/hero-new7.png">
                <div class="container">
                    <div class="col-lg-12">
                    <div class="row">
                    <div class="col-lg-7">
                            <span> </span>
                             </div>
                        <div class="col-lg-5">
                            <span>하루순삭~</span>
                            <h1 id=mainTitle2>히히히 책 재밋당</h1>
                            <p>코로나인데 집이 쵝5G~</p>
                            
                        </div>
                    
               
                </div>
                </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
    <div class="banner-section spad">
        &nbsp;&nbsp;&nbsp;<h2 id="bannerTitle"><a href="#">신간도서</a></h2>
        <div class="container-fluidBorder">
        <div class="container-fluid">
            <div class="row">
            <c:forEach items="${bannerBookList}" var="bannerBookList">
                <div class="col-lg-2">
                   <div class="single-banner">
                    <figure class="snip1384">
                  <img
                     src="resources/custom/img/banner/${bannerBookList.bookId }.jpg"
                     alt="sample83" />
                  <figcaption>
                     <h3 id="bannerBookTitle">${bannerBookList.bookName }</h3>
                     <p>${bannerBookList.bookStory }</p>
                     <i class="ion-ios-arrow-right"></i>
                  </figcaption>
                  <a href="/BookStore/productView.do?bookId=${bannerBookList.bookId }"></a>
               </figure>
                  </div>
                    
                </div>
            </c:forEach>
            
        </div>
    </div>
    </div>
    </section>
    <!-- Banner Section End -->

    <!-- bestSeller Section Begin -->
    <section class="bestSeller spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 offset-lg-1">
                    <div class="product-large set-bg" data-setbg="resources/img/products/women-large.jpg">
                        <h2>베스트 셀러</h2>
                        <a href="/BookStore/bestSellerProductList.do">더 보기</a>
                    </div>
                </div>
                <div class="col-lg-7 offset-lg-1">                   
                    <div class="product-slider owl-carousel">
                           <c:forEach items="${bestSellerList}" var="bestSellerList">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="resources/custom/img/banner/${bestSellerList.bookId }.jpg" alt="">
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                <ul>
                                    <li class="w-icon active"><a href="/BookStore/productView.do?bookId=${bestSellerList.bookId }"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/BookStore/productView.do?bookId=${bestSellerList.bookId }">+ Quick View</a></li>
                                    <li class="w-icon"><a href="/BookStore/productView.do?bookId=${bestSellerList.bookId }"><i class="fa fa-random"></i></a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${bestSellerList.bookGenre }</div>
                                <a href="/BookStore/productView.do?bookId=${bestSellerList.bookId }">
                                    <h5>${bestSellerList.bookName }</h5>
                                    <h6 id="bestSellerWriter">/ ${bestSellerList.writerName } /</h6>
                                </a>
                                <div class="product-price">
                                    ${bestSellerList.bookSaleprice }                              
                                </div>
                            </div>
                        </div>
                           </c:forEach>
                           
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- bestSeller Section End -->

    

    

    

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="benefit-items">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="resources/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>무료 배송</h6>
                                <p>결제 금액 20000원 이상</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="resources/img/icon-2.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>새벽 배송</h6>
                                <p>다음날 배송 완료!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="resources/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>보안 결제</h6>
                                <p>100% 안전한 결제</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->


    <!-- Footer Section Begin -->
    <jsp:include page="/footer.do"></jsp:include>
    <!-- Footer Section End -->

 
</body>

</html>