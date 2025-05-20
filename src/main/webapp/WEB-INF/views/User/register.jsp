<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="/JS/check.js"></script>
    <link rel="stylesheet" href="/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<div class="register-container">
    <h2>회원가입</h2>
    
    <form name="register" method="post" action="registerProcess">
        <label>ID</label>
          <div class="id-row">
            <input type="text" id="userId" name="userId" required>
            <button type="button" onclick="checkUserId()" class="check-btn">중복 확인</button>
          </div>
          <p id="idCheckResult" style="margin-top: -10px; margin-bottom: 16px; font-size: 13px;"></p>
         
         <label>비밀번호</label>
	        <div class="pw-wrapper">
	            <input type="password" name="userPasswd" id="userPasswd" placeholder="비밀번호는 8~12자, 영문자/숫자/특수문자를 각각 1개 이상 포함" required>
	            <i class="fa-solid fa-eye toggle-password" onclick="togglePw('userPasswd', this)"></i>
	        </div>

        <label>비밀번호 확인</label>
	        <div class="pw-wrapper">
	            <input type="password" name="userPasswd2" id="userPasswd2" placeholder="비밀번호는 8~12자, 영문자/숫자/특수문자를 각각 1개 이상 포함" required>
	            <i class="fa-solid fa-eye toggle-password" onclick="togglePw('userPasswd2', this)"></i>
	        </div>

        <label>이메일</label>
       <div class="address-row">
	    <input type="text" name="userEmail" required style="flex: 2;">
	    <div class="at-symbol">@</div>
	    <select name="email" style="flex: 1;">
	        <option value="naver.com">naver.com</option>
	        <option value="daum.net">daum.net</option>
	        <option value="nate.com">nate.com</option>
	        <option value="gmail.com">gmail.com</option>
	    </select>
	</div>
        <label>이름</label>
        <input type="text" name="userName" required>

        <label>생년월일</label>
        <input type="date" name="userBirth" placeholder="생년월일 8자리" maxlength="8" required >

        <div style="margin-bottom: 16px;">
	    <label>성별</label>
	    <input type="radio" name="userGender" value="남성" required>남성
	    <input type="radio" name="userGender" value="여성" required>여성
		</div>

        <label>전화번호</label>
        <input type="text" name="userPhone" maxlength="11" placeholder="입력시 - 생략하고 11자리 입력" required>

        <label>주소</label>
        <div class="address-row">
            <input type="text" name="userAddress" id="userAddress" readonly style="flex: 2;">
            <input type="button" value="주소검색" onclick="goPopup();" style="flex: 1;">
        </div>

        <label>상세주소</label>
        <input type="text" name="userAddrdetail">

        <input type="button" value="회원가입" class="btn-block" onclick="check()">
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
  
  function checkUserId() {
      const userId = document.getElementById("userId").value;
      if (!userId) {
          alert("아이디를 입력하세요");
          return;
      }
      fetch(`/checkUserId?userId=` + encodeURIComponent(userId))
          .then(response => response.text())
          .then(result => {
              const resultTag = document.getElementById("idCheckResult");
              if (result === "available") {
                  resultTag.textContent = "사용 가능한 아이디입니다.";
                  resultTag.style.color = "green";
              } else {
                  resultTag.textContent = "이미 사용 중인 아이디입니다.";
                  resultTag.style.color = "red";
              }
          });
  }
</script>
</body>
</html>