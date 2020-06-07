$(function(){
	console.log("custom_receip.js 연결 확인");
	reconstructionViewPage();
});

function reconstructionViewPage(){ // 뷰 화면을 재구성
	getReceiptProductList();
}
function getReceiptProductList(){
	const params = new URLSearchParams(window.location.search);
	var buylistId = params.get('buylistId');
	console.log("buylistId 확인 : " + buylistId);
	$.ajax({
		type:'post', 
		async:true, 
		url: 'getReceipt.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : { "buylistId" : buylistId},
		dataType : 'json',
		success : function(resultData){
			console.log(resultData);
			constructReceiptPart(resultData);
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	});
}
function constructReceiptPart(resultData){
	$('#receiptbody').empty();
	var tdclassPrefix = '<td class="cart-title first-row">';
	var tdSuffix = '</td>';
	var h5Prefix = '<h5>';
	var h5Suffix = '</h5>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var aPrefix1 = '<a href="productView.do?bookId=';
	var aPrefix2 = '">';
	var aSuffix = '</a>';
	var tiTag =  '<td class="close-td first-row"><i class="ti-close"></i></td>';
	var reviewUnComplete = '작성하러가기';
	var reviewComplete = '작성완료';
	for(var i=0; i< parseInt(resultData.buyListSize); i++){
		var listContentRelatedReview;
		if(resultData.writeReviewFlagArray[i]===0){
			listContentRelatedReview = 	tdclassPrefix +
										h5Prefix + 
										aPrefix1 + resultData.buyList[i].BOOKID + aPrefix2 + reviewUnComplete + aSuffix +  
										h5Suffix +
										tdSuffix;
		}else if(resultData.writeReviewFlagArray[i]===1){
			listContentRelatedReview = 	tdclassPrefix +
										h5Prefix + 
										reviewComplete +  
										h5Suffix +
										tdSuffix;
		}
		
		
		var listContent = trPrefix +
							tdclassPrefix +
							h5Prefix + resultData.buyList[i].BUYID + h5Suffix +
							tdSuffix +
							tdclassPrefix +
							h5Prefix + 
							aPrefix1 + resultData.buyList[i].BOOKID + aPrefix2 + resultData.buyList[i].BOOKNAME + aSuffix +  
							h5Suffix +
							tdSuffix +
							tdclassPrefix +
							h5Prefix + resultData.buyList[i].BUYCNT + h5Suffix +
							tdSuffix +
							tdclassPrefix +
							h5Prefix + resultData.buyList[i].BOOKSALEPRICE + h5Suffix +
							tdSuffix +
							listContentRelatedReview +
						  trSuffix;
		$('#receiptbody').append(listContent);
	}
	
} 