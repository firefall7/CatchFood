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
	<c:if test="${not empty userId}">
  		<p>당신의 아이디는 <strong>${userId}</strong> 입니다.</p>
	</c:if>

	<c:if test="${not empty error}">
	  <p style="color:red;">${error}</p>
	</c:if>
</body>
</html>