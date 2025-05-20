<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<form name="menu" action="menuwrite" method="post" enctype="multipart/form-data">
	<h2>메뉴 등록 페이지</h2>
		<table board="1" width="500">
		
		<input type="hidden" name="menuCount" value="0">
		<input type="hidden" name="menuPTotal" value="0">
			<tr>
				<td colspan="2">
					<input type="checkbox" name="menuRecommend" value="1">메뉴추천여부
				</td>
			</tr>
			<tr>
				<td><input type="text" name="menuName" placeholder="메뉴명" required></td>
				<td>
					<select name="categoryNum" required>
						<option value="1">한식</option>
						<option value="2">양식</option>
						<option value="3">중식</option>
						<option value="4">일식</option>
					</select>
			</td>
			</tr>
			<tr>
			<td><input type="text" name="menuDescription" placeholder="메뉴 설명" required></td>
			<td rowspan="2"><input type="file" name="menuImagePath" accept="image/*" required></td>
			</tr>
			
			<tr>
			<td><input type="number" name="menuPrice" placeholder="메뉴 가격" required></td>
			</tr>
			
		</table>
		<input type="submit" value="메뉴 등록">
	</form>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>