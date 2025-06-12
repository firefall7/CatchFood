<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 리스트</title>
    <link rel="stylesheet" href="/css/review.css">
    <style>
		.slide-img { display: none; }
		.slide-img.active { display: block; }
	</style>
</head> 
	<body>
	
			<jsp:include page="../top.jsp"/>
			<div class="review-header-top">
			   <h2 class="review-title">리뷰 리스트</h2>
			   <p class="subtitle">CatchFood 이용자들의 생생한 후기!</p>
				   <form action="/insert" method="get">
				        <input type="submit" value="리뷰작성하기" class="write-btn">
	  			   </form>
			</div>
			<c:if test="${empty review}">
			 	 <p class="no-review">아직 등록된 리뷰가 없어요. 첫 리뷰를 남겨주세요 😊</p>
			</c:if>
	
		<div class="review-wrapper">
		    <c:forEach var="dto" items="${review}" varStatus="status">
		        <div class="review-card">
		            <div class="review-header">
		                <span>No. ${totalCount - ((currentPage - 1) * 10 + status.index)}</span>
		                <span>👤${dto.userId}님</span>
		                <span class="review-stars">
		                    <c:forEach var="i" begin="1" end="${dto.reviewStars}">★</c:forEach>
		                </span>
		            </div>
		
					<div class="review-images">
					    <div class="slider">
					        <c:forTokens items="${dto.reviewImage}" delims="," var="img" varStatus="loop">
					            <img src="${img}" class="slide-img ${loop.index == 0 ? 'active' : ''}" />
					        </c:forTokens>
					        <c:if test="${fn:length(fn:split(dto.reviewImage, ',')) > 1}">
					            <button type="button" class="slide-btn prev" data-dir="-1">❮</button>
					            <button type="button" class="slide-btn next" data-dir="1">❯</button>
					        </c:if>
					    </div>
					</div>
		
		            <div class="review-content">
		                ${dto.reviewContent}
		            </div>
		
		            <div class="review-footer">
		                <span>${fn:substring(dto.reviewDay.toString(), 0, 10)}</span>
		                <c:if test="${sessionScope.role eq 'admin'}">
   						 <a href="/reviewdelete?reviewNum=${dto.reviewNum}" class="review-delete">리뷰 삭제</a>
						</c:if>
		            </div>
		        </div>
		  	  </c:forEach>
			</div>
		<div class="pagination">
	        <c:set var="pageSize" value="10" />
			<c:set var="pageCount" value="${pageSize != 0 ? (totalCount / pageSize) + (totalCount % pageSize == 0 ? 0 : 1) : 1}" />
			<c:forEach var="i" begin="1" end="${pageCount}">
	            <c:choose>
	                <c:when test="${i == currentPage}">
	                    <span class="current-page">[${i}]</span>
	                </c:when>
	                <c:otherwise>
	                    <a href="/review?page=${i}">[${i}]</a>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	    </div>
	</div>
		<jsp:include page="../footer.jsp"/>
		
		<script>
			document.addEventListener("DOMContentLoaded", () => {
			    document.querySelectorAll('.slide-btn').forEach(button => {
			        button.addEventListener('click', function () {
			            const direction = parseInt(this.dataset.dir);
			            const slider = this.closest('.slider');
			            const slides = slider.querySelectorAll('.slide-img');
			
			            let currentIndex = Array.from(slides).findIndex(img => img.classList.contains('active'));
			
			            slides[currentIndex].classList.remove('active');
			
			            let newIndex = (currentIndex + direction + slides.length) % slides.length;
			            slides[newIndex].classList.add('active');
			        });
			    });
			});
		</script>
		
	</body>
</html>