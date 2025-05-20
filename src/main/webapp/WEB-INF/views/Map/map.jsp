<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>

	    <title><%= request.getParameter("name") %> 위치</title>
	    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ced87bc4e52aedb00b83a03d1de38694"></script>
		<style>
		    .map-card {
		        width: 100%;               
		        max-width: none;           
		        margin: 0;              
		        padding: 20px;              
		        box-sizing: border-box;      
		        border-top: 1px solid #eee;  
		        background-color: #fff;
		    }
		
		    .map-card-header {
		        padding: 15px;
		        text-align: center;
		        font-size: 20px;
		        font-weight: bold;
		        background-color: #f8f9fa;
		        border-bottom: 1px solid #eee;
		    }
		
		    #map {
		        width: 100%;
		        height: 400px;
		    }
		</style>
	
	<%
	    String name = request.getParameter("name");
	    String latStr = request.getParameter("lat");
	    String lngStr = request.getParameter("lng");
	
	    if (name == null || name.isEmpty()) name = "CaTchFood 본점";
	    if (latStr == null || latStr.isEmpty()) latStr = "35.148705";
	    if (lngStr == null || lngStr.isEmpty()) lngStr = "129.058910";
	
	    double lat = Double.parseDouble(latStr);
	    double lng = Double.parseDouble(lngStr);
	%>
	
	<div class="map-card">
	    <div class="map-card-header"><%= name %> 위치</div>
	    <div id="map"></div>
	</div>
	
	<script>
	    const name = "<%= name %>";
	    const lat = <%= lat %>;
	    const lng = <%= lng %>;
	
	    const mapContainer = document.getElementById('map');
	    const mapOption = {
	        center: new kakao.maps.LatLng(lat, lng),
	        level: 3
	    };
	
	    const map = new kakao.maps.Map(mapContainer, mapOption);
	
	    const marker = new kakao.maps.Marker({
	        position: new kakao.maps.LatLng(lat, lng),
	        map: map
	    });
	
	    const infowindow = new kakao.maps.InfoWindow({
	        content:
	            '<div style="padding:10px; text-align:center; width:150px;">' +
	            '🍽 ' + name + '<br/>' +
	            '[범천1동 869-28]' +
	            '</div>'
	    });
	    infowindow.open(map, marker);
	</script>
