<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="/css/noticedetail.css">
</head>
<body>
<jsp:include page="../top.jsp"/>

<h2 class="notice-title">공지사항</h2>

<div class="notice-detail-container">
    <table class="notice-detail-table">
        <tr>
            <th>제목</th>
            <td colspan="5">${notice.noticeTitle}</td>
        </tr>
        <tr>
            <th>공지 유형</th>
            <td>${notice.noticeType}</td>
            <th>작성일</th>
            <td>${notice.noticeDate.toString().substring(0,10)}</td>
            <th>조회수</th>
            <td>${notice.noticeViewCount}</td>
        </tr>
     <c:if test="${sessionScope.role eq 'admin'}">
	    <tr>
	        <th>상단 고정</th>
	        <td colspan="5">
	            <c:choose>
	                <c:when test="${notice.noticePinned == 1}">✅ 고정</c:when>
	                <c:otherwise>❌ 비고정</c:otherwise>
	            </c:choose>
	        </td>
	    </tr>
	</c:if>
        <tr>
            <th>내용</th>
            <td colspan="5" class="notice-content">${notice.noticeContent}</td>
        </tr>
    </table>

    <div class="notice-btns">
    	<c:if test="${sessionScope.role eq 'admin'}">
	        <a href="/noticeupdate?noticeNum=${notice.noticeNum}">
	            <button class="btn-primary">수정</button>
	        </a>
	        <a href="/noticedelete?noticeNum=${notice.noticeNum}" onclick="return confirm('정말 삭제할까요?');">
	            <button class="btn-danger">삭제</button>
	        </a>
        </c:if>
        <a href="/noticelist">
            <button class="btn-default">목록으로</button>
        </a>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>