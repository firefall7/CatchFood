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
	
	<div>
	    <button onclick="showCategory('korean')">한식</button>
	    <button onclick="showCategory('western')">양식</button>
	    <button onclick="showCategory('chinese')">중식</button>
	    <button onclick="showCategory('japanese')">일식</button>
	</div>
	
	<div id="korean" class="menu-section active">
	    <h3>한식</h3>
	    <c:forEach var="menu" items="${korean}">
	        <table border="1" width="300" style="margin-bottom: 10px;">
	            <tr>
	                <td>${menu.menuName}
	                </td>
	                <td rowspan="4">
	                <img src="${menu.menuImage}" width="100" 
	                     onerror="this.style.display='none'">
	            	</td>
	            </tr>
	            <tr><td>${menu.menuDescription}</td></tr>
	            <tr><td>${menu.menuPrice}원</td></tr>
	            <tr>
	            	<td>     
	            	    <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정/</a>
	        			 <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	        		</td>
	            </tr>
	        </table>
	    </c:forEach>
	</div>
	
	<div id="western" class="menu-section">
	    <h3>양식</h3>
	    <c:forEach var="menu" items="${western}">
	        <table border="1" width="300" style="margin-bottom: 10px;">
	            <tr>
	                <td>${menu.menuName}</td>
	               <td rowspan="4">
	                <img src="${menu.menuImage}" width="100" 
	                     onerror="this.style.display='none'">
	            	</td>
	            </tr>
	            <tr><td>${menu.menuDescription}</td></tr>
	            <tr><td>${menu.menuPrice}원</td></tr>
	            <tr>
	            	<td>     
	            	    <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정/</a>
	        			 <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	        		</td>
	            </tr>
	        </table>
	    </c:forEach>
	</div>
	
	<div id="chinese" class="menu-section">
	    <h3>중식</h3>
	    <c:forEach var="menu" items="${chinese}">
	        <table border="1" width="300" style="margin-bottom: 10px;">
	            <tr>
	                <td>${menu.menuName}</td>
	                <td rowspan="4">
	                <img src="${menu.menuImage}" width="100" 
	                     onerror="this.style.display='none'">
	            	</td>
	            </tr>
	            <tr><td>${menu.menuDescription}</td></tr>
	            <tr><td>${menu.menuPrice}원</td></tr>
	            <tr>
	            	<td>     
	            	    <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정/</a>
	        			 <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	        		</td>
	            </tr>
	        </table>
	    </c:forEach>
	</div>
	
	<div id="japanese" class="menu-section">
	    <h3>일식</h3>
	    <c:forEach var="menu" items="${japanese}">
	        <table border="1" width="300" style="margin-bottom: 10px;">
	            <tr>
	                <td>${menu.menuName}</td>
	                <td rowspan="4">
	                <img src="${menu.menuImage}" width="100" 
	                     onerror="this.style.display='none'">
	            	</td>
	            </tr>
	            <tr><td>${menu.menuDescription}</td></tr>
	            <tr><td>${menu.menuPrice}원</td></tr>
	            <tr>
	            	<td>     
	            	    <a href="/menudetail?menuNum=${menu.menuNum}">메뉴수정/</a>
	        			 <a href="/menudelete?menuNum=${menu.menuNum}">메뉴삭제</a>
	        		</td>
	            </tr>
	        </table>
	    </c:forEach>
	</div>
		<a href="/menuinsert">메뉴 등록</a>
	<jsp:include page="../footer.jsp"/>
</body>
</html>