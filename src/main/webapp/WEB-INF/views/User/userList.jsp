<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/userlist.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<h2>회원 리스트(관리자용)</h2>
	<table class="userlist-table">
		<tr>
			<th>회원번호</th>
			<th>회원 ID</th>
			<th>회원 Email</th>
			<th>회원 이름</th>
			<th>회원 생년월일</th>
			<th>회원 성별</th>
			<th>회원 연락처</th>
			<th>회원 주소</th>
		</tr>
		<c:forEach var="dto" items="${lists}">
		<tr>
			<td>${dto.userNum}</td>
			<td>${dto.userId}</td>
			<td>${dto.userEmail}</td>
			<td>${dto.userName}</td>
			<td>${dto.userBirth}</td>
			<td>${dto.userGender}</td>
			<td>${dto.userPhone}</td>
			<td>${dto.userAddress} ${dto.userAddrdetail}</td>
		</tr>
		</c:forEach>
	</table>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>
</body>
</html>