<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="/JS/passwordCheck.js"></script>
<link rel="stylesheet" href="/css/pwChange.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>

	<div class="pwChange-wrapper">
		<h2>비밀번호 변경</h2>
		<p class="pwChange-sub">새로운 비밀번호를 입력한 뒤 변경하기 버튼을 눌러주세요.</p>

		<div class="pwChange-box">
			<form name="passwordForm" method="post" action="informationChange">
				<label for="newPassword">새 비밀번호</label>
				<div class="pw-input-wrapper">
					<input type="password" id="newPassword" name="newPassword" placeholder="8~12자, 영문/숫자/특수문자 포함" required />
					<i class="fa fa-eye" onclick="togglePw('newPassword', this)"></i>
				</div>

				<label for="newPasswordCheck">비밀번호 확인</label>
				<div class="pw-input-wrapper">
					<input type="password" id="newPasswordCheck" name="newPasswordCheck" placeholder="동일하게 입력해주세요." required />
					<i class="fa fa-eye" onclick="togglePw('newPasswordCheck', this)"></i>
				</div>

				<input type="button" value="변경하기" onclick="passwordCheck()">
			</form>
		</div>
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
