/*
변수
	ㄴ chartPieData : 차트에 사용되는 데이터
	ㄴ chartPieOptions : 차트 생성시 사용되는 옵션
	
함수
	ㄴ makeChartPieAjax : 차트를 그리는데 필요한 옵션들을 받아서 controller로 넘기고 해당 옵션들에 해당하는 데이터들을 받아서 차트를 그림
	ㄴ makeAjaxChartPieData : makeChartAjax에서 받아온 데이터들을 차트데이터로 사용할 수 있게 가공
	
실행부분
	ㄴ 화면 로딩 후 바로 데이터를 가져와서 차트를 그림
	ㄴ 10초마다 차트를 다시 그림
*/
var chartPieData;
var chartPieOptions = {
                  maintainAspectRatio : false // 부모가 만든 크기 안에 꽉 차게 함(default 값: true)
               };

$(function(){
   makeChartPieAjax();
   setInterval(makeChartPieAjax, 10000);
});
function makeChartPieAjax(){
   $('#myPieChartContainer').empty();
   $('#myPieChartContainer').append('<canvas id="myPieChart"></canvas>');
   $.ajax({
      type:'post',
       async:true,
       url:"/BookStore/admin/getGenreSalesData.do",
       contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
       dataType : 'json',
       success : function(resultPieData){
          chartPieData= makeAjaxChartPieData(resultPieData);
          makeChartPie(chartPieData, chartPieOptions);
        
       },
       error:function(request,status,error){
           console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
   });
}

function makeAjaxChartPieData(resultData){
   var dataLabels = new Array();
   var pieChartData = new Array();   
   for(var i=0; i<resultData.GenreSalesListSize; i++){
      dataLabels.push(resultData.GenreSalesList[i].BOOK_GENRE);
      pieChartData.push(resultData.GenreSalesList[i].BUY_PRICE);
      console.log(dataLabels);
      console.log(pieChartData);
      
   }
   var chartData = {
                  labels : ["예술", "경제", "역사", "문학", "사회", "과학/기술"],
                  datasets : [
                     {
                        label : "장르별 매출표",
                        data : pieChartData,
                        backgroundColor : [
                           "#ffa000",
                           "#ffa0ff",
                           "#20a0ff",
                           "#80ffc0",
                           "#ff0020",
                           "#ffff60"
                        ],
                     }
                  ]
               
                  }
   return chartData;
}
function makeChartPie(chartPieData, chartPieOptions){
   var ctx = document.getElementById('myPieChart').getContext('2d');
   var myChart = new Chart(ctx, {
      type : 'pie',
      data : chartPieData,
      options : chartPieOptions
   });
   
}   