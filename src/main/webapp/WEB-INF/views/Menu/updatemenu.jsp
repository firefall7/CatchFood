<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴 수정</title>
</head>
	<body>
	    <jsp:include page="../top.jsp"/>
	    <link rel="stylesheet" href="/css/menuupdate.css">
		 <h2>메뉴 수정</h2>
		
		<div class="form-container">
		    <form method="post" action="menuupdate" enctype="multipart/form-data">
		        <input type="hidden" name="menuNum" value="${menuDetail.menuNum}">
		        <input type="hidden" name="categoryNum" value="${menuDetail.categoryNum}">
		
		        <div class="recommend-box">
		            <label>
		                <input type="checkbox" name="menuRecommend" value="1"
		                       <c:if test="${menuDetail.menuRecommend == 1}">checked="checked"</c:if>> 추천메뉴 여부
		            </label> 
		        </div>
		
		        <div class="form-group">
		            <label>메뉴 이름</label>
		            <input type="text" name="menuName" value="${menuDetail.menuName}" required>
		        </div>
		
		        <div class="form-group">
		            <label>메뉴 설명</label>
		            <input type="text" name="menuDescription" value="${menuDetail.menuDescription}" required>
		        </div>
		
		        <div class="form-group">
		            <label>가격</label>
		            <input type="number" name="menuPrice" value="${menuDetail.menuPrice}" required>
		        </div>
		
		        <div class="form-group">
		            <label>현재 이미지</label>
		            <div class="image-preview">
		                <img src="${menuDetail.menuImage}" width="150" alt="현재 이미지"><br>
		                <label>이미지 변경:
		                    <input type="file" name="menuImagePath">
		                </label>
		            </div>
		        </div>
		
		        <div class="form-buttons">
		            <input type="submit" value="메뉴수정" class="btn-update">
		            <input type="button" value="수정취소" class="btn-cancel" onclick="history.back()">
		        </div>
		    </form>
		</div>
	
		<jsp:include page="../footer.jsp"/>
	</body>
</html>