<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>

</head> 
<body>
		<input class="storeListLength" type=hidden value="${storeListSize} ">
	<c:forEach items="${storeList}" var="storeList">
		<input class="storeName"  type=hidden name="storeName" value="${storeList.storeName }">
		<input class="storeAddr" type=hidden name="storeAddr" value="${storeList.storeAddr }">
		<input class="storeTel" type=hidden name="storeTel" value="${storeList.storeTel }">
		<input class="storePoint" type=hidden name="storePoint" value="${storeList.storePoint }">
	</c:forEach>

  <div id="map" style="width: 1000px; height: 600px;"></div>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/custom/js/contact_map.js"></script>
</body>
</html>