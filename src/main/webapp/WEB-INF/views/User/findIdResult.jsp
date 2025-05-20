<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<h2><아이디 찾기 결과></h2>
	<c:if test="${not empty userId}">
  		<p>당신의 아이디는 <strong style="color:red;">${userId}</strong> 입니다.</p>
	</c:if>

	<c:if test="${not empty error}">
	  <p style="color:red;">${error}</p>
	</c:if>
	
	<input type="button" value="닫기" onclick="window.close()">
</body>
</html>