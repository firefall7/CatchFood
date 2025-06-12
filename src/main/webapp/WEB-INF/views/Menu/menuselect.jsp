<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div>
  <button type="button" onclick="showCategory('korean')">한식</button>
  <button type="button" onclick="showCategory('western')">양식</button>
  <button type="button" onclick="showCategory('chinese')">중식</button>
  <button type="button" onclick="showCategory('japanese')">일식</button>
</div>

<style>
  .menu-category { display: none; }
  .menu-category.active { display: block; }
</style>

<script>
  function showCategory(categoryId) {
    document.querySelectorAll('.menu-category').forEach(el => el.classList.remove('active'));
    document.getElementById(categoryId).classList.add('active');
  }
  window.onload = () => showCategory('korean');
</script> 
	
<%-- 한식 --%>
<div id="korean" class="menu-category">
  <h3>한식</h3>
  <c:forEach var="menu" items="${korean}">
    <table border="1" width="300" style="margin-bottom: 10px;">
      <tr>
        <td>
          <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
          ${menu.menuName}
        </td>
        <td rowspan="4">
          <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
        </td>
      </tr>
      <tr><td>${menu.menuDescription}</td></tr>
      <tr><td>${menu.menuPrice}원</td></tr>
      <tr>
        <td>
          수량: <input type="number" name="count_${menu.menuNum}" min="1" value="1">
        </td>
      </tr>
    </table>
  </c:forEach>
</div>

<%-- 양식 --%>
<div id="western" class="menu-category">
  <h3>양식</h3>
  <c:forEach var="menu" items="${western}">
    <table border="1" width="300" style="margin-bottom: 10px;">
      <tr>
        <td>
          <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
          ${menu.menuName}
        </td>
        <td rowspan="4">
          <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
        </td>
      </tr>
      <tr><td>${menu.menuDescription}</td></tr>
      <tr><td>${menu.menuPrice}원</td></tr>
      <tr>
        <td>
          수량: <input type="number" name="count_${menu.menuNum}" min="1" value="1">
        </td>
      </tr>
    </table>
  </c:forEach>
</div>

<%-- 중식 --%>
<div id="chinese" class="menu-category">
  <h3>중식</h3>
  <c:forEach var="menu" items="${chinese}">
    <table border="1" width="300" style="margin-bottom: 10px;">
      <tr>
        <td>
          <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
          ${menu.menuName}
        </td>
        <td rowspan="4">
          <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
        </td>
      </tr>
      <tr><td>${menu.menuDescription}</td></tr>
      <tr><td>${menu.menuPrice}원</td></tr>
      <tr>
        <td>
          수량: <input type="number" name="count_${menu.menuNum}" min="1" value="1">
        </td>
      </tr>
    </table>
  </c:forEach>
</div>

<%-- 일식 --%>
<div id="japanese" class="menu-category">
  <h3>일식</h3>
  <c:forEach var="menu" items="${japanese}">
    <table border="1" width="300" style="margin-bottom: 10px;">
      <tr>
        <td>
          <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
          ${menu.menuName}
        </td>
        <td rowspan="4">
          <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
        </td>
      </tr>
      <tr><td>${menu.menuDescription}</td></tr>
      <tr><td>${menu.menuPrice}원</td></tr>
      <tr>
        <td>
          수량: <input type="number" name="count_${menu.menuNum}" min="1" value="1">
        </td>
      </tr>
    </table>
  </c:forEach>
</div>