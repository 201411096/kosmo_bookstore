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
		<link href="../resources/custom/css/admin_dashboard.css" rel="stylesheet">
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
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
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
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Email campaign chart -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">매출 요약</h4>
								<div class="form-group">
									<label>차트 옵션 </label>
									<select class="custom-select col-3" id="chartShapeOption">
										<option>차트 종류</option>
										<option value="bar">막대</option>
										<option selected value="line">선형</option>
										<option value="pie">파이</option>
										<option value="doughnut">도넛</option>
										<option value="polarArea">폴라</option>
									</select> 
									<select class="custom-select col-3" id="termOption">
										<option>기간 설정</option>
										<option value="0">연도별</option>
										<option value="1">월별</option>
										<option selected value="2">일별</option>
										<option value="3">시단위</option>
										<option value="4">분단위</option>
										<option value="5">초단위</option>
									</select>
                                    <input id="chartDataCntOption" type="number" class="form-control col-3" value="30">									
								</div>
								<!--    차트 부분 시작 -->
								<div id="myChartContainer">
								</div>
								<!--    차트 부분 끝 -->
							</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-5">장르별 누적 매출 차트</h5><br>
<!--                                 파이 차트(장르) 시작 -->
                                <div id="myPieChartContainer">

								</div>
								<br><br>
<!--                                 파이 차트(장르) 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Email campaign chart -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Ravenue - page-view-bounce rate -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">재고 관리</h4>
                            </div>
                            <div class="form-group">
									<label>&nbsp 차트 옵션 &nbsp </label>
									<select class="custom-select col-3" id="bookGenreOption">
										<option selected value="default">장르 종류</option>
										<option value="ART">ART</option>
										<option value="SOCIAL">SOCIAL</option>
										<option value="ECONOMIC">ECONOMIC</option>
										<option value="TECHNOLOGY">TECHNOLOGY</option>
										<option value="LITERATURE">LITERATURE</option>
										<option value="HISTORY">HISTORY</option>
									</select> 
                            </div>
							<div class="form-group">
							<div class="form-group">
									<label>&nbsp 검색 옵션 &nbsp </label>
									<select class="custom-select col-3" id="bookSortOption">
										<option selected value="default">정렬 종류</option>
										<option value="book_id">책번호</option>
										<option value="book_name">책제목</option>
										<option value="writer_id">저자번호</option>
										<option value="writer_name">저자이름</option>
										<option value="book_cnt">재고개수</option>
										<option value="book_genre">장르</option>
										<option value="book_pdate">출간일</option>
										<option value="book_price">원가</option>
										<option value="book_saleprice">정가</option>
										<option value="BOOK_SCOREDIVIDEBYCOUNT">평점</option>
									</select>
									<select class="custom-select col-3" id="bookSortSequenceOption">
										<option selected value="ASC">오름차순</option>
										<option value="DESC">내림차순</option>
									</select>  
                            </div>
							<label>&nbsp 재고 개수</label> 
								<div class="d-flex justify-content-center my-4 w-50">								
									<div class="w-75">
										<input type="range" class="custom-range" id="bookCnt" min="0" max="200">
									</div>
									<span id="bookCntSpan" class="font-weight-bold text-primary ml-2 valueSpan2"></span>
								</div>
							</div>
<!-- 							<form class="col-lg-10 col-md-12" action="#"> -->
<!-- 				               <div> -->
<!-- 				                  <input class="form-control" name="searchWord" id="listSearch" type="text" placeholder="검색어를 입력하세요"> -->
<!-- 				               </div> -->
<!-- 							</form> -->
							<br>						
							<div class="table-responsive">
								<table id="productDataTable" class="table">
									<thead>
										<tr>
											<th scope="col">책번호</th>
											<th scope="col">저자번호</th>
											<th scope="col">상품명</th>
											<th scope="col">저자이름</th>
											<th scope="col">출간일</th>
											<th scope="col">장르</th>
											<th scope="col">상품원가</th>
											<th scope="col">상품정가</th>
											<th scope="col">수량</th>
											<th scope="col">평점</th>
										</tr>
									</thead>
									<tbody id="productTable">
									</tbody>
								</table>
								<ul id="pagination-demo" class="pagination-sm"></ul>
							</div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Ravenue - page-view-bounce rate -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
<!--                 <div class="row"> -->
<!--                     column -->
<!--                     <div class="col-lg-6"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-body"> -->
<!--                                 <h4 class="card-title">Recent Comments</h4> -->
<!--                             </div> -->
<!--                             <div class="comment-widgets" style="height:430px;"> -->
<!--                                 Comment Row -->
<!--                                 <div class="d-flex flex-row comment-row m-t-0"> -->
<!--                                     <div class="p-2"> -->
<!--                                         <img src="../resources/adminTemplate/assets/images/users/1.jpg" alt="user" width="50" class="rounded-circle"> -->
<!--                                     </div> -->
<!--                                     <div class="comment-text w-100"> -->
<!--                                         <h6 class="font-medium">James Anderson</h6> -->
<!--                                         <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span> -->
<!--                                         <div class="comment-footer"> -->
<!--                                             <span class="text-muted float-right">April 14, 2016</span> -->
<!--                                             <span class="label label-rounded label-primary">Pending</span> -->
<!--                                             <span class="action-icons"> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-pencil-alt"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-check"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-heart"></i> -->
<!--                                                 </a> -->
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Comment Row -->
<!--                                 <div class="d-flex flex-row comment-row"> -->
<!--                                     <div class="p-2"> -->
<!--                                         <img src="../resources/adminTemplate/assets/images/users/4.jpg" alt="user" width="50" class="rounded-circle"> -->
<!--                                     </div> -->
<!--                                     <div class="comment-text active w-100"> -->
<!--                                         <h6 class="font-medium">Michael Jorden</h6> -->
<!--                                         <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span> -->
<!--                                         <div class="comment-footer "> -->
<!--                                             <span class="text-muted float-right">April 14, 2016</span> -->
<!--                                             <span class="label label-success label-rounded">Approved</span> -->
<!--                                             <span class="action-icons active"> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-pencil-alt"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="icon-close"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-heart text-danger"></i> -->
<!--                                                 </a> -->
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Comment Row -->
<!--                                 <div class="d-flex flex-row comment-row"> -->
<!--                                     <div class="p-2"> -->
<!--                                         <img src="../resources/adminTemplate/assets/images/users/5.jpg" alt="user" width="50" class="rounded-circle"> -->
<!--                                     </div> -->
<!--                                     <div class="comment-text w-100"> -->
<!--                                         <h6 class="font-medium">Johnathan Doeting</h6> -->
<!--                                         <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span> -->
<!--                                         <div class="comment-footer"> -->
<!--                                             <span class="text-muted float-right">April 14, 2016</span> -->
<!--                                             <span class="label label-rounded label-danger">Rejected</span> -->
<!--                                             <span class="action-icons"> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-pencil-alt"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-check"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-heart"></i> -->
<!--                                                 </a> -->
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 Comment Row -->
<!--                                 <div class="d-flex flex-row comment-row m-t-0"> -->
<!--                                     <div class="p-2"> -->
<!--                                         <img src="../resources/adminTemplate/assets/images/users/2.jpg" alt="user" width="50" class="rounded-circle"> -->
<!--                                     </div> -->
<!--                                     <div class="comment-text w-100"> -->
<!--                                         <h6 class="font-medium">Steve Jobs</h6> -->
<!--                                         <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span> -->
<!--                                         <div class="comment-footer"> -->
<!--                                             <span class="text-muted float-right">April 14, 2016</span> -->
<!--                                             <span class="label label-rounded label-primary">Pending</span> -->
<!--                                             <span class="action-icons"> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-pencil-alt"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-check"></i> -->
<!--                                                 </a> -->
<!--                                                 <a href="javascript:void(0)"> -->
<!--                                                     <i class="ti-heart"></i> -->
<!--                                                 </a> -->
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     column -->
<!--                     <div class="col-lg-6"> -->
<!--                         <div class="card"> -->
<!--                             <div class="card-body"> -->
<!--                                 <h4 class="card-title">Temp Guide</h4> -->
<!--                                 <div class="d-flex align-items-center flex-row m-t-30"> -->
<!--                                     <div class="display-5 text-info"><i class="wi wi-day-showers"></i> <span>73<sup>°</sup></span></div> -->
<!--                                     <div class="m-l-10"> -->
<!--                                         <h3 class="m-b-0">Saturday</h3><small>Ahmedabad, India</small> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <table class="table no-border mini-table m-t-20"> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td class="text-muted">Wind</td> -->
<!--                                             <td class="font-medium">ESE 17 mph</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="text-muted">Humidity</td> -->
<!--                                             <td class="font-medium">83%</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="text-muted">Pressure</td> -->
<!--                                             <td class="font-medium">28.56 in</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="text-muted">Cloud Cover</td> -->
<!--                                             <td class="font-medium">78%</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                                 <ul class="row list-style-none text-center m-t-30"> -->
<!--                                     <li class="col-3"> -->
<!--                                         <h4 class="text-info"><i class="wi wi-day-sunny"></i></h4> -->
<!--                                         <span class="d-block text-muted">09:30</span> -->
<!--                                         <h3 class="m-t-5">70<sup>°</sup></h3> -->
<!--                                     </li> -->
<!--                                     <li class="col-3"> -->
<!--                                         <h4 class="text-info"><i class="wi wi-day-cloudy"></i></h4> -->
<!--                                         <span class="d-block text-muted">11:30</span> -->
<!--                                         <h3 class="m-t-5">72<sup>°</sup></h3> -->
<!--                                     </li> -->
<!--                                     <li class="col-3"> -->
<!--                                         <h4 class="text-info"><i class="wi wi-day-hail"></i></h4> -->
<!--                                         <span class="d-block text-muted">13:30</span> -->
<!--                                         <h3 class="m-t-5">75<sup>°</sup></h3> -->
<!--                                     </li> -->
<!--                                     <li class="col-3"> -->
<!--                                         <h4 class="text-info"><i class="wi wi-day-sprinkle"></i></h4> -->
<!--                                         <span class="d-block text-muted">15:30</span> -->
<!--                                         <h3 class="m-t-5">76<sup>°</sup></h3> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                 </div> -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="../resources/custom/js/admin_dashboard.js"></script>
    <script src="../resources/custom/js/admin_pieChart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
    <script src="../resources/custom/js/admin_dashboardFilteringList.js"></script>
</body>

</html>