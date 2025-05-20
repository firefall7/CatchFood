<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../top.jsp"/>
<form method="post" action="/noticeupdate">
    <input type="hidden" name="noticeNum" value="${notice.noticeNum}">
    <table border="1" width="800" cellpadding="10" align="center">
        <tr>
            <th>제목</th>
            <td><input type="text" name="noticeTitle" value="${notice.noticeTitle}" required style="width: 100%;"></td>
            <th>유형</th>
            <td>
                <select name="noticeType">
                   <option value="긴급"
				   		 <c:if test="${notice.noticeType eq '긴급'}">selected</c:if>>긴급</option>
				   <option value="상시"
				    	<c:if test="${notice.noticeType eq '상시'}">selected</c:if>>상시</option>
				   <option value="일반"
				   	 <c:if test="${notice.noticeType eq '일반'}">selected</c:if>>일반</option>
				   <option value="이벤트"
  					  <c:if test="${notice.noticeType eq '이벤트'}">selected</c:if>>이벤트</option>
                </select>
            </td>
            <th>상단 고정</th>
            <td>
                <input type="checkbox" name="noticePinned" value="true"
                    <c:if test="${notice.noticePinned == 1}">checked</c:if>>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5">
                <textarea name="noticeContent" rows="12" style="width: 100%;" required>${notice.noticeContent}</textarea>
            </td>
        </tr>
    </table>
    <br>
    <div style="text-align:center;">
        <input type="hidden" name="noticeActive" value="true" />
        <button type="submit">수정 완료</button>
    </div>
</form>
 <jsp:include page="../footer.jsp"/>
</body>
</html>