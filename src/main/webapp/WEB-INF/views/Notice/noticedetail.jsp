<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세</title>
</head>
<body>
<jsp:include page="../top.jsp"/>
<h2>공지사항</h2>

<table border="1" width="800" cellpadding="10" align="center">
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
    <tr>
        <th>상단 고정</th>
        <td colspan="5">
            <c:choose>
                <c:when test="${notice.noticePinned == 1}">✅ 고정</c:when>
                <c:otherwise>❌ 비고정</c:otherwise>
            </c:choose>
        </td>
    </tr>
    <tr>
        <th>내용</th>
        <td colspan="5" style="height: 200px;">${notice.noticeContent}</td>
    </tr>
</table>
<br>
	<div style="text-align:center; margin-top: 20px;">
    	<a href="/noticeupdate?noticeNum=${notice.noticeNum}">
       		<button>수정</button>
    	</a>
	    <a href="/noticedelete?noticeNum=${notice.noticeNum}" onclick="return confirm('정말 삭제할까요?');">
	       	<button>삭제</button>
	    </a>
   		 <a href="/noticelist"><button>목록으로</button></a>
	</div>
 <jsp:include page="../footer.jsp"/>
</body>
</html>