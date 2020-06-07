var receiptListData = new Array(); // 안 씀
$(function(){
	console.log("custom_receiptList.js 연결 확인");
	reconstructionViewPage();
});

function reconstructionViewPage(){ // 뷰 화면을 재구성
	getReceiptList();
//	constructReceiptPart(receiptListData); // 안 씀
}
function getReceiptList(){
	$.ajax({
		type:'post', 
		async:true, 
		url: 'getReceiptList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
		dataType : 'json',
		success : function(resultData){
			console.log(resultData);
			receiptListData=resultData;
			constructReceiptPart(resultData);
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	});
}
function constructReceiptPart(receiptListData){
	$('#receiptListTbody').empty();
	var tdclassPrefix = '<td class="cart-title first-row">';
	var tdSuffix = '</td>';
	var h5Prefix = '<h5>';
	var h5Suffix = '</h5>';
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var aPrefix1 = '<a href="/test_receipt.do?buylistId=';
	var aPrefix2 = '">';
	var aSuffix = '</a>'
	for(var i=0; i< parseInt(receiptListData.receiptListSize); i++){
		var listConntent = trPrefix +
							   tdclassPrefix +
							   h5Prefix +
							   aPrefix1 + receiptListData.receiptList[i].buylistId + aPrefix2 + receiptListData.receiptList[i].buylistId + aSuffix +
							   h5Suffix +
							   tdSuffix +
							   tdclassPrefix +
							   h5Prefix +
							   receiptListData.productListNameInReceiptList[i] +
							   h5Suffix +
							   tdSuffix +
							   tdclassPrefix +
							   h5Prefix +
							   receiptListData.receiptList[i].buyDate +
							   h5Suffix +
							   tdSuffix +
							   tdclassPrefix +
							   h5Prefix +
							   receiptListData.totalPriceList[i] +
							   h5Suffix +
							   tdSuffix +
						   trSuffix;
		$('#receiptListTbody').append(listConntent);
	}
	
} 