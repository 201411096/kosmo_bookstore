$(function(){
	getWriterData();
	$('#listSearch').on('keyup', getWriterData);
	$(document).on("click",".btn-primary", updateBtnEvent);
	$(document).on("click",".btn-warning", deleteBtnEvent);
});

function updateBtnEvent(){
	console.log( $(this).parent().prev().prev().text() );
	console.log( $(this).parent().prev().text() );
}

function deleteBtnEvent(){
	console.log( $(this).parent().prev().prev().prev().text() );
	console.log( $(this).parent().prev().prev().text() );
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
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	var buttonUpdate = '<button class="btn btn-primary">UPDATE</button>';
	var buttonDelete = '<button class="btn btn-warning">DELETE</button>';
	for(var i=0; i<data.writerListSize; i++){
		var listContent = trPrefix +
						  tdPrefix + data.writerList[i].writerId + tdSuffix +
						  tdPrefix + data.writerList[i].writerName + tdSuffix +
						  tdPrefix + buttonUpdate + tdSuffix +
						  tdPrefix + buttonDelete + tdSuffix +
						  trSuffix
						  ;
		$('#writerTable').append(listContent);
	}
}