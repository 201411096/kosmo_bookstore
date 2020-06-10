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
	var dataLabels = new Array();
	var lineChartData = new Array();
	var mainColor = "rgba(75,192,192,1)";
	var subColor = "rgba(75,192,192,0.4)";
	for(var i=0; i< resultData.salesListSize; i++){
		dataLabels.push(resultData.salesList[i].BUYDATE);
		lineChartData.push(resultData.salesList[i].BUYPRICE);
	}
	var chartData ={
		      labels : dataLabels,
		      datasets : [
		         {
		            label : "매출표",
		            fill : false,
		            lineTension : 0.1,
		            backgroundColor : subColor,
		            borderColor : mainColor,
		            borderCapStyle : 'butt',
//		            borderDash : {},
//		            borderDashOffset : 0.0,
		            borderJoinStyle : 'miter',
		            pointBorderColor : mainColor,
		            pointBackgroundColor : '#fff',
		            pointBorderWitdh : 2,
		            pointRadius : 1,
		            pointHitRadius : 10,
		            data : lineChartData,
		            spanGaps : false
		         },
		      ]
		   };
   return chartData;
}
function makeChart(chartData, chartOptions){
	   //var ctx = document.getElementById('myChart');
	   var ctx = document.getElementById('myChart').getContext('2d');
	   var myChart = new Chart(ctx, {
	      type : 'line',
	      data : chartData,
	      options : chartOptions
	   });
}