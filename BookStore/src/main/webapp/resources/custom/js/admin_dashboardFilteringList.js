/*
변수
	ㄴ curPage : 현재 페이지
	ㄴ defaultOpts : 페이징 처리에 사용되는 기본 옵션
		ㄴ 페이지를 클릭할 떄마다 해당 페이지에 맞는 데이터를 다시 불러오도록 이벤트를 걸어둠
	
함수
	ㄴ bookSliderEvtHandler : 슬라이더를 옮길때마다 옆에 표기되는 숫자가 변경됨
	ㄴ getProductDataInPaging : 페이지를 클릭했을 경우 불려오는 함수로 해당 페이지에 맞는 데이터를 불러옴
	ㄴ getProductData : 책의 장르, 재고 개수, 정렬 순서, 정렬 옵션등이 변경됬을 경우 그에 맞는 데이터들을 불러옴
		ㄴ 내부적으로 동적인 페이징을 구성함
	ㄴ drawProductTable : ajax로 받아온 데이터로 테이블을 그려주는 함수
	
실행부분
	ㄴ 화면 로딩 후 바로 데이터를 가져와서 테이블을 그림
	ㄴ 책의 장르가 변경될때마다 테이블을 다시 그려주는 이벤트 핸들러를 연결
	ㄴ 책의 재고개수가 변경될때마다 테이블을 다시 그려주는 이벤트 핸들러를 연결
	ㄴ 책의 재고개수 슬라이더를 움직일때마다 옆의 숫자를 그에 맞게 변경해주는 이벤트 핸들러를 연결
	ㄴ 책의 정렬옵션이 변경될때마다 테이블을 다시 그려주는 이벤트 핸들러를 연결
	ㄴ 책의 정렬 순서가 변경될때마다 테이블을 다시 그려주는 이벤트 핸들러를 연결
*/


//페이징처리
var curPage;
var productData_total_page; // 사용하지 않은 듯
var defaultOpts = {
        totalPages: 20,
        onPageClick: function (event, page) {
            $('#page-content').text('Page ' + page);
            curPage=page;
            console.log('curPage확인 :' + curPage);
            getProductDataInPaging();
        }
    };
$(function(){
	getProductData();														//화면이 로딩되자마자 도서 목록을 가져옴
//	$('#listSearch').on('keyup', getProductData);				
	$('#bookGenreOption').on('change', getProductData);						//장르 옵션이 변경되면 그에 맞는 도서 목록을 가져옴
	$('#bookCntSpan').text($('#bookCnt').val()); 							//슬라이더 옆에 있는 숫자를 슬라이더 값에 맞춰 변경해줌
	$('#bookCnt').on('change', bookSliderEvtHandler); 						//슬라이더 변경시 숫자 바뀌고 테이블 데이터도 바뀜
	$('#bookSortSequenceOption').on('change', getProductData);				//정렬옵션에 따라 도서 목록을 정렬해줌(도서 제목, 저자 제목 등 10여종 이상)
	$('#bookSortOption').on('change', getProductData);						//오름차순 내림차순에 따라 도서 목록을 정렬해줌
});

function bookSliderEvtHandler(){
	$('#bookCntSpan').text($('#bookCnt').val()); // 슬라이더 옆에 있는 숫자
	getProductData();
}
//현재의 filtering option안에서 페이지를 옮길떄만 불려지는 함수
//	ㄴ 기본적으로 페이징이 변경되지 않음( 검색 결과는 변화하지 않았기 떄문에)
function getProductDataInPaging(){											
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/selectProductListWithFiltering.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {
//				"searchWord" : $('#listSearch').val(),
				"curPage" : curPage,
				"bookGenre" : $('#bookGenreOption').val(),
				"bookCnt" : $('#bookCnt').val(),
				"bookSortOption" : $('#bookSortOption').val(),
				"bookSortSequenceOption" : $('#bookSortSequenceOption').val(),
				},
		dataType : 'json',
		success : function(resultData){
			drawProductTable(resultData);
			console.log(resultData);
			console.log("ajax 안에서 curPage 확인 : " + curPage);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
// 필터링이 변경되는등의 이유로 검색결과 수가 변경될경우 불림
//ㄴ 페이징의 수가 동적으로 변화함( 검색결과 자체가 달라졌기 떄문에)
function getProductData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/selectProductListWithFiltering.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : 'json',
		data : {
//				"searchWord" : $('#listSearch').val(),
				"bookGenre" : $('#bookGenreOption').val(),
				"bookCnt" : $('#bookCnt').val(),
				"bookSortOption" : $('#bookSortOption').val(),
				"bookSortSequenceOption" : $('#bookSortSequenceOption').val(),				
			},
		success : function(resultData){
			drawProductTable(resultData);
            var totalPages = resultData.pagination.pageCnt;
            var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
            $('#pagination-demo').twbsPagination('destroy');				
            $('#pagination-demo').twbsPagination($.extend({}, defaultOpts, {//pagination plugin 함수
                startPage: currentPage,
                totalPages: totalPages
            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
//table을 구성해주는 함수
//	ㄴ 검색을 하는 위의 두 함수에서 내부적으로 호출해서 테이블을 구성해줌
function drawProductTable(data){
	$('#productTable').empty();
	var formPrefix1 = '<form action="/BookStore/admin/loadProductUpdatePage.do">';
	var formPrefix2 = '<form action="/BookStore/admin/productDelete.do">';
	var formSuffix = '</form>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	var buttonUpdate = '<button class="btn btn-primary">수정</button>';
	var buttonDelete = '<button class="btn btn-warning">삭제</button>';
	var inputtypehiddenPrefix = '<input type="hidden" name="bookId" value="';
	var inputtypehiddenSuffix = '">';
	for(var i=0; i<data.bookListSize; i++){
		var listContent =  
						  trPrefix +
						  tdPrefix + data.bookList[i].bookId + tdSuffix +
						  tdPrefix + data.bookList[i].writerId + tdSuffix +
						  tdPrefix + data.bookList[i].bookName + tdSuffix +
						  tdPrefix + data.bookList[i].writerName + tdSuffix +
						  tdPrefix + data.bookList[i].bookPdate + tdSuffix +
						  tdPrefix + data.bookList[i].bookGenre + tdSuffix +
						  tdPrefix + data.bookList[i].bookPrice + tdSuffix +
						  tdPrefix + data.bookList[i].bookSaleprice + tdSuffix +
						  tdPrefix + data.bookList[i].bookCnt + tdSuffix +
						  tdPrefix + data.bookList[i].bookScoreDivideByCount + tdSuffix +
						  trSuffix		  
						  ;
		$('#productTable').append(listContent);
	}
}