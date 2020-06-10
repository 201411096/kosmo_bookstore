$(function(){
	getStoreData();
	$('#listSearch').on('keyup', getStoreData);
	$(document).on("click",".btn-primary", updateBtnEvent);
	$(document).on("click",".btn-warning", deleteBtnEvent);

});

function updateBtnEvent(){
	$(this).next().submit();
}

function deleteBtnEvent(){
	$(this).next().submit();
}

function getStoreData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/BookStore/admin/getStoreData.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#listSearch').val()},
		dataType : 'json',
		success : function(resultData){
			drawStoreTable(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function drawStoreTable(data){
	$('#storeTable').empty();
	var formPrefix1='<form action="/BookStore/admin/loadStoreUpdatePage.do">';
	var formPrefix2='<form action="/BookStore/admin/storeDelete.do">';
	var formSuffix = '</form>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	var buttonUpdate = '<button class="btn btn-primary">수정</button>';
	var buttonDelete = '<button class="btn btn-warning">삭제</button>';
	var inputtypehiddenPrefix = '<input type="hidden" name="storeId" value="';
	var inputtypehiddenSuffix = '">';
	for(var i=0; i<data.storeListSize; i++){
		var listContent =  
						  trPrefix +
						  
						  tdPrefix + data.storeList[i].storeId + tdSuffix +
						  tdPrefix + data.storeList[i].storeName + tdSuffix +
						  tdPrefix + data.storeList[i].storeAddr + tdSuffix +
						  tdPrefix + data.storeList[i].storeTel + tdSuffix +
						  tdPrefix + data.storeList[i].storePoint + tdSuffix +
						  
						  tdPrefix + buttonUpdate + 
						  formPrefix1 + inputtypehiddenPrefix + data.storeList[i].storeId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  
						  tdPrefix + buttonDelete + 
						  formPrefix2 + inputtypehiddenPrefix + data.storeList[i].storeId + inputtypehiddenSuffix + formSuffix +
						  tdSuffix +
						  
						  trSuffix		  
						  ;
		$('#storeTable').append(listContent);
	}
	
}