<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.catchfood.dto.ReservationDto" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/reservationTemp.css">
</head>

<body>
<div class="container">
	
    <header>
        <jsp:include page="../top.jsp"/>
        <h1>예약 확인</h1>
    </header>

    <%
        ReservationDto dto = (ReservationDto)session.getAttribute("tempReservation");
	com.catchfood.dto.UserDto loginUser = (com.catchfood.dto.UserDto)session.getAttribute("loginUser");
        List<String> menuName = dto.getMenuName();
        List<Integer> menuCount = dto.getMenuCount();
        List<Integer> menuPrice = dto.getMenuPrice();

        int total = 0;
        if (menuName != null && menuCount != null && menuPrice != null) {
            int loopSize = Math.min(menuName.size(), Math.min(menuCount.size(), menuPrice.size()));
            for (int i = 0; i < loopSize; i++) {
                total += menuCount.get(i) * menuPrice.get(i);
            }
        }
    %>

    <div class="confirmation-box">
        <h2>예약 임시 확인 단계입니다.</h2>
	<div class="info">
        <p><strong>예약 날짜:</strong> <%= dto.getReservationDate() %></p>
        <p><strong>예약 인원:</strong> <%= dto.getReservationNumber() %></p>
        <p><strong>요구 사항:</strong> <%= dto.getReservationRequest() %></p>
        <p><strong>메뉴:</strong>
            <%
                if (menuName != null && menuCount != null) {
                    for (int i = 0; i < menuName.size(); i++) {
                        out.print(menuName.get(i) + " " + menuCount.get(i) + "개");
                        if (i < menuName.size() - 1) {
                            out.print(", ");
                        }
                    }
                } else {
                    out.print("메뉴 정보가 없습니다.");
                }
            %>
        </p>
        <p><strong>총 금액:</strong>
            <%
                if (menuName != null && menuCount != null && menuPrice != null) {
                    out.print(total + "원");
                } else {
                    out.print("가격 정보를 불러올 수 없습니다.");
                }
            %>
        </p>
        </div>
    </div>

    <p>날짜, 시간, 인원수, 주문내역이 같다면 결제를 눌러주세요.</p>

    <form name="paymentForm" method="post" action="/payment">
        <input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
        <input type="hidden" name="reservationDate" value="<%= dto.getReservationDate() %>">
        <input type="hidden" name="reservationNumber" value="<%= dto.getReservationNumber() %>">
        <input type="hidden" name="reservationRequest" value="<%= dto.getReservationRequest() %>">
        <input type="hidden" name="menuNums" value="<%= dto.getMenuNum().toString() %>">
        <input type="hidden" name="menuCounts" value="<%= dto.getMenuCount().toString() %>">
        <input type="hidden" name="menuTotals" value="<%= dto.getMenuTotal().toString() %>">
        <input type="hidden" name="total" value="<%= total %>">

        <button type="submit">결제</button>
    </form>

    <jsp:include page="../footer.jsp"/>
</div>
</body>
</html>
