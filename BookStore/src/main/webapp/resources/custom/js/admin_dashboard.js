var chartData;
var chartOptions = {
						//responsive: false,
						maintainAspectRatio : false //부모가 만든 크기 안에 꽉 차게 함(default 값: true)
					};
var chartType = 'line';
var mainColor = "rgba(75,192,192,1)"; // generator 사용전
var subColor = "rgba(75,192,192,0.4)"; // generator 사용전
$(function(){
	makeChartAjax();
	setInterval(makeChartAjax, 10000);
	$('#termOption').on('change', makeChartAjax);
	$('#chartDataCntOption').on('change', makeChartAjax);
	$('#chartShapeOption').on('change', makeChartAjax);
});
function makeChartAjax(){
	$('#myChartContainer').empty();
	$('#myChartContainer').append('<canvas id="myChart"></canvas>');
	$.ajax({
	      type:'post',
	      async:true,
	      url:"/BookStore/admin/getSalesDataWithOptions.do",
	      contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
	      data :{
	    	  		"option" : $('#termOption').val(),
	    	  		"chartDataCnt" : $('#chartDataCntOption').val()
	      },
	      dataType : 'json',
	      success : function(resultData){
	    	  chartType = $(chartShapeOption).val();
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
	
	if(chartType!=='line'){ // line타입이 아니면 그래프 색깔 생성
		mainColor = mainColorGenerator(resultData.reducedSalesListSize);
	}else if(chartType==='line'){
		mainColor = "rgba(75,192,192,1)";
	}
	
	for(var i=0; i< resultData.reducedSalesListSize; i++){
		dataLabels.push(resultData.reducedSalesList[i].BUYDATE);
		lineChartData.push(resultData.reducedSalesList[i].BUYPRICE);
	}

	var chartData ={
		      labels : dataLabels,
		      datasets : [
		         {
		            label : "매출표",
		            fill : false,
		            lineTension : 0.1,
		            backgroundColor : mainColor, //subColor
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
	   var ctx = document.getElementById('myChart').getContext('2d');
	   var myChart = new Chart(ctx, {
	      //type : 'bar',
		   type : chartType,
	      data : chartData,
	      options : chartOptions
	   });
}
function mainColorGenerator(size){
	var resultColor;
	var rRanNum =  Math.floor(Math.random()*255);
	var gRanNum =  Math.floor(Math.random()*255);
	var bRanNum =  Math.floor(Math.random()*255);
	
	if(size>1){
		resultColor = new Array();
		for(var i=0; i<size; i++){
			rRanNum =  Math.floor(Math.random()*255);
			gRanNum =  Math.floor(Math.random()*255);
			bRanNum =  Math.floor(Math.random()*255);
			temp = 'rgba(' +rRanNum + ', ' + gRanNum + ', ' + bRanNum + ')';
			resultColor.push(temp);
		}
	}else if(size==1){
		resultColor = 'rgba(' +rRanNum + ', ' + gRanNum + ', ' + bRanNum + ')';
	}
	
	return resultColor
}