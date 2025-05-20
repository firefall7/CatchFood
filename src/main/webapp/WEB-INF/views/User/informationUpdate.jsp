<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.catchfood.dto.UserDto" %>
<html>
<head>
    <title>회원정보 수정</title>
    <link rel="stylesheet" href="/css/infoUpdate.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	 <div class="memberInfo">
     <h2>회원정보 수정</h2>
	    <table border="1">
	    	<tr>
	    		<th>아이디</th>
	    		<td>${user.userId}</td>
	    	</tr>
	    	
	    	<tr>
	    		<!-- <input type="hidden" name="password" value="${user.userPasswd}">-->
	    		<th>비밀번호</th>
	    		<td><a href="passwordChange">수정하기</a></td>
	    	</tr>
	    	
	    	<tr>
	    		<th>이름</th>
	    		<td>${user.userName}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>이메일</th>
	    		<td>${user.userEmail}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>생년월일</th>
	    		<td>${user.userBirth}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>성별</th>
	    		<td>${user.userGender}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>연락처</th>
	    		<td>${user.userPhone}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>주소</th>
	    		<td>${user.userAddress} ${user.userAddrdetail}</td>
	    	</tr>
	    	
	    	<tr>
	    		<th>가입일</th>
	    		<td>${user.userJoindate}</td>
	    	</tr>
	  	</table>
	  </div>
  	<jsp:include page="../footer.jsp"/>
 </body>
 </html>   