<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 전체 리스트</title>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<h1>예약 리스트(관리자용)</h1>
	<table border="1">
	<tr>
		<th>예약 번호</th>
		<th>예약 날짜</th>
		<th>예약 인원</th>
		<th>요구 사항</th>
		<!-- <th>예약한 시간</th>-->
		<th>회원 번호</th>
		<th>예약 취소</th>
	</tr>
	<c:forEach var="dto" items="${lists}">
	<tr>
		<td>${dto.reservationNum}</td>
		<td><a href="reservationDetail?reservationNum=${dto.reservationNum}">
			${dto.reservationDate.toString().substring(0,10)} ${dto.reservationDate.toString().substring(11,16)}
		</a></td>
		<td>${dto.reservationNumber}</td>
		<td>${dto.reservationRequest}</td>
		<!-- <td>${dto.reservationNow.toString().substring(0,10)} ${dto.reservationNow.toString().substring(11,19)}</td>-->
		<td>${dto.userNum}</td>
		<td><a href="reservationDelete?reservationNum=${dto.reservationNum}">X</a></td>	
	</tr>
	</c:forEach>
	</table>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>