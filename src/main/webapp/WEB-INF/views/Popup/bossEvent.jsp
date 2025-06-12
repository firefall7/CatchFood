<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>사장님을 찾아라!</title>
	<link rel="stylesheet" href="/css/event.css">
</head>
	<body>
	  <div class="container">
	    <h3 class="blinker">지금 사장님을 찾으면 서비스가 쏟아진다!</h3>
	    <img src="/images/1.png" alt="사장님 이벤트" width="500">
	    <br><br>
	    <label><input type="checkbox" id="dontShowToday"> 오늘 하루 이 창 다시 열지 않기</label>
	    <br>
	    <button class="close-btn" onclick="closePopup()">닫기</button>
	  </div> 
	
	  <script>
	    function closePopup() {
	      if (document.getElementById('dontShowToday').checked) {
	        const now = new Date();
	        const tomorrow = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);
	        localStorage.setItem('bossEventPopupUntil', tomorrow.getTime());
	      }
	      window.close();
	    }
	  </script>
	</body>
</html>
