//페이징처리
var curPage;
var productData_total_page;
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
	getProductData();
	$('#listSearch').on('keyup', getProductData);
	$('#bookGenreOption').on('change', getProductData);
	$('#bookCntSpan').text($('#bookCnt').val()); // 슬라이더 옆에 있는 숫자
	$('#bookCnt').on('change', bookSliderEvtHandler); // 슬라이더 변경시 숫자 바뀌고 테이블 데이터도 바뀜
});

function bookSliderEvtHandler(){
	$('#bookCntSpan').text($('#bookCnt').val()); // 슬라이더 옆에 있는 숫자
	getProductData();
}

function getProductDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/selectProductListWithFiltering.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {
				"searchWord" : $('#listSearch').val(),
				"curPage" : curPage,
				"bookGenre" : $('#bookGenreOption').val(),
				"bookCnt" : $('#bookCnt').val(),
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
function getProductData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/selectProductListWithFiltering.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : 'json',
		data : {
				"searchWord" : $('#listSearch').val(),
				"bookGenre" : $('#bookGenreOption').val(),
				"bookCnt" : $('#bookCnt').val(),
			},
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
						  trSuffix		  
						  ;
		$('#productTable').append(listContent);
	}
}