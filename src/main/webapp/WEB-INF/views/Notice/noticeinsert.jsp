<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
</head>
<body>
<jsp:include page="../top.jsp"/>
<h2>공지사항 작성</h2>

<form method="post" action="noticewrite">
    <table border="1" width="500">
        <tr>
            <th>제목</th>
            <td>
                <input type="text" name="noticeTitle" required style="width: 95%;">
            </td>
            <th>공지 유형</th>
            <td>
                <select name="noticeType" required>
                    <option value="긴급">긴급</option>
                    <option value="상시">상시</option>
                    <option value="일반">일반</option>
                    <option value="이벤트">이벤트</option>
                </select>
            </td>
            <th>상단 고정</th>
            <td>
                <input type="checkbox" name="noticePinned" value="1">
            </td>
        </tr>

        <tr>
            <th>내용</th>
            <td colspan="5">
                <textarea name="noticeContent" rows="12" cols="100" required></textarea>
            </td>
        </tr>
    </table>

    <br>
    <div>
  	  <input type="hidden" name="noticeAdminId" value="admin01">
        <input type="hidden" name="noticeActive" value="1">
        <input type="submit" value="작성 완료">
    </div>
</form>
<jsp:include page="../footer.jsp"/>
</body>
</html>