var chartData;
var chartOptions = {responsive: false};
$(function(){
	makeChartAjax();
	setInterval(makeChartAjax, 5000);
});
function makeChartAjax(){
	$('#myChartContainer').empty();
	$('#myChartContainer').append('<canvas id="myChart" width="500" height="300"></canvas>');
	$.ajax({
	      type:'post',
	      async:true,
	      url:"/BookStore/admin/getSalesDataWithOptions.do",
	      contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
	      dataType : 'json',
	      success : function(resultData){
	    	  chartData= makeAjaxChartData(resultData);
	    	  makeChart(chartData, chartOptions);
	    	  
	      },
	      error:function(request,status,error){
	         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	   });
}
function makeAjaxChartData(resultData){
	
}
function makeChart(chartData, chartOptions){
	   var ctx = document.getElementById('myChart').getContext('2d');
	   var myChart = new Chart(ctx, {
	      type : 'line',
	      data : chartData,
	      options : chartOptions
	   });
}