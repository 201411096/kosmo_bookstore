var chartData;
var chartOptions;
var maxBook;
var minBook;
$(function(){
	makeChartLoop();
	setInterval(makeChartLoop, 5000);
	
	//콘솔 확인 버튼 이벤트
	$('#consoleCheck').on('click', function(){
		console.log(maxBook.bookId);
		console.log(maxBook.bookName);
		console.log(maxBook.writerName);
		console.log(minBook.bookId);
		console.log(minBook.bookName);
		console.log(minBook.writerName);
	})
});
function makeChartLoop(){
	$.ajax({
		type:'post',
		async:true,
		url:"ajaxTendencyGraph.do",
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		dataType : 'json',
		success : function(resultData){			
			chartData= makeAjaxChartData(resultData.customerId ,makeCustomerArray(resultData), makeTotalArray(resultData));
			makeChart(chartData, chartOptions);			
			maxBook = bookInMaxPrefferedGenre(resultData);
			minBook = bookInMinPrefferedGenre(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function makeAjaxChartData(cId, cArray, tArray){
	var customerId = cId;
	var customerArray = cArray;
	var totalArray = tArray;
	var customerColor = "rgba(255, 99, 132, 1)";
	var customerBackgroundColor = "rgba(255, 99, 132, 0.2)";
	var totalColor = "rgba(179, 181, 198, 1)";
	var totalBackgroundColor = "rgba(179, 181, 198, 0.2)";
//	var prev_customerColor ="rgba(255, 99, 132, 1)";
//	var prev_totalColor ="rgba(179, 181, 198, 1)";
	var chartData ={
		labels : ["Art", "Social", "Economic", "Technology", "Literature", "History"],
		datasets : [
			{
				label : customerId+ "님의 dataset",
				backgroundColor : customerBackgroundColor,
				borderColor : customerColor,
				pointBackgroundColor : customerColor,
				pointBorderColor : "#fff",
				pointHoverBackgroundColor : "#fff",
				pointHoverBorderColor : customerColor,
				data : customerArray
			},
			{
				label : "모든 유저의 dataset",
				backgroundColor : totalBackgroundColor,
				borderColor : totalColor,
				pointBackgroundColor : totalColor,
				pointBorderColor : "#fff",
				pointHoverBackgroundColor : "#fff",
				pointHoverBorderColor : totalColor,
				data : totalArray
			},
		]
	};
	return chartData;
}
function makeChart(chartData, chartOptions){
	var ctx = document.getElementById('myChart').getContext('2d');
	var myRadarChart = new Chart(ctx, {
		type : 'radar',
		data : chartData,
//		options : chartOptions
        options:{
            responsive: false
/*            ,scales: {
                xAxes: [{
                    ticks: {
                        min: 0
                    }
                }]
            }*/
        }
	});
}
function makeCustomerArray(resultData){
	var customerArray = new Array();
	customerArray.push(resultData.tendency.art);
	customerArray.push(resultData.tendency.social);
	customerArray.push(resultData.tendency.economic);
	customerArray.push(resultData.tendency.technology);
	customerArray.push(resultData.tendency.literature);
	customerArray.push(resultData.tendency.history);
	return customerArray;
}
function makeTotalArray(resultData){
	var totalArray = new Array();
	totalArray.push(resultData.totalTendency.art);
	totalArray.push(resultData.totalTendency.social);
	totalArray.push(resultData.totalTendency.economic);
	totalArray.push(resultData.totalTendency.technology);
	totalArray.push(resultData.totalTendency.literature);
	totalArray.push(resultData.totalTendency.history);
	return totalArray;
}


function bookInMaxPrefferedGenre(resultData){
	var book = {
			bookId : resultData.bookInMaxPrefferedGenre.bookId,
			writerId : resultData.bookInMaxPrefferedGenre.writerId,
			writerName : resultData.bookInMaxPrefferedGenre.writerName,
			bookPrice : resultData.bookInMaxPrefferedGenre.bookPrice,
			bookName : resultData.bookInMaxPrefferedGenre.bookName,
			bookGenre : resultData.bookInMaxPrefferedGenre.bookGenre,
			bookStory : resultData.bookInMaxPrefferedGenre.bookStory,
			bookPdate : resultData.bookInMaxPrefferedGenre.bookPdate,
			bookSaleprice : resultData.bookInMaxPrefferedGenre.bookSaleprice,
			bookCnt : resultData.bookInMaxPrefferedGenre.bookCnt,
			bookScore : resultData.bookInMaxPrefferedGenre.bookScore,
			bookScorecount : resultData.bookInMaxPrefferedGenre.bookScorecount,
			bookScoreDivideByCount : resultData.bookInMaxPrefferedGenre.bookScoreDivideByCount
	}
	return book
}

function bookInMinPrefferedGenre(resultData){
	var book = {
			bookId : resultData.bookInMinPrefferedGenre.bookId,
			writerId : resultData.bookInMinPrefferedGenre.writerId,
			writerName : resultData.bookInMinPrefferedGenre.writerName,
			bookPrice : resultData.bookInMinPrefferedGenre.bookPrice,
			bookName : resultData.bookInMinPrefferedGenre.bookName,
			bookGenre : resultData.bookInMinPrefferedGenre.bookGenre,
			bookStory : resultData.bookInMinPrefferedGenre.bookStory,
			bookPdate : resultData.bookInMinPrefferedGenre.bookPdate,
			bookSaleprice : resultData.bookInMinPrefferedGenre.bookSaleprice,
			bookCnt : resultData.bookInMinPrefferedGenre.bookCnt,
			bookScore : resultData.bookInMinPrefferedGenre.bookScore,
			bookScorecount : resultData.bookInMinPrefferedGenre.bookScorecount,
			bookScoreDivideByCount : resultData.bookInMinPrefferedGenre.bookScoreDivideByCount
	}
	return book
}

function makeChartOptions(){	
}





/* 막대 그래프 샘플
function sampleChartFunc(){
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        datasets: [{
	            label: '# of Votes',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
}*/