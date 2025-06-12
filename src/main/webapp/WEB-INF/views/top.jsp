<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
  	<div class="navbar">
	    <div class="navbar-left">
	      <a href="/">
	      	<img src="/images/logo1.png" alt="CaTchFood 로고">
	      </a>
	    </div> 
	
	    <div class="right-section">
	      <div class="auth-links">
	      	<c:choose>
		        <c:when test="${not empty sessionScope.loginUser}">
		            <span>${loginUser.userName}님 환영합니다.</span> |
		            <a href="/logout">로그아웃</a>
		        </c:when>
		        <c:otherwise>
		            <a href="/login">로그인</a> |
		            <a href="/register">회원가입</a>
		        </c:otherwise>
		    </c:choose>
	      </div>
	      <div class="toggle-btn" onclick="toggleSidebar()">☰</div>
	    </div>
  	</div>

  	     <div class="sidebar" id="sidebar">
	     	<a href="noticelist">공지사항</a>
	     	<a href="menulist">메뉴판</a>
	     	<a href="review">리뷰</a>
	       	<a href="reservation">예약하기</a>       	       	
			<c:if test="${sessionScope.loginUser.role eq 'user' or sessionScope.loginUser.role eq 'admin'}">
				<a href="mybasket">예약 현황</a>
			    <a href="informationUpdate">마이페이지</a>
			</c:if>
	        <c:if test="${sessionScope.role eq 'admin'}">
	        	<a href="menuinsert">메뉴 작성</a>
	       		<a href="reservationList">예약 리스트</a>
	        	<a href="userList">회원 리스트</a>
       		</c:if>
     	</div>
     
	  
	  
	  <div class="overlay" id="overlay"></div>
	  
	  <script>
	    function toggleSidebar() {
	      const sidebar = document.getElementById('sidebar');
	      const overlay = document.getElementById('overlay');
	
	      const isActive = sidebar.classList.contains('active');
	
	      if (isActive) {
	        sidebar.classList.remove('active');
	        overlay.classList.remove('active');
	      } else {
	        sidebar.classList.add('active');
	        overlay.classList.add('active');
	      }
	    }
	
	    document.getElementById('overlay').addEventListener('click', function () {
	      document.getElementById('sidebar').classList.remove('active');
	      document.getElementById('overlay').classList.remove('active');
	    });
	  </script>
</body>
</html>