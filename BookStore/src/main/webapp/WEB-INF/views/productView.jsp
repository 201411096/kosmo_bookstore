<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<!-- 장바구니도 되고 리뷰도 작성이 되는데 작성 후에 망가짐  -->
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
<!--     <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/themify-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/elegant-icons.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/nice-select.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/slicknav.min.css" type="text/css"> -->
<!--     <link rel="stylesheet" href="css/style.css" type="text/css"> -->
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
                        <span>Detail</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
    
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="resources/custom/img/banner/${info.bookId }.jpg" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>                            
                             <div class="filter-widget">
                                <h4 class="fw-title">Tags</h4>
                              <div class="fw-tags">
                                  <a href="/BookStore/productList.do?searchWord=${info.writerName }">${info.writerName }</a>
                                  <a href="/BookStore/productList.do?searchWord=${info.bookGenre }">${info.bookGenre }</a>                              
                                 </div>
                             </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="product-details">
                                <div class="pd-title">
                                    <h3>${info.bookName }</h3><hr/>
                                    <h6>${info.writerName } 지음 | ${info.bookPdate } 출간</h6>
                                    <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                                </div>
                                <div class="pd-rating">
<!--                                     <i class="fa fa-star"></i> -->
<!--                                     <i class="fa fa-star"></i> -->
<!--                                     <i class="fa fa-star"></i> -->
<!--                                     <i class="fa fa-star"></i> -->
<!--                                     <i class="fa fa-star-o"></i> -->
                                    <span>평점 : ${info.bookScoreDivideByCount }</span>
                                </div>
                                <div class="pd-desc">
                                     <p>${info.bookStory }</p>
                                    <h4> ${info.bookSaleprice }원 <span>${info.bookPrice }원</span></h4><hr/>
                                </div>                              
                          <form action="/BookStore/addCartList.do">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1" name="buycartlistCnt">
                                    </div>
                                       <button type="submit" class="site-btn login-btn">장바구니</button>
                                        <!-- <a href="addList.do" class="primary-btn pd-cart">장바구니</a> -->
                                        <input name="bookId" type="hidden" value="${info.bookId }" />
                                </div>
                          </form>
                        
                               
                                <ul class="pd-tags">
                                    <li><span>분야</span>: ${info.bookGenre }</li>
                                    <li><span>TAGS</span>: ${info.writerName }, ${info.bookGenre }</li>
                                </ul>
                               
                            </div>
                        </div>
                    </div>
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">Customer Reviews (02)</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">DESCRIPTION</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">SPECIFICATIONS</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                                  
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="customer-review-option">
<!--                                     리뷰출력 -->
                                        <h4 id="">2 Comments</h4>
                                        <div class="comment-option">
                                        <div id="review-container">
                                        <c:forEach items="${review}" var="review" >
                                        <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="resources/img/product-single/avatar-1.png" alt="">
                                                </div>
                                                <div class="avatar-text">
<!--                                                     <div class="at-rating"> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star"></i> -->
<!--                                                         <i class="fa fa-star-o"></i> -->
<!--                                                     </div>                                                  -->
                                                    <h5>${review.customerId} 
                                                    <span>${review.buyreviewScore}</span>
                                                    </h5>
                                                    <div class="at-reply">${review.buyreviewContent}</div>
                                                    <input type="hidden" class="reviewcustomerId" value="${review.customerId} ">
                                                    <input type="hidden" class="buyreviewId" value="${review.buyreviewId} ">
                                                    <input type="button" id="r-modify" class="site-btn" value="수정">
                                                    &nbsp
                                                    <input type="button" id="r-delete" class="site-btn" value="삭제">                                              
                                                </div>
                                            </div>
                                       </c:forEach>
                                       </div>
                                        <div class="leave-comment">
<!--                                         리뷰입력 -->
                                            <h4>Leave A Comment</h4>
                                            
                                            <form id="reviewForm" action="" class="comment-form">
                                               <input type="hidden" id="bookIdInReviewForm" name="bookId" value="${info.bookId}">
                                                <div class="row">                                             
                        
<!--                                                <input type="text" placeholder="buyReviewId시퀀스" name="buyreviewId"> -->
    
                                                    <div class="col-lg-8">
                                                        <input type="text" placeholder="리뷰 점수 입력" id="buyreviewScore" name="buyreviewScore">
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <textarea placeholder="리뷰 내용 입력" id="buyreviewContent" name="buyreviewContent"></textarea>
                                                        <button type="button" id="review-btn" class="site-btn">리뷰 작성</button>
                                                        <button type="button" id="update-btn" class="site-btn">리뷰 수정</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                                        <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                    <div class="specification-table">
                                        <table>
                                            <tr>
                                                <td class="p-catagory">Customer Rating</td>
                                                <td>
                                                    <div class="pd-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <span>(5)</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Price</td>
                                                <td>
                                                    <div class="p-price">$495.00</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Add To Cart</td>
                                                <td>
                                                    <div class="cart-add">+ add to cart</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Availability</td>
                                                <td>
                                                    <div class="p-stock">22 in stock</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Weight</td>
                                                <td>
                                                    <div class="p-weight">1,3kg</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Size</td>
                                                <td>
                                                    <div class="p-size">Xxl</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Color</td>
                                                <td><span class="cs-color"></span></td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Sku</td>
                                                <td>
                                                    <div class="p-code">00012</div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            
                             <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>Introduction</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                                <h5>Features</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="resources/img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                </div><!-- tab div end -->
                
                
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

    <!-- Related Products Section End -->
    <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>관련 작품 추천</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           <c:forEach items="${relatedBookList}" var="relatedBookList">
           
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="resources/custom/img/banner/${relatedBookList.bookId }.jpg" alt="">
                            <ul>
                                <li class="w-icon active"><a href="./productView.do?bookId=${relatedBookList.bookId }"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="./productView.do?bookId=${relatedBookList.bookId }">+ Quick View</a></li>
                                <li class="w-icon"><a href="./productView.do?bookId=${relatedBookList.bookId }"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">${relatedBookList.bookGenre }</div>
                            <a href="/BookStore/productView.do?bookId=${relatedBookList.bookId }">
                                <h5>${relatedBookList.bookName }</h5>
                                
                            </a>
                            <div class="product-price">
                                ${relatedBookList.bookSaleprice }                      
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
            </div>
        </div>
    </div>
    <!-- Related Products Section End -->

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
   <script src="resources/custom/js/custom_productView.js"></script>
</body>

</html>