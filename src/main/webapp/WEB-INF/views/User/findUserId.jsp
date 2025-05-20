<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/findUserId.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<h2 class="findTitle">아이디 찾기</h2>
	<p class="findDesc">
		가입 시 등록한 이메일 주소를 입력하시면<br>
		가입하신 아이디를 알려드립니다.
	</p>
	
	<div class="findContainer">
		<div class="findBox">
			<form name="findId" method="post" action="findUserId">
				<input type="text" id="userEmail" name="userEmail" placeholder="이메일 주소 입력 (예: guest@naver.com)"><p>
				<input type="button" onclick="findIdResult()" value="아이디 찾기">
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
	<script> 
	function findIdResult() {
	    const userEmail = document.getElementById("userEmail").value;
	
	    if (!userEmail.trim()) {
	        alert("이메일을 입력해주세요.");
	        return false;
	    }
	
	    const url = "findUserId?userEmail=" + encodeURIComponent(userEmail);
	    window.open(url, "", "width=300,height=150,top=0,left=0");
	}
</script>
</body>
</html>