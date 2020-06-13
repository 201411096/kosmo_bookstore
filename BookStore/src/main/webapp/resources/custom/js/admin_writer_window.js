//사용하지 않는 js 파일 -> 시간이 부족해서 구현하지 못한 부분, admin_writer_window.jsp 파일도 마찬가지 이유로 사용하지 않음

$(function(){
	getWriterData();
	$('#listSearch').on('keyup', getWriterData);
	$(document).on("click",".btn-primary", selectBtnEvent);
});

//function selectBtnEvent(){
//	console.log( $(this).parent().prev().prev().text() );
//	console.log( $(this).parent().prev().text() );
//	$(this).next().submit();
//}
function selectBtnEvent(){
	console.log( $(this).parent().prev().prev().text() );
	console.log( $(this).parent().prev().text() );
	
}

function getWriterData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getWriterData.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val()},
		dataType : 'json',
		success : function(resultData){
			drawWriterTable(resultData);
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
	var buttonUpdate = '<button class="btn btn-primary">선택</button>';
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