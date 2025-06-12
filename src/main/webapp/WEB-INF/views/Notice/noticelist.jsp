<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="/css/notice.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<jsp:include page="../top.jsp"/>

<h2>공지사항</h2>
	<div class="notice-wrapper">
		<c:if test="${sessionScope.role eq 'admin'}">
		    <div class="notice-header">
		        <a href="/noticeinsert">
		            <button class="write-btn">공지사항 작성</button>
		        </a>
		    </div>
		</c:if> 

	
	    <table class="notice-table">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>제목</th>
	                <th>유형</th>
	                <th>작성일</th>
	                <th>조회수</th>
	                <th>고정</th>
	            </tr>
	        </thead>
	        <tbody>
	        <c:forEach var="notice" items="${noticeList}" varStatus="status">
	            <tr>
	                <td>${totalCount - ((currentPage - 1) * pageSize) - status.index}</td>
	                <td>
	                    <a href="/noticedetail?noticeNum=${notice.noticeNum}">
	                        ${notice.noticeTitle}
	                    </a>
	                </td>
	                <td>${notice.noticeType}</td>
	                <td>${notice.noticeDate.toString().substring(0,10)}</td>
	                <td>${notice.noticeViewCount}</td>
	            <td style="text-align: center;">
	                <c:choose>
	                    <c:when test="${notice.noticePinned == 1}">
	                       <i class="fas fa-thumbtack" style="color: red; transform: rotate(30deg);"></i>
	                    </c:when>
	                    <c:otherwise>-</c:otherwise>
	                </c:choose>
	            </td>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
	
	    <div class="pagination">
	        <c:forEach var="i" begin="1" end="${(totalCount / pageSize) + (totalCount % pageSize == 0 ? 0 : 1)}">
	            <c:choose>
	                <c:when test="${i == currentPage}">
	                    <span class="current-page">[${i}]</span>
	                </c:when>
	                <c:otherwise>
	                    <a href="/noticelist?page=${i}">[${i}]</a>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	    </div>
	</div>
	
	<jsp:include page="../footer.jsp"/>
	</body>
	</html>