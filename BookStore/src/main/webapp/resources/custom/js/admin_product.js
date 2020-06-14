/*
변수
	ㄴ curPage : 현재 페이지
	ㄴ defaultOpts : 페이징 처리에 사용되는 기본 옵션
		ㄴ 페이지를 클릭할 떄마다 해당 페이지에 맞는 데이터를 다시 불러오도록 이벤트를 걸어둠
	
함수
	ㄴ getProductDataInPaging : 페이지를 클릭했을 경우 불려오는 함수로 해당 페이지에 맞는 데이터를 불러옴
	ㄴ getProductData : 검색어를 포함하는 데이터들을 불러옴
		ㄴ 내부적으로 동적인 페이징을 구성함
	ㄴ drawProductTable : ajax로 받아온 데이터로 테이블을 그려주는 함수
	ㄴ updateBtnEvent : 수정 버튼들 눌렀을 경우 이벤트 핸들러
		ㄴ 해당 bookId에 맞는 데이터들을 수정 화면으로 끌어가서 로딩함
	ㄴ deleteBtnEvent : 삭제 버튼들 눌렀을 경우 이벤트 핸들러
	
실행부분
	ㄴ 화면 로딩 후 바로 데이터를 가져와서 테이블를 그림
	ㄴ 검색창에 입력할때마다 테이블을 다시 그려주는 keyup이벤트 핸들러 연결
		ㄴ 동적 페이징 처리
	ㄴ 수정 버튼 이벤트 핸들러 연결
	ㄴ 삭제 버튼 이벤트 핸들러 연결
*/
//페이징처리
var curPage;
//var productData_total_page;		//사용하지 않은 듯
var defaultOpts = {										//페이징 처리 함수에서 불리는 옵션
        totalPages: 20,
        onPageClick: function (event, page) {
            $('#page-content').text('Page ' + page);
            curPage=page;
            console.log('curPage확인 :' + curPage);
            getProductDataInPaging();
        }
    };
$(function(){
	getProductData();
	$('#listSearch').on('keyup', getProductData);
//	$('#pagination-demo').on('click', getWriterDataInPaging);
	$(document).on("click",".btn-primary", updateBtnEvent);
	$(document).on("click",".btn-warning", deleteBtnEvent);
});
//검색 결과 수가 바뀌지 않는 경우에 불리는 함수
// ㄴ 페이징 총 수가 변하지는 않음
function getProductDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getProductDataWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val(),
				"curPage" : curPage,
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


//이거 두개 있었는데 왜 정상적으로 됬는지 모름
//$(function(){
//	getProductData();
//	$('#listSearch').on('keyup', getProductData);
//	$(document).on("click",".btn-primary", updateBtnEvent);
//	$(document).on("click",".btn-warning", deleteBtnEvent);
//});

function updateBtnEvent(){
	console.log( $(this).parent().prev().prev().text() );
	console.log( $(this).parent().prev().text() );
	$(this).next().submit();
}

function deleteBtnEvent(){
	console.log( $(this).parent().prev().prev().prev().text() );
	console.log( $(this).parent().prev().prev().text() );
	$(this).next().submit();
}
//검색 결과 수가 바뀌는 경우에 불리는 함수
//ㄴ 페이징 총 수가 변함
function getProductData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getProductDataWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val()},
		dataType : 'json',
		success : function(resultData){
			drawProductTable(resultData);
            var totalPages = resultData.pagination.pageCnt;
            var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
            $('#pagination-demo').twbsPagination('destroy');
            $('#pagination-demo').twbsPagination($.extend({}, defaultOpts, {
                startPage: currentPage,
                totalPages: totalPages
            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

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
						  tdPrefix + data.bookList[i].bookPdate + tdSuffix +
						  tdPrefix + data.bookList[i].bookGenre + tdSuffix +
						  tdPrefix + data.bookList[i].bookPrice + tdSuffix +
						  tdPrefix + data.bookList[i].bookSaleprice + tdSuffix +
						  tdPrefix + data.bookList[i].bookCnt + tdSuffix +
						  tdPrefix + data.bookList[i].bookScoreDivideByCount + tdSuffix +
						  tdPrefix + buttonUpdate + 
						  formPrefix1 + inputtypehiddenPrefix + data.bookList[i].bookId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  tdPrefix + buttonDelete + 
						  formPrefix2 + inputtypehiddenPrefix + data.bookList[i].bookId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  trSuffix		  
						  ;
		$('#productTable').append(listContent);
	}
}