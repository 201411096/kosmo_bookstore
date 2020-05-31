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
			var list = resultData.searchResult;
			makeSearhResultBox(list); // 검색 결과 컴포넌트를 구현
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }

	});
}
//검색 결과 컴포넌트를 구현하는 함수
function makeSearhResultBox(list){
	$('#searchList').empty(); //resultBox?를 초기화하고 새로 구성
//	console.log(list[0].bookName);
	var listPrefix = '<li class="list-group-item">';
	var listSuffix = '</li>';
	var spanPrefix = '<span>';
	var spanSuffix = '</span>';
	var divPrefix = '<div>';
	var divSuffix = '</div>';
//	var bookLinkPrefix = '<a href="/BookStore/productView.do?bookId=';
//	var bookLinkSuffix = '</a>'
	for(var i=0; i<list.length; i++){
		var bookLinkPrefix = '<a href="/BookStore/productView.do?bookId='+ list[i].bookId+'">';
		var bookLinkSuffix = '</a>'		
		var listContent = listPrefix + 
							divPrefix + "도서명 : " + bookLinkPrefix + list[i].bookName + bookLinkSuffix + divSuffix +
							divPrefix + "저자명 : " + list[i].writerName + divSuffix +
							divPrefix + "가격 : " + list[i].bookSaleprice + divSuffix +
						  listSuffix;
		$('#searchList').append(listContent);
	}
	
	
}