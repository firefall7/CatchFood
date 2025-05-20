<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<c:if test="${not empty detailList}">
  	<c:set var="first" value="${detailList[0]}" />

  	<h3>예약 상세보기 (관리자용)</h3>
  	
  	<table border="1">
    	<tr>
      	<th>예약 번호</th>
      	<td>${first.reservationNum}</td>
    	</tr>
    	
	    <tr>
	      <th>예약 날짜</th>
	      <td>${first.reservationDate.substring(0,10)} ${first.reservationDate.substring(11,16)}</td>
	    </tr>
	    
	    <tr>
	      <th>인원</th>
	      <td>${first.reservationNumber}</td>
	    </tr>
	    
	    <tr>
	      <th>요구 사항</th>
	      <td>${first.reservationRequest}</td>
	    </tr>
	    
	    
	  </table>
	
	  <br/>
	  <h4>주문한 음식</h4>
	  <table border="1">
	    <tr>
	      <th>음식</th>
	      <th>수량</th>
	      <th>금액</th>
	    </tr>
	    <c:forEach var="item" items="${detailList}">
	      <tr>
	        <td>${item.menuName}</td>
	        <td>${item.basketCount}</td>
	        <td>${item.basketPTotal}</td>
	      </tr>
	    </c:forEach>
	  </table>
	</c:if>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>