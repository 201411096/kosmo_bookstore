$(function(){
	//증가버튼 연결
	$('#shoppingCartTbody .inc').on('click', qtyIncClickFunc);
	//감소버튼 연결
	$('#shoppingCartTbody .dec').on('click', qtyDecClickFunc);
	//개수 텍스트 연결
	$('#shoppingCartTbody .pro-qty').find('input').on('keyup', qtyKeyupFunc);
	//x버튼 연결
	$('#shoppingCartTbody .ti-close').on('click', tiCloseFunc);
	//장바구니 업데이트
	$('#updateCartTag').on('click', updateCart);
	//결제화면으로 이동
	$('#proceedBtn').on('click', proceedToCheckOut);
});
function qtyKeyupFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input[type=text]").val());
	var productTotalPrice = productCount * productPrice;
	if(productTotalPrice<0)
		productTotalPrice=0;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function qtyIncClickFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input[type=text]").val()) + parseInt(1);
	var productTotalPrice = productCount * productPrice;
	if(productTotalPrice<0)
		productTotalPrice=0;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function qtyDecClickFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input[type=text]").val()) - parseInt(1);
	var productTotalPrice = productCount * productPrice;
	if(productTotalPrice<0)
		productTotalPrice=0;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function calculationTotalPrice(){
	var subTotalPrice=0;
	var cartTotalPrice=0;
	var cnt=$('#shoppingCartTbody').children().length;
	var price=$('#shoppingCartTbody >tr > td.total-price'); //jquery로 가져오면서 스크립트 객체로 바뀜 
	
	for(var i=0; i<cnt; i++){
		subTotalPrice = parseInt(subTotalPrice) + parseInt(price[i].innerHTML);
	}
	cartTotalPrice = subTotalPrice;
	
	$('#subTotal').find('span').text(subTotalPrice);
	$('#cartTotal').find('span').text(cartTotalPrice);
}
function tiCloseFunc(){
	$(this).parent().parent().remove();
}
function updateCart(){
	$('#shoppingCart').attr("action", "updateCartList.do");
	$('#shoppingCart').submit();
}
function proceedToCheckOut(){
	$('#shoppingCart').attr("action", "sendList.do");
	$('#shoppingCart').submit();
}
