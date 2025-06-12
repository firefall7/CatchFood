<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>CatchFood 메인</title>
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
   	<link rel="stylesheet" href="/css/main.css">
</head>
<body>
	<!-- 비밀번호변경 알림창 -->
	<c:if test="${not empty message}">
	  <script>
	    alert("${message}");
	  </script>
	</c:if>
	
	<c:if test="${not empty error}">
	  <script>
	    alert("${error}");
	  </script> 
	</c:if>

	
	<div id="entry-overlay">
		<img src="/images/logo 접시만.png" alt="CatchFood Logo" class="entry-image">
	  <div class="entry-logo">CaTchFood</div>
	  <p class="entry-sub">다양한 음식을 즐기는 곳</p>
	</div>
	<jsp:include page="top.jsp"/>
		
		<div class="content">	
		<div class="main-banner-slider">
		  <div class="banner-slide active">
		    <img src="/images/banner1.png" alt="배너1" style="display: block;">
		  </div>
		  <div class="banner-slide">
		    	<img src="/images/1.png" alt="배너2" style="display: block;">
		  </div>
		  <div class="banner-pagination" id="banner-pagination"></div>
		</div>
		
	    <%@ include file="Menu/recommendmenu.jsp" %>
	    
	    
		
	    <div class="notice-preview-wrapper">
		    <h3>📢 공지사항</h3>
			    <ul style="list-style: none; padding-left: 0;">
			    <c:forEach var="notice" items="${mainNotices}">
			        <li style="display: flex; justify-content: space-between; align-items: center; padding: 5px 0;">
			            <a href="/noticedetail?noticeNum=${notice.noticeNum}" style="color: royalblue; text-decoration: none;">
			                ${notice.noticeTitle}
			            </a>
			            <span style="font-size: 12px; color: gray;">
			                (${notice.noticeDate.toString().substring(0,10)})
			            </span>
			        </li>
			    </c:forEach>
			</ul>
		</div>
	  </div>

  <jsp:include page="footer.jsp"/>
	 <c:url var="popupUrl" value="/event" />
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    let currentSlide = 0;
	    const slides = document.querySelectorAll('.banner-slide');
	
	    function showSlide(index) {
	      slides.forEach((slide, i) => {
	        slide.classList.remove('active');
	        if (i === index) slide.classList.add('active');
	      });
	    }
	
	    function nextSlide() {
	      currentSlide = (currentSlide + 1) % slides.length;
	      showSlide(currentSlide);
	    }
	
	    showSlide(currentSlide);
	    setInterval(nextSlide, 4000); // 배너 자동 전환
	
	    // 팝업 로직: 인트로 끝나고 실행
	    setTimeout(() => {
	      const overlay = document.getElementById('entry-overlay');
	      if (overlay) overlay.style.display = 'none';
	
	      const popupUntil = localStorage.getItem('bossEventPopupUntil');
	      const now = new Date().getTime();
	      const popupUrl = "<c:url value='/event' />"; // 또는 "/event"
	
	      if (!popupUntil || now > popupUntil) {
	        const newWindow = window.open(
	          popupUrl,
	          'bossEventPopup',
	          'width=510,height=345,left=0,top=0'
	        );
	
	        if (!newWindow || newWindow.closed || typeof newWindow.closed === 'undefined') {
	          alert("팝업이 차단되었습니다. 브라우저 설정에서 허용해주세요.");
	        }
	      }
	    }, 2500); // 인트로 후 2.5초 뒤
	  });
	</script>
</body>
</html>