$(function(){
	console.log("custon_shoppingCart.js 확인");
	//$('#shoppingCartTbody .dec pro-qty').on('click', qtyClickFunc);
	$('#shoppingCartTbody .inc').on('click', qtyIncClickFunc);
	$('#shoppingCartTbody .dec').on('click', qtyDecClickFunc);
	$('#shoppingCartTbody .pro-qty').find('input').on('keyup', qtyKeyupFunc);
});
function qtyKeyupFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input").val());
	var productTotalPrice = productCount * productPrice;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function qtyIncClickFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input").val()) + parseInt(1);
	var productTotalPrice = productCount * productPrice;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function qtyDecClickFunc(){
	var productPrice = $(this).parent().parent().parent().prev().text();
	var productCount = parseInt($(this).parent().find("input").val()) - parseInt(1);
	var productTotalPrice = productCount * productPrice;
	// 해당 물품의 가격 합계
	$(this).parent().parent().parent().next().text(productTotalPrice);
	calculationTotalPrice();
}
function calculationTotalPrice(){
	var subTotalPrice=0;
	var cartTotalPrice=0;
	var cnt=$('#shoppingCartTbody').children().length;
	var price=$('#shoppingCartTbody >tr > td.total-price'); //jquery로 가져오면서 스크립트 객체로 바뀜
	console.log("22"+price.length + "/" + price[0].innerHTML); 
	
	for(var i=0; i<cnt; i++){
		subTotalPrice = parseInt(subTotalPrice) + parseInt(price[i].innerHTML);
	}
	cartTotalPrice = subTotalPrice;
	
	$('#subTotal').find('span').text(subTotalPrice);
	$('#cartTotal').find('span').text(cartTotalPrice);
}