$(function(){
	console.log("custom_productView.js 확인");
	
	$('#review-btn').on('click', reviewBtnHandler);
	$('#update-btn').on('click', updateBtnHandler);
});

function reviewBtnHandler(){
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'insertReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		data : {
			"bookId" : $('#bookIdInReviewForm').val(),
			"buyreviewScore" : $('#buyreviewScore').val(),
			"buyreviewContent" : $('#buyreviewContent').val()
			
			},
		dataType : 'json',
		success : function(resultData){
			$('#buyreviewScore').val("");
			$('#buyreviewContent').val("");
			makeReviewList(resultData);
			console.log("review_btn ajax 성공");
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   },
	   complete :function(resultData){
		   console.log("review_btn ajax 종료");
		   
	   }
		
	});
	console.log("review_btn 연결 확인");
}

function updateBtnHandler(){
	$('#reviewForm').attr('action', 'insertReview.do');
	$('#reviewForm').submit();
	console.log("review_btn 연결 확인");
}

function makeReviewList(resultData){
	var divCommentOptionPrefix = '<div class="comment-option">';
	var divCoItemPrefix = '<div class="co-item">';
	var divSuffix = '</div>';
	var divAvatarPicPrefix = '<div class="avatar-pic">';
	var imgPrefix = '<img src="resources/img/product-single/';
	var imgSuffix = '" alt="">';
	var divAvatarTextPrefix = '<div class="avatar-text">';
	var h5Prefix = '<h5>';
	var h5Suffix = '</h5>';
	var spanPrefix = '<span>';
	var spanSuffix = '</span>';
	var divAtReplyPrefix = '<div class="at-reply">';
	
	$('#review-container').empty();
	for(var i=0; i<resultData.reviewListSize; i++){
		var listContent= 
			divCoItemPrefix +
			divAvatarPicPrefix + imgPrefix + 'avatar-1.png' + imgSuffix + divSuffix +
			divAvatarTextPrefix +
			h5Prefix + resultData.reviewList[i].customerId + spanPrefix + resultData.reviewList[i].buyreviewScore + spanSuffix + h5Suffix +
			divAtReplyPrefix + resultData.reviewList[i].buyreviewContent + divSuffix +
			divSuffix +
			divSuffix;
		
		$('#review-container').append(listContent);
	}
}