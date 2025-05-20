<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 찾기 결과</h2>
    <!-- 성공 메시지 -->
    <c:if test="${not empty message}">
	    <p style="color:green;">${message}</p>
	    <a href="/login">로그인하러 가기</a>
    </c:if>

    <!-- 실패 메시지 -->
    <c:if test="${not empty error}">
	    <p style="color:red;">${error}</p>
	    <a href="/findPasswordForm">다시 시도하기</a>
    </c:if>

</body>
</html>