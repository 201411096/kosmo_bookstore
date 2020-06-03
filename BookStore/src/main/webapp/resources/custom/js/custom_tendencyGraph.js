var chartData;
var chartOptions;
$(function(){
	//console.log("custom_tendencyGraph.js 파일 연결 확인");
	//sampleChartFunc();
	chartData= makeChartData();
	makeChart(chartData, chartOptions);
});
function makeChartData(){
	var customerId = $('#customerId').val();
	var customerArray = makeCustomerArray();
	var totalArray = makeTotalArray();
	var chartData ={
		labels : ["Art", "Social", "Economic", "Technology", "Literature", "History"],
		datasets : [
			{
				label : customerId+ "님의 dataset",
				backgroundColor : "rgba(255, 99, 132, 0.2)",
				borderColor : "rgba(255, 99, 132, 1)",
				pointBackgroundColor : "rgba(255, 99, 132, 1)",
				pointBorderColor : "#fff",
				pointHoverBackgroundColor : "#fff",
				pointHoverBorderColor : "rgba(255, 99, 132, 1)",
				data : customerArray
			},
			{
				label : "모든 유저의 dataset",
				backgroundColor : "rgba(179, 181, 198, 0.2)",
				borderColor : "rgba(179, 181, 198, 1)",
				pointBackgroundColor : "rgba(179, 181, 198, 1)",
				pointBorderColor : "#fff",
				pointHoverBackgroundColor : "#fff",
				pointHoverBorderColor : "rgba(179, 181, 198, 1)",
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
		options : chartOptions
	});
}
function makeCustomerArray(){
	var customerArray = new Array();
	customerArray.push($('#customerArt').val());
	customerArray.push($('#customerSocial').val());
	customerArray.push($('#customerEconomic').val());
	customerArray.push($('#customerTechnology').val());
	customerArray.push($('#customerLiterature').val());
	customerArray.push($('#customerHistory').val());
	
	return customerArray;
}
function makeTotalArray(){
	var totalArray = new Array();
	totalArray.push($('#totalArt').val());
	totalArray.push($('#totalSocial').val());
	totalArray.push($('#totalEconomic').val());
	totalArray.push($('#totalTechnology').val());
	totalArray.push($('#totalLiterature').val());
	totalArray.push($('#totalHistory').val());
	
	return totalArray;
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