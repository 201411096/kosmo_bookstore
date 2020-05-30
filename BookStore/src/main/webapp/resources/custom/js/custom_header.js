$(function(){
	console.log("resources/custom/js/custom_header.js js파일 연결 확인");
	
	$('#listSearch').on('keyup', listSearchKeyUpEvent);
});

function listSearchKeyUpEvent() {
	console.log("resources/custom/js/custom_header.js js파일에서 listSearch keyUP 확인 ");
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'searchList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		data : {"searchWord" : $('#listSearch').val()},
		success : function(resultData){
			var list = new Array();
			list = resultData.searchResult;
			console.log(list[0].bookName);
			var check = resultData.checkAjax;
			console.log(check);
			$('#searchList').empty(); //resultBox?를 초기화하고 새로 구성
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }

	});
}