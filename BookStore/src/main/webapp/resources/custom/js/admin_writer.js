$(function(){
	$('#listSearch').on('keyup', getWriterDate);
});

function getWriterDate(){
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
	for(var i=0; i<data.writerListSize; i++){
		var listContent = trPrefix +
						  tdPrefix + data.writerList[i].writerId + tdSuffix +
						  tdPrefix + data.writerList[i].writerName + tdSuffix +
						  trSuffix;
		$('#writerTable').append(listContent);
	}
}