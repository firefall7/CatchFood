<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/css/findUserId.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<h2 class="findTitle">비밀번호 찾기</h2>
	<p class="findDesc">
		가입 시 등록한 아이디를 입력하시면<br>
		비밀번호를 변경할수있도록 도와드립니다.<br>
	</p>
	
	<div class="findContainer">
		<div class="findBox">
			<form name="findId" id="findForm" method="post" action="findUserPassword">
				<input type="text" name="userId"  id="userId"><p>
				<input type="button" onclick="submitWithConfirm()" value="비밀번호 찾기">
			</form>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	
	<script>
		function submitWithConfirm() {
		    const userId = document.getElementById("userId").value;
		    if (userId.trim() == "") {
		        alert("아이디를 입력해주세요.");
		        return false;
		    }
		    // 이건 그냥 form submit
		    document.getElementById("findForm").submit();
		}
		
		window.onload = function () {
		    const userName = "${userName}";
		    if (userName) {
		        if (confirm(userName + " 님이 맞으십니까?")) {
		            window.location.href = "/passwordChange"; // 
		        }
		    }
		
		    const error = "${error}";
		    if (error) {
		        alert(error);
		    }
		}
	</script>
</body>
</html>