$(function(){
	console.log("custom_productView.js 확인");
	
	$('#review-btn').on('click', reviewBtnHandler);
	$('#update-btn').on('click', updateBtnHandler);
	$(document).on('click', '.site-btn', getContentBtnHandler);
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
			if(resultData.insertResult === "1"){
				makeReviewList(resultData);
			}else if(resultData.insertResult === "0"){
				alert("한명의 사용자는 하나의 책에 여러개의 리뷰를 등록할 수 없습니다.");
			}
			
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
	var modifyButton ='<input type="button" id="r-modify" class="site-btn" value="수정">';
	var inputTypeHiddenreviewcustomerIdPrefix = '<input type="hidden" class="reviewcustomerId" value="';
	var inputTypeHiddenreviewcustomerIdSuffix = ' ">';
	$('#review-container').empty();
	for(var i=0; i<resultData.reviewListSize; i++){
		var listContent= 
			divCoItemPrefix +
			divAvatarPicPrefix + imgPrefix + 'avatar-1.png' + imgSuffix + divSuffix +
			divAvatarTextPrefix +
			h5Prefix + 
			resultData.reviewList[i].customerId +
			spanPrefix + resultData.reviewList[i].buyreviewScore + spanSuffix + 
			h5Suffix +
			divAtReplyPrefix + resultData.reviewList[i].buyreviewContent + divSuffix +
			modifyButton +
			inputTypeHiddenreviewcustomerIdPrefix + resultData.reviewList[i].customerId + inputTypeHiddenreviewcustomerIdSuffix +			
			divSuffix +
			divSuffix;
		
		$('#review-container').append(listContent);
	}
}

function getContentBtnHandler(){
	var customerId = $(this).next().val();
	var loginCustomer = sessionStorage.getItem("customer");
	console.log("로그인한 customer" + loginCustomer);
	var loginCustomerId = loginCustomer.customerId;
	console.log(customerId);
	console.log("로그인한 customerId" + loginCustomerId);
	console.log('a');
}