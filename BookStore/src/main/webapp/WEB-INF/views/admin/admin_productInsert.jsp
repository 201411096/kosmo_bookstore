<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

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
							<form id="writerUpdate" action="/BookStore/admin/insertProduct.do">
								<div class="form-group">
									<label> 제품 번호</label> <input type="text" class="form-control" name="bookId" value="" placeholder="-----" disabled>
								</div>
								<div class="form-group">
									<label> 저자 번호</label> <input type="text" class="form-control" name="writerId" value="">
								</div>
								<div class="form-group">
									<label> 제품 이름</label> <input type="text" class="form-control" name="bookName" value="">
								</div>
								<div class="form-group">
									<label> 출간일</label> <input type="date" class="form-control" name="bookPdate" value="${bookVO.bookPdate }">
								</div>
								<div class="form-group">
									<label> 장르</label>  
									<select class="custom-select col-12" id="inlineFormCustomSelect" name="bookGenre">
                                        <option >Choose...</option>
                                        <option value="ART"> ART</option>
                                        <option value="LITERATURE">LITERATURE</option>
                                        <option value="ECONOMIC">ECONOMIC</option>
                                        <option value="HISTORY">HISTORY</option>
                                        <option value="SOCIAL">SOCIAL</option>
                                        <option value="TECHNOLOGY">TECHNOLOGY</option>
                                    </select>
								</div>
								<div class="form-group">
									<label> 상품 원가</label> <input type="text" class="form-control" name="bookPrice" value="">
								</div>
								<div class="form-group">
									<label> 상품 정가</label> <input type="text" class="form-control" name="bookSaleprice" value="">
								</div>
								<div class="form-group">
								<label> 도서 내용</label><textarea class="form-control" name="bookStory" rows="5"></textarea>
								</div>
								<div class="form-group">
									<label> 수량 </label> <input type="text" class="form-control" name="bookCnt" value="">
								</div>
								<button class="btn btn-info">등록</button>
							</form>
						</div>
					</div>
				</div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid 메인 부분 끝  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Nice admin. Designed and Developed by
                <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
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
    <script src="../resources/custom/js/admin_productInsert.js"></script>
    
</body>

</html>