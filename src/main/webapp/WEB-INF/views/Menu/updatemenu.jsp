<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴 수정</title>
</head>
<body>
    <h3>메뉴 수정</h3>
    <jsp:include page="../top.jsp"/>
    
    <form name="detail" id="detail" method="post" action="menuupdate" enctype="multipart/form-data">
        <input type="hidden" name="menuNum" value="${menuDetail.menuNum}">
        <input type="hidden" name="categoryNum" value="${menuDetail.categoryNum}">

        <table border="1" width="300" style="margin-bottom: 10px;">
			<tr>
			  <td colspan="2">
			<label>
			  <input type="checkbox" name="menuRecommend" value="1"
			         <c:if test="${menuDetail.menuRecommend == 1}">checked="checked"</c:if> > 추천메뉴 여부
			</label>
			  </td>
			</tr>
            <tr>
                <td>
                    <input type="text" name="menuName" value="${menuDetail.menuName}" required>
                </td>

				  <td colspan="2" rowspan="3" style="text-align: center;">
				    <img src="${menuDetail.menuImage}" width="100" alt="현재 이미지"><br>
				    <label>이미지 변경:
				      <input type="file" name="menuImagePath">
				    </label>
				  </td>
				</tr>
            <tr>
                <td>
                    <input type="text" name="menuDescription" value="${menuDetail.menuDescription}" required>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="number" name="menuPrice" value="${menuDetail.menuPrice}" required>
                </td>
            </tr>
        </table>

        <input type="submit" value="메뉴수정">
        <input type="button" value="수정취소" onClick="history.back()">
    </form>
    <jsp:include page="../footer.jsp"/>
</body>
</html>
