/*
변수
	ㄴ curPage : 현재 페이지
	ㄴ defaultOpts : 페이징 처리에 사용되는 기본 옵션
		ㄴ 페이지를 클릭할 떄마다 해당 페이지에 맞는 데이터를 다시 불러오도록 이벤트를 걸어둠
	
함수
	ㄴ getStoreData : 검색어를 포함하는 데이터들을 불러옴
		ㄴ 내부적으로 동적인 페이징을 구성함
	ㄴ drawStoreTable : ajax로 받아온 데이터로 테이블을 그려주는 함수
	ㄴ updateBtnEvent : 수정 버튼들 눌렀을 경우 이벤트 핸들러
		ㄴ 해당 bookId에 맞는 데이터들을 수정 화면으로 끌어가서 로딩함
	ㄴ deleteBtnEvent : 삭제 버튼들 눌렀을 경우 이벤트 핸들러
	
실행부분
	ㄴ 화면 로딩 후 바로 데이터를 가져와서 테이블를 그림
	ㄴ 수정 버튼 이벤트 핸들러 연결
	ㄴ 삭제 버튼 이벤트 핸들러 연결
*/
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