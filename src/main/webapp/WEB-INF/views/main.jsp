<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<jsp:include page="top.jsp"/>
	
		<div class="content">
	    <div class="main-wrapper">
	      <div class="maincontent">
	        <h2>오늘 뭐 먹지?</h2>
	        <p>다양한 음식은 CaTch Food</p>
	      </div>
	    </div>
		<div class="main-banner-slider">
		  <div class="banner-slide active">
		    <img src="/images/banner0121.png" alt="배너1">
		  </div>
		  <div class="banner-slide">
		    	<img src="/images/banner2.png" alt="배너2">
		  </div>
		  <div class="banner-pagination" id="banner-pagination"></div>
		</div>
	    <%@ include file="Menu/recommendmenu.jsp" %>
	  </div>

  <jsp:include page="footer.jsp"/>
	<script>
	  document.addEventListener("DOMContentLoaded", function () {
	    let currentSlide = 0;
	    const slides = document.querySelectorAll('.banner-slide');
	    //const pagination = document.getElementById('banner-pagination');
	
	    function showSlide(index) {
	      slides.forEach((slide, i) => {
	        slide.classList.remove('active');
	        if (i === index) slide.classList.add('active');
	      });
	      //pagination.textContent = `${index + 1} / ${slides.length}`;
	    }
	
	    function nextSlide() {
	      currentSlide = (currentSlide + 1) % slides.length;
	      showSlide(currentSlide);
	    }
	
	    showSlide(currentSlide);
	    setInterval(nextSlide, 4000); // 4초마다 전환
	  });
	</script>
</body>
</html>