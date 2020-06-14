/*
변수
	ㄴ chartData : 차트에 사용되는 데이터
	ㄴ chartOption : 차트 생성시 사용되는 옵션
	ㄴ maxBook : 가장 선호하는 장르의 책 정보를 담을 변수
	ㄴ minBook : 가장 선호하지 않는 장르의 책 정보를 담을 변수	
함수
	ㄴ makeChartAjax : 사용자의 선호 장르 그래프를 그린 후 가장 선호하는 장르의 책과 가장 선호하지 않는 장르의 책을 시각화하는 함수
	ㄴ makeAjaxChartData : 그래프를 그리는데 필요한 데이터를 가공하는함수
	ㄴ makeChart : 그래프를 실질적으로 그리는 함수
	ㄴ makeCustomerArray : makeChartAjax에서 받아온 데이터 중 로그인 한 사용자의 데이터를 가공하는 함수
	ㄴ makeTotalArray : makeChartAjax에서 받아온 데이터 중 전체 사용자의 데이터를 가공하는 함수
	ㄴ bookInMaxPrefferedGenre : makeChartAjax에서 받아온 데이터 중 로그인 한 사용자의 가장 선호하는 장르의 책 데이터를 가공하는 함수
	ㄴ bookInMinPrefferedGenre : makeChartAjax에서 받아온 데이터 중 로그인 한 사용자의 가장 선호하지 않는 장르의 책  데이터를 가공하는 함수
	ㄴ makeRecommendMaxList : 가장 선호하는 장르의 책을 html요소로 시각화
	ㄴ makeRecommendMinList : 가장 선호하지 않는 장르의 책을 html요소로 시각화
	ㄴ recommendMaxTitle : 가장 선호하는 장르의 책제목부분을 html요소로 시각화
	ㄴ recommendMinTitle : 가장 선호하지 않는 장르의 책제목부분을 html요소로 시각화
실행부분
	ㄴ 최초 화면 로딩시 makeChartAjax로 화면 구성
	ㄴ 5초마다 makeChartAjax로 화면 구성
*/
var chartData;
var chartOptions;
var maxBook; // 가장 선호하는 장르 // 사용법 : maxBook.bookId, maxBook.bookName
var minBook;
$(function(){
   makeChartAjax();
   setInterval(makeChartAjax, 5000);
   
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
function makeChartAjax(){
	$('#myChartContainer').empty();
	$('#myChartContainer').append('<canvas id="myChart" width="600" height="600"></canvas>');
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
         $('#recommendMaxBookContent').empty(); //resultBox?를 초기화하고 새로 구성
         $('#recommendMinBookContent').empty(); //resultBox?를 초기화하고 새로 구성
         $('#recommendMaxTitle').empty(); //resultBox?를 초기화하고 새로 구성
         $('#recommendMinTitle').empty(); //resultBox?를 초기화하고 새로 구성
         makeRecommendMaxList(maxBook);
         makeRecommendMinList(minBook);
         recommendMaxTitle(resultData, maxBook);
         recommendMinTitle(resultData, minBook);
         
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
//   var prev_customerColor ="rgba(255, 99, 132, 1)";
//   var prev_totalColor ="rgba(179, 181, 198, 1)";
   var chartData ={
      labels : ["Art", "Social", "Economic", "Technology", "Literature", "History"],
      datasets : [
         {
            label : customerId+ "님의 분야별 관심도",
            backgroundColor : customerBackgroundColor,
            borderColor : customerColor,
            pointBackgroundColor : customerColor,
            pointBorderColor : "#fff",
            pointHoverBackgroundColor : "#fff",
            pointHoverBorderColor : customerColor,
            data : customerArray
         },
         {
            label : "모든 유저의 님의 분야별 관심도",
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
//      options : chartOptions
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

function makeRecommendMaxList(maxBook){
   var divPrefixPiPic = '<div class="pi-pic">';
   var divSuffixPoPic = '</div>';
   var imgDirection = '<img src="resources/custom/img/banner/'+maxBook.bookId+'.jpg" alt="">';
   var ulPrefix = '<ul>';
   var ulSuffix = '</ul>';
   var liFirst = '<li class="w-icon active"><a href="/BookStore/productView.do?bookId='+maxBook.bookId+'"><i class="icon_bag_alt"></i></a></li>';
   var liSecond = '<li class="quick-view"><a href="/BookStore/productView.do?bookId='+maxBook.bookId+'">+ Quick View</a></li>';
   var liThird = '<li class="w-icon"><a href="/BookStore/productView.do?bookId='+maxBook.bookId+'"><i class="fa fa-random"></i></a></li>';
   var divPrefixPiText = '<div class="pi-text">';
   var divSuffixPiText = '</div>';
   var divBookGenre = '<div class="catagory-name">'+maxBook.bookGenre+'</div>';
   var bookLinkPrefix = '<a href="/BookStore/productView.do?'+maxBook.bookId+'">';
   var bookLinkSuffix = '</a>';
   var h5Tag = '<h5>'+maxBook.bookName+'</h5>';
    var h6Tag = '<h6 id="bestSellerWriter">/ '+maxBook.writerName+' /</h6>';
   var divProductPrice = '<div class="product-price">'+maxBook.bookSaleprice+'</div>';
    
   var recommendBookContent = divPrefixPiPic+
                           imgDirection+
                           ulPrefix +
                              liFirst +
                              liSecond +
                              liThird +
                           ulSuffix +
                        divSuffixPoPic +
                        divPrefixPiText +
                           divBookGenre +
                           bookLinkPrefix + 
                              h5Tag +
                              h6Tag +
                           bookLinkSuffix +
                           divProductPrice +
                        divSuffixPiText;
   
   
   $('#recommendMaxBookContent').append(recommendBookContent);   
}

function makeRecommendMinList(minBook){
   var divPrefixPiPic = '<div class="pi-pic">';
   var divSuffixPoPic = '</div>';
   var imgDirection = '<img src="resources/custom/img/banner/'+minBook.bookId+'.jpg" alt="">';
   var ulPrefix = '<ul>';
   var ulSuffix = '</ul>';
   var liFirst = '<li class="w-icon active"><a href="/BookStore/productView.do?bookId='+minBook.bookId+'"><i class="icon_bag_alt"></i></a></li>';
   var liSecond = '<li class="quick-view"><a href="/BookStore/productView.do?bookId='+minBook.bookId+'">+ Quick View</a></li>';
   var liThird = '<li class="w-icon"><a href="/BookStore/productView.do?bookId='+minBook.bookId+'"><i class="fa fa-random"></i></a></li>';
   var divPrefixPiText = '<div class="pi-text">';
   var divSuffixPiText = '</div>';
   var divBookGenre = '<div class="catagory-name">'+minBook.bookGenre+'</div>';
   var bookLinkPrefix = '<a href="/BookStore/productView.do?'+minBook.bookId+'">';
   var bookLinkSuffix = '</a>';
   var h5Tag = '<h5>'+minBook.bookName+'</h5>';
   var h6Tag = '<h6 id="bestSellerWriter">/ '+minBook.writerName+' /</h6>';
   var divProductPrice = '<div class="product-price">'+minBook.bookSaleprice+'</div>';
   
   var recommendBookContent = divPrefixPiPic+
                           imgDirection+
                           ulPrefix +
                              liFirst +
                              liSecond +
                              liThird +
                           ulSuffix +
                        divSuffixPoPic +
                        divPrefixPiText +
                           divBookGenre +
                           bookLinkPrefix + 
                              h5Tag +
                              h6Tag +
                           bookLinkSuffix +
                           divProductPrice +
                        divSuffixPiText;
   
   
   $('#recommendMinBookContent').append(recommendBookContent);
}

function recommendMaxTitle(resultData, maxBook){
   var h4Title = '<h4>'+resultData.customerId+'님의 완소 장르 추천!</h4><hr/>';
   $('#recommendMaxTitle').append(h4Title);
}

function recommendMinTitle(resultData, minBook){
   var h4Title = '<h4>'+resultData.customerId+'님, 이런 책은 어떠세요?</h4><hr/>';
   $('#recommendMinTitle').append(h4Title);
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