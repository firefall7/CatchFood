<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form name="findId" id="findForm" method="post" action="findUserPassword">
		아이디 : <input type="text" name="userId"  id="userId"><p>
		<input type="button" onclick="submitWithConfirm()" value="비밀번호 찾기">
	</form>
	
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