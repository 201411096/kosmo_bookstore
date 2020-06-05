$(function(){
	//회원가입 페이지 연결
	$('#right-btn1').click(function(){
		$(location).attr("href","moveToRegister.do");
	});
	
	//로그인 페이지 연결
	$('#right-btn2').click(function(){
		$(location).attr("href","moveToLogin.do");
	});
	
	//메인 페이지 연결(**안함)
	$('#right-btn3').click(function(){
		$(location).attr("href","main.do");
	});
});
