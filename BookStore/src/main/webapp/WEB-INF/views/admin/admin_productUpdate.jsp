<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/adminTemplate/assets/images/favicon.png">
    <title>Nice admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
		<link href="../resources/adminTemplate/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
		<link href="../resources/adminTemplate/dist/css/style.min.css" rel="stylesheet">
		<link href="../resources/custom/css/admin_writer.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>
	
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <jsp:include page="/admin/topbar.do"></jsp:include>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <jsp:include page="/admin/leftSidebar.do"></jsp:include>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title">book</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">book</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid 메인 부분 시작  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card-body">
							<form id="writerUpdate" action="/BookStore/admin/productUpdatePage.do">
								<div class="form-group">
									<label> 제품 번호</label> <input type="text" class="form-control" name="bookId" value="${bookVO.bookId}" readonly>
								</div>
								<div class="form-group">
									<label> 저자 번호</label> <input type="text" class="form-control" name="writerId" value="${bookVO.writerId}">
								</div>
								<div class="form-group">
									<label> 제품 이름</label> <input type="text" class="form-control" name="bookName" value="${bookVO.bookName }">
								</div>
								<div class="form-group">
									<label> 출간일</label> <input type="date" class="form-control" name="bookPdate" value="${bookVO.bookPdate }">
								</div>							
								<div class="form-group">
									<label> 장르</label>  
									<select class="custom-select col-12" id="inlineFormCustomSelect" name="bookGenre">
                                        <option >Choose...</option>
                                        <option value="ART" <c:if test="${bookVO.bookGenre eq 'ART' }">selected</c:if> > ART</option>
                                        <option value="LITERATURE" <c:if test="${bookVO.bookGenre eq 'LITERATURE' }">selected</c:if> >LITERATURE</option>
                                        <option value="ECONOMIC" <c:if test="${bookVO.bookGenre eq 'ECONOMIC' }">selected</c:if> >ECONOMIC</option>
                                        <option value="HISTORY" <c:if test="${bookVO.bookGenre eq 'HISTORY' }">selected</c:if> >HISTORY</option>
                                        <option value="SOCIAL" <c:if test="${bookVO.bookGenre eq 'SOCIAL' }">selected</c:if> >SOCIAL</option>
                                        <option value="TECHNOLOGY" <c:if test="${bookVO.bookGenre eq 'TECHNOLOGY' }">selected</c:if> >TECHNOLOGY</option>
                                    </select>
								</div>
								<div class="form-group">
									<label> 상품 원가</label> <input type="text" class="form-control" name="bookPrice" value="${bookVO.bookPrice }">
								</div>
								<div class="form-group">
									<label> 상품 정가</label> <input type="text" class="form-control" name="bookSaleprice" value="${bookVO.bookSaleprice }">
								</div>
								<div class="form-group">
								<label> 도서 내용</label><textarea class="form-control" name="bookStory" rows="5">${bookVO.bookStory }</textarea>
								</div>
								<div class="form-group">
									<label> 수량 </label> <input type="text" class="form-control" name="bookCnt" value="${bookVO.bookCnt }">
								</div>
								<button class="btn btn-info">수정</button>
							</form>
						</div>
					</div>
				</div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid 메인 부분 끝  -->
            <!-- ============================================================== -->

        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../resources/adminTemplate/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../resources/adminTemplate/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../resources/adminTemplate/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../resources/adminTemplate/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="../resources/adminTemplate/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../resources/adminTemplate/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../resources/adminTemplate/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="../resources/adminTemplate/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="../resources/adminTemplate/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="../resources/adminTemplate/dist/js/pages/dashboards/dashboard1.js"></script>
    
</body>

</html>