<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 + 시간대 선택</title>
	<!-- flatpickr CDN -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<link rel="stylesheet" href="/css/reservation.css">
</head>
<body>
	<jsp:include page="../top.jsp"/>
	
	<div class="reservationHeader">
		<h1>CatchFood 예약</h1>
		<h3><i><u>예약 확정 후에는 변경이 불가합니다.</u></i></h3>
	</div>
	<form name="reservation" method="post" action="reservationTemp" onsubmit="updateMenuHiddenFields()">
		<h3>예약 날짜 선택</h3>
		<input type="text" id="datePicker" placeholder="날짜 선택">
		<input type="hidden" id="reservationDate" name="reservationDate">
		<input type="hidden" id="reservationNumber" name="reservationNumber">
		<input type="hidden" id="menuNames" name="menuNames">
		<input type="hidden" id="menuPrices" name="menuPrices">
		<input type="hidden" id="totalPrice" name="totalPrice">
		
		<hr>
		<h3><시간 선택></h3>
		<div id="timeButtons">
			<button type="button" class="time-slot" value="10:00">10:00</button>
		    <button type="button" class="time-slot" value="11:00">11:00</button>
		    <button type="button" class="time-slot" value="12:00">12:00</button>
		    <button type="button" class="time-slot" value="13:00">13:00</button>
		    <button type="button" class="time-slot" value="14:00">14:00</button>
		    <br>브레이크 타임 15:00-17:00<br>
		    <button type="button" class="time-slot" value="17:00">17:00</button>
		    <button type="button" class="time-slot" value="18:00">18:00</button>
		    <button type="button" class="time-slot" value="19:00">19:00</button>
		    <button type="button" class="time-slot" value="20:00">20:00</button>
		    <button type="button" class="time-slot" value="21:00">21:00</button>
		 </div>

		<hr>
		<h3><인원 선택></h3>
		<div>
			<button type="button" class="people" value="1">1명</button>
			<button type="button" class="people" value="2">2명</button>
			<button type="button" class="people" value="3">3명</button>
			<button type="button" class="people" value="4">4명</button>
			<button type="button" class="people" value="5">5명</button><br>
			<button type="button" class="people" value="6">6명</button>
			<button type="button" class="people" value="7">7명</button>
			<button type="button" class="people" value="8">8명</button>
			<button type="button" class="people" value="9">9명</button>
			<button type="button" class="people" value="10">10명</button>
		</div>
		
		<p><strong>예약 시간 확인 ☞ </strong> <span id="final"></span></p>
		
		<hr>
		<h3><음식 선택></h3>
		<div>
		    <button type="button" class="category-btn" onclick="showCategory('korean')">한식</button>
		    <button type="button" class="category-btn" onclick="showCategory('western')">양식</button>
		    <button type="button" class="category-btn" onclick="showCategory('chinese')">중식</button>
		    <button type="button" class="category-btn" onclick="showCategory('japanese')">일식</button>
		</div>
		
		<div id="korean" class="menu-category">
    		<h3>한식</h3>
    		<c:forEach var="menu" items="${korean}">
    			<c:set var="total" value="값" />
    			
				<table width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
		                    <label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td style="width:150px;" rowspan="4">
		                    <img src="${menu.menuImage}"  onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
					  <td>
					    수량:
					    <div class="quantity-container">
					      <button type="button" class="qty-btn minus">-</button>
					      <input type="text" name="menuCount_${menu.menuNum}" class="qty-input" value="1" readonly>
					      <button type="button" class="qty-btn plus">+</button>
					    </div>
					  </td>
					</tr>
        		</table>
    		</c:forEach>
		</div>
		
		<script>
			
		
		</script>
		
		<div id="western" class="menu-category">
		    <h3>양식</h3>
		    <c:forEach var="menu" items="${western}">
		    	<c:set var="total" value="값" />
		    	
		        <table width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
		                    <label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
					  <td>
					    수량:
					    <div class="quantity-container">
					      <button type="button" class="qty-btn minus">-</button>
					      <input type="text" name="menuCount_${menu.menuNum}" class="qty-input" value="1" readonly>
					      <button type="button" class="qty-btn plus">+</button>
					    </div>
					  </td>
					</tr>
		        </table>
		    </c:forEach>
		</div>
		
		<div id="chinese" class="menu-category">
		    <h3>중식</h3>
		    <c:forEach var="menu" items="${chinese}">
		    	<c:set var="total" value="값" />
		    	
		        <table  width="300" style="margin-bottom: 10px;">
		            <tr>
		            	<td>
			            	<label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" width="100" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
					  <td>
					    수량:
					    <div class="quantity-container">
					      <button type="button" class="qty-btn minus">-</button>
					      <input type="text" name="menuCount_${menu.menuNum}" class="qty-input" value="1" readonly>
					      <button type="button" class="qty-btn plus">+</button>
					    </div>
					  </td>
					</tr>
		        </table>
		    </c:forEach>
		</div>
		
		<div id="japanese" class="menu-category">
		    <h3>일식</h3>
		    <c:forEach var="menu" items="${japanese}">
		    	<c:set var="total" value="값" />
				
		        <table width="300" style="margin-bottom: 10px;">
		            <tr>
		                <td>
			            	<label>
                       			 <input type="checkbox" name="selectedMenus" value="${menu.menuNum}">
                       		 	${menu.menuName}
                   			 </label>
							<input type="hidden" name="menuName_${menu.menuNum}" value="${menu.menuName}">
							<input type="hidden" name="menuPrice_${menu.menuNum}" value="${menu.menuPrice}">
		                </td>
		                <td rowspan="4">
		                    <img src="${menu.menuImage}" onerror="this.style.display='none'">
		                </td>
		            </tr>
		            <tr><td>${menu.menuDescription}</td></tr>
		            <tr><td>${menu.menuPrice}원</td></tr>
		            <tr>
					  <td>
					    수량:
					    <div class="quantity-container">
					      <button type="button" class="qty-btn minus">-</button>
					      <input type="text" name="menuCount_${menu.menuNum}" class="qty-input" value="1" readonly>
					      <button type="button" class="qty-btn plus">+</button>
					    </div>
					  </td>
					</tr>
		        </table>
		    </c:forEach>
		</div>
		
		<hr>
		<h3><요청 사항></h3>
		<textarea rows="4" cols="40" name="reservationRequest" placeholder="ex. 콩 알러지가 있어요. 콩 빼주세요."></textarea><p>
		<input type="submit" value="다음">
	</form>
	
	<jsp:include page="../footer.jsp"/>
	<script src="/JS/reservation.js"></script>	
</body>
</html>