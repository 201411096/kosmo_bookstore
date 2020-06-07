$(function(){
	console.log("custom_receiptList.js 연결 확인");
});

function reconstructionViewPage(){ // 뷰 화면을 재구성
	
}
function getReceiptList(){
	$.ajax({
		type:'post', 
		async:true, 
		url: 'getReceiptList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
		dataType : 'json',
		success : function(resultData){
			
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	});
}