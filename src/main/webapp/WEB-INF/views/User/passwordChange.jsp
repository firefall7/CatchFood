<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="/JS/passwordCheck.js"></script>
<link rel="stylesheet" href="/css/pwChange.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<h2>비밀번호 변경</h2>
	<div class="pwChange">
		<form name="passwordForm" method="post"action="informationChange">
		   새로운 비밀번호 : <input type="password" name="newPassword" placeholder="비밀번호는 8~12자, 영문자/숫자/특수문자를 각각 1개 이상 포함해야 합니다" /><br/>
		   비밀번호 확인 : <input type="password" name="newPasswordCheck" placeholder="위와 동일하게 입력해주세요."/><br/>
		   <input type="button" value="변경하기" onclick="passwordCheck()">
		</form>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>