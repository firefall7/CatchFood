<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="/css/noticeupdate.css">
</head>
	<body>
	<jsp:include page="../top.jsp"/>
	
	<h2 class="page-title">공지사항 수정</h2>
	
	<div class="form-container">
	    <form method="post" action="/noticeupdateok">
	        <input type="hidden" name="noticeNum" value="${notice.noticeNum}">
	        <input type="hidden" name="noticeActive" value="1" />
	
	        <div class="form-group">
	            <label>제목</label>
	            <input type="text" name="noticeTitle" value="${notice.noticeTitle}" required>
	        </div>
	
	        <div class="form-group row-group">
	            <div class="row-item">
	                <label>공지 유형</label>
	                <select name="noticeType" required>
	                    <option value="긴급" <c:if test="${notice.noticeType eq '긴급'}">selected</c:if>>긴급</option>
	                    <option value="상시" <c:if test="${notice.noticeType eq '상시'}">selected</c:if>>상시</option>
	                    <option value="일반" <c:if test="${notice.noticeType eq '일반'}">selected</c:if>>일반</option>
	                    <option value="이벤트" <c:if test="${notice.noticeType eq '이벤트'}">selected</c:if>>이벤트</option>
	                </select>
	            </div>
	            <div class="row-item checkbox-item">
	                <label>상단 고정</label>
	                <input type="checkbox" name="noticePinned" value="1" <c:if test="${notice.noticePinned == 1}">checked</c:if>>
	            </div>
	        </div>
	
	        <div class="form-group">
	            <label>내용</label>
	            <textarea name="noticeContent" rows="10" required>${notice.noticeContent}</textarea>
	        </div>
	
	        <div class="btn-group">
	            <button type="submit" class="btn-submit">수정 완료</button>
	        </div>
	    </form>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	</body>
</html>