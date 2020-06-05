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
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   },
	   complete :function(resultData){   
	   }
		
	});
}

function updateBtnHandler(){
//	$('#reviewForm').attr('action', 'updateReview.do');
//	$('#reviewForm').submit();
//	console.log("update_btn 연결 확인");
	
	$.ajax({
		type:'post', // get을 하나 post를 하나 url에 보이진 않음, 용량이 많으면 post
		async:true, // default : true
		url: 'updateReview.do',
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
			if(resultData.updateResult === "1"){
				makeReviewList(resultData);
			}else if(resultData.insertResult === "0"){
				alert("리뷰 수정 실패");
			}
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   },
	   complete :function(resultData){   
	   }
		
	});
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
	var inputTypeHiddenreviewIdPrefix = '<input type="hidden" class="buyreviewId" value="';
	var inputTypeHiddenreviewIdSuffix = ' ">';
	var inputTypeDeleteButton = '<input type="button" id="r-delete" class="site-btn" value="삭제">';
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
			inputTypeHiddenreviewcustomerIdPrefix + resultData.reviewList[i].customerId + inputTypeHiddenreviewcustomerIdSuffix +
			inputTypeHiddenreviewIdPrefix + resultData.reviewList[i].buyreviewId + inputTypeHiddenreviewIdSuffix +
			modifyButton +
			'&nbsp' +
			inputTypeDeleteButton +
			divSuffix +
			divSuffix;
		
		$('#review-container').append(listContent);
	}
}

function getContentBtnHandler(){
	var customerId = $(this).parent().find('.reviewcustomerId').val().trim();
	var eventObject = $(this);
	var reviewId = eventObject.parent().find('.buyreviewId').val().trim();
	$.ajax({
		type:'post', 
		async:true, 
		url: 'getLoginCustomerIdAndReview.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
		data : {"reviewId" : reviewId},
		dataType : 'json',
		success : function(resultData){
			var loginCustomerId = resultData.customerId.trim();
			//reviewId와 loginId가 같을 경우 자신이 작성한 리뷰의 정보를 가져와서 세팅해줌
			if(customerId==loginCustomerId){
				$('#buyreviewContent').text( resultData.reviewVO.buyreviewContent );
				$('#buyreviewScore').val( resultData.reviewVO.buyreviewScore );
			}else{
				alert("본인이 작성한 리뷰만 수정할 수 있습니다.");
			}
		},
	   error:function(request,status,error){
		   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }		
	});
}