<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>메뉴 리스트</title>
<style>
	.menu-section { display: none; }
	.menu-section.active { display: block; }
</style>
<link rel="stylesheet" href="/css/menu.css">
<script>
	function showCategory(categoryId) {
	const sections = document.querySelectorAll('.menu-section');
	sections.forEach(sec => sec.classList.remove('active'));
	document.getElementById(categoryId).classList.add('active');
    }
</script>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	<link rel="stylesheet" href="/css/menu.css">
	<div class="category-buttons">
	    <button onclick="showCategory('korean')">한식</button>
	    <button onclick="showCategory('western')">양식</button>
	    <button onclick="showCategory('chinese')">중식</button>
	    <button onclick="showCategory('japanese')">일식</button>
	</div>

	<!-- 한식 -->
	<div id="korean" class="menu-section active">
	    <h3>한식</h3>
	    <div class="menu-container">
	        <c:forEach var="menu" items="${korean}">
	            <div class="menu-card">
	                <img src="${menu.menuImage}" alt="${menu.menuName}" onerror="this.style.display='none'">
	                <div class="menu-info">
	                    <h4>${menu.menuName}</h4>
	                    <p class="desc">${menu.menuDescription}</p>
	                    <p class="price">${menu.menuPrice}원</p>
	                    <c:if test="${sessionScope.role eq 'admin'}">
	                        <div class="menu-actions">
	                            <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정</a>/ 
	                            <a href="/menudelete?menuNum=${menu.menuNum}"> 메뉴삭제</a>
	                        </div>
	                    </c:if>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

	<!-- 양식 -->
	<div id="western" class="menu-section">
	    <h3>양식</h3>
	    <div class="menu-container">
	        <c:forEach var="menu" items="${western}">
	            <div class="menu-card">
	                <img src="${menu.menuImage}" alt="${menu.menuName}" onerror="this.style.display='none'">
	                <div class="menu-info">
	                    <h4>${menu.menuName}</h4>
	                    <p class="desc">${menu.menuDescription}</p>
	                    <p class="price">${menu.menuPrice}원</p>
	                    <c:if test="${sessionScope.role eq 'admin'}">
	                        <div class="menu-actions">
	                            <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정</a> /
	                            <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	                        </div>
	                    </c:if>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

	<!-- 중식 -->
	<div id="chinese" class="menu-section">
	    <h3>중식</h3>
	    <div class="menu-container">
	        <c:forEach var="menu" items="${chinese}">
	            <div class="menu-card">
	                <img src="${menu.menuImage}" alt="${menu.menuName}" onerror="this.style.display='none'">
	                <div class="menu-info">
	                    <h4>${menu.menuName}</h4>
	                    <p class="desc">${menu.menuDescription}</p>
	                    <p class="price">${menu.menuPrice}원</p>
	                    <c:if test="${sessionScope.role eq 'admin'}">
	                        <div class="menu-actions">
	                            <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정</a> /
	                            <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	                        </div>
	                    </c:if>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

	<!-- 일식 -->
	<div id="japanese" class="menu-section">
	    <h3>일식</h3>
	    <div class="menu-container">
	        <c:forEach var="menu" items="${japanese}">
	            <div class="menu-card">
	                <img src="${menu.menuImage}" alt="${menu.menuName}" onerror="this.style.display='none'">
	                <div class="menu-info">
	                    <h4>${menu.menuName}</h4>
	                    <p class="desc">${menu.menuDescription}</p>
	                    <p class="price">${menu.menuPrice}원</p>
	                    <c:if test="${sessionScope.role eq 'admin'}">
	                        <div class="menu-actions">
	                            <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정</a> /
	                            <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	                        </div>
	                    </c:if>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>