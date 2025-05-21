<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성페이지</title>
</head>
<link rel="stylesheet" href="/css/reviewinsert.css">
<body>
	<jsp:include page="../top.jsp"/>

	<h2>리뷰작성페이지</h2>
	<form name="review" method="post" action="writer" enctype="multipart/form-data">
		<table border="1" width="500">
		<input type="hidden" name="userNum" value="${sessionScope.loginUser.userNum}">
			<tr>
				<td>
					<select name="reviewStars">
						<option value="1">⭐️</option>
						<option value="2">⭐️⭐️</option>
						<option value="3">⭐️⭐️⭐️</option>
						<option value="4">⭐️⭐️⭐️⭐️</option>
						<option value="5" selected>⭐️⭐️⭐️⭐️⭐️</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="file" name="imageFile" multiple >
				</td>
			</tr>
			<tr>
				<td>
					<textarea cols="50" rows="5" name="reviewContent" placeholder="리뷰를 작성해주세요"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성">
				</td>
			</tr>
		</table>
	</form>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>