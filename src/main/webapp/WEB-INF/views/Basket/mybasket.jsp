<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@taglib prefix="c" uri="jakarta.tags.core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<head>
	<link rel="stylesheet" href="/css/basket.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<h2>${sessionScope.loginUser.userName}님 예약 현황</h2>
	
	<c:set var="prevReservation" value="-1" />
	<c:forEach var="r" items="${myreservation}" varStatus="status">
	  <c:if test="${r.reservationNum != prevReservation}">
	    <c:if test="${status.index != 0}">
	        </table>
	      </div> 
	    </c:if>
	
	    <div class="reservation-block">
	      <h3>예약일: ${r.reservationDate} / 인원: ${r.reservationNumber}명</h3>
	      <p>요청사항: ${r.reservationRequest}</p>
	
	      <table>
	        <tr>
	          <th>메뉴</th>
	          <th>수량</th>
	          <th>금액</th>
	        </tr>
	  </c:if>
	
	  <tr>
	    <td>${r.menuName}</td>
	    <td>${r.basketCount}개</td>
	    <td>${r.basketPTotal}원</td>
	  </tr>
	
	  <c:set var="prevReservation" value="${r.reservationNum}" />
	</c:forEach>
	
	</table>
	</div> 
	<jsp:include page="/WEB-INF/views/Map/map.jsp">
	    <jsp:param name="name" value="${r.storeName}" />
	    <jsp:param name="lat" value="${r.lat}" />
	    <jsp:param name="lng" value="${r.lng}" />
	</jsp:include>
	
	<jsp:include page="../footer.jsp"/>
</body>

</html>