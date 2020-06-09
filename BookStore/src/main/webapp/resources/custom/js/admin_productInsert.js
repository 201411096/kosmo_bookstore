$(function(){
	console.log("productInsert.js 확인");
	$('#writerUpdate:nth-child(2)').find("input[type=text]").on('click', writerClickEvt);
});

function writerClickEvt(){
	console.log("클릭이벤트 확인");
}