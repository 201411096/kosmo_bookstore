var curPage;
var writerData_total_page;
var defaultOpts = {
        totalPages: 20,
        onPageClick: function (event, page) {
            $('#page-content').text('Page ' + page);
            curPage=page;
            console.log('curPage확인 :' + curPage);
            getWriterDataInPaging();
        }
    };
$(function(){
	getWriterData();
	$('#listSearch').on('keyup', getWriterData);
//	$('#pagination-demo').on('click', getWriterDataInPaging);
	$(document).on("click",".btn-primary", updateBtnEvent);
	$(document).on("click",".btn-warning", deleteBtnEvent);
});


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
function getWriterDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getWriterDataWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			drawWriterTable(resultData);
			console.log("페이지 안에서 뭔가를 불러오긴하냐");
			console.log(resultData);
			console.log("ajax 안에서 curPage 확인 : " + curPage);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function getWriterData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getWriterDataWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			drawWriterTable(resultData);
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

function drawWriterTable(data){
	$('#writerTable').empty();
	var formPrefix1 = '<form action="/BookStore/admin/loadWriterUpdatePage.do">';
	var formPrefix2 = '<form action="/BookStore/admin/writerDelete.do">';
	var formSuffix = '</form>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	var buttonUpdate = '<button class="btn btn-primary">수정</button>';
	var buttonDelete = '<button class="btn btn-warning">삭제</button>';
	var inputtypehiddenPrefix = '<input type="hidden" name="writerId" value="';
	var inputtypehiddenSuffix = '">';
	for(var i=0; i<data.writerListSize; i++){
		var listContent =  
						  trPrefix +
						  tdPrefix + data.writerList[i].writerId + tdSuffix +
						  tdPrefix + data.writerList[i].writerName + tdSuffix +
						  tdPrefix + buttonUpdate + 
						  formPrefix1 + inputtypehiddenPrefix + data.writerList[i].writerId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  tdPrefix + buttonDelete + 
						  formPrefix2 + inputtypehiddenPrefix + data.writerList[i].writerId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  trSuffix		  
						  ;
		$('#writerTable').append(listContent);
	}
}