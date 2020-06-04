
  var locations = new Array();
  var storeName = $('.storeName');
  var storeAddr = $('.storeAddr');
  var storeTel = $('.storeTel');
  var storePoint = $('.storePoint');
  var storeListLength =  parseInt( $('.storeListLength').val() );
  for(var i = 0; i<storeListLength; i++){
	  var store = new Array();
	  var temp = storePoint[i].value.split(',');
	  console.log("-------------------------------------" + temp);
	  var storePointX = parseFloat( temp[0] ); 
	  var storePointY = parseFloat( temp[1] );
	  console.log("-------------------------------------" + storePointX);
	  console.log("-------------------------------------" + storePointY);
	  store.push(storeName[i].value);
	  store.push(storePointX);
	  store.push(storePointY);
	  store.push(storeAddr[i].value);
	  store.push(storeTel[i].value);
	  locations.push(store);
	}
//   var locations = [
//       ['종로점', 37.5615512, 126.9733249, '서울특별시 종로구 종로1가', '02-123-4567']
//       []
//       []
//     ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11	,
      center: new google.maps.LatLng(37.549012, 126.988546),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    for (i = 0; i < locations.length; i++) {      
      marker = new google.maps.Marker({
        id:i,
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0],locations[i][4]);
          infowindow.open(map, marker);
        }
      })(marker, i));
      if(marker)
      {
        marker.addListener('click', function() {
          map.setZoom(15);
          map.setCenter(this.getPosition());
        });
        }
    }

  