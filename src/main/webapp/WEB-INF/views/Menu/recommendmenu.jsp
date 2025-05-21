<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    	<link rel="stylesheet" href="/css/recommendmenu.css">
<h2 style="text-align:center;">사장님 추천메뉴 ⭐</h2>
<div class="container">

  <c:forEach var="menu" items="${rec}" varStatus="status">
    <c:if test="${status.index < 3}">
      <div class="menu-card">
        <img src="${menu.menuImage}" alt="${menu.menuName}">
        <h3>${menu.menuName}</h3>
        <p>${menu.menuPrice}원</p>
        <p>${menu.menuDescription}</p>
      </div>
    </c:if>
  </c:forEach>
</div>

