<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.catchfood.dto.ReservationDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 화면</title>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- IMP전역 변수생성 -->
<link rel="stylesheet" href="/css/payment.css">
</head>
<body>
<div class="wrapper">
	<header> 
	<jsp:include page="../top.jsp"/>

	<%
    	ReservationDto dto = (ReservationDto) session.getAttribute("tempReservation");
		com.catchfood.dto.UserDto loginUser = (com.catchfood.dto.UserDto) session.getAttribute("loginUser");
	  
		String userId = loginUser.getUserId();
	  	String reservationDate = request.getParameter("reservationDate");
	  	int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
	  	
	  	String reservationRequest = request.getParameter("reservationRequest");
	 	String menuNums = request.getParameter("menuNums");
	  	String menuCounts = request.getParameter("menuCounts");
	  	String menuTotals = request.getParameter("menuTotals");
	  	
  		int total = Integer.parseInt(request.getParameter("total"));
	%>
	</header>
	
	<p class="paymentDesc">결제수단을 선택하세요.</p>
	
	<div class="payment-container" style="margin-bottom:500px">
		<div class="payment-form">
			<div class="row">
				<div><button onclick="requestPay('kakaopay.TC0ONETIME')">카카오페이</button></div>
				<div><button onclick="requestPay('tosspay.tosstest')">토스페이</button></div>
			</div>
			<div class="row">
				<div><button onclick="requestPay('payco.PARTNERTEST')">페이코</button></div>
				<div><button onclick="requestPay('html5_inicis')">카드결제</button></div>
			</div>
		</div>
	</div>
    <script>
      const totalAmount = <%= total %>;
      var IMP = window.IMP;
      IMP.init("imp46514803"); // 가맹점 식별코드

      function requestPay(pgValue) {
        IMP.request_pay({
          pg: pgValue,
          pay_method: "card",
          merchant_uid: "order_" + new Date().getTime(),
          name: "CatchFood 레스토랑",  //일시적으로 삽입
          amount: totalAmount, //일시적으로 삽입!!!!!!!!!!!!!!!!!
//           buyer_email: "test@test.com", //일시적으로 삽입
//           buyer_name: "류지호", //일시적으로 삽입
//           buyer_tel: "010-1234-5678", //일시적으로 삽입
//           buyer_addr: "부산시 해운대구", //일시적으로 삽입
//           buyer_postcode: "12345" //일시적으로 삽입
        }, function (rsp) {
          if (rsp.success) {
            alert("결제 성공!");
            
            const form = document.createElement("form");
            form.method = "post";
            form.action = "/reservation/complete";

            form.innerHTML = `
              <input type="hidden" name="imp_uid" value="${rsp.imp_uid}">
              <input type="hidden" name="userId" value='<%= userId %>'>
              <input type="hidden" name="reservationDate" value='<%= reservationDate %>'>
              <input type="hidden" name="reservationNumber" value='<%= reservationNumber %>'>
              <input type="hidden" name="reservationRequest" value='<%=reservationRequest%>'>
              <input type="hidden" name="menuNums" value="<%= String.join(",", dto.getMenuNum().stream().map(String::valueOf).toList()) %>">
              <input type="hidden" name="menuCounts" value="<%= String.join(",", dto.getMenuCount().stream().map(String::valueOf).toList()) %>">
              <input type="hidden" name="menuTotals" value="<%= String.join(",", dto.getMenuTotal().stream().map(String::valueOf).toList()) %>">
            `;

            document.body.appendChild(form);
            form.submit();
            
            // 여기서 백엔드로 imp_uid 넘기기 (예: fetch 또는 form submit)
          } else {
            alert("결제 실패: " + rsp.error_msg);
          }
        });
      }
    </script>
    
    <jsp:include page="../footer.jsp"/>
</body>
</html>
