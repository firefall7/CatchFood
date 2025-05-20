<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
	<body>
	  <jsp:include page="../top.jsp"/>
	
	  <div class="login-container">
	    <h3>로그인</h3>
	
	    <c:if test="${not empty error}">
	      <script>
	        alert('${error}');
	      </script>
	    </c:if>
	
	    <form name="login" method="post" action="loginSuccess">
	      <input type="text" name="userId" placeholder="아이디" required>
	      <div class="pw-wrapper">
	        <input type="password" name="userPasswd" id="userPasswd" placeholder="비밀번호" required>
	        <i class="fa-solid fa-eye toggle-password" onclick="togglePw('userPasswd', this)"></i>
	      </div>
	      <input type="submit" value="로그인"><p>
	      <div class="findLink">
	      	<a href="/findIdForm">아이디 찾기</a> | 
	     	<a href="/findPasswordForm">비밀번호 찾기</a>
	     </div>
	    </form>
	  </div>
	
	  <jsp:include page="../footer.jsp"/>
	  <script>
		  function togglePw(id, el) {
		    const input = document.getElementById(id);
		    const isPw = input.type === 'password';
		    input.type = isPw ? 'text' : 'password';
		    el.classList.toggle('fa-eye');
		    el.classList.toggle('fa-eye-slash');
		  }
	</script>
	</body>
</html>