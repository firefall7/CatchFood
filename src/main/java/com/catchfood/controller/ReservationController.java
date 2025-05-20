package com.catchfood.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dao.BasketDao;
import com.catchfood.dao.MenuDao;
import com.catchfood.dao.ReservationDao;
import com.catchfood.dao.UserDao;
import com.catchfood.dto.BasketViewDto;
import com.catchfood.dto.ReservationDto;
import com.catchfood.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	MenuDao menudao;
	
	@Autowired
	BasketDao basketDao;

	@Autowired
	UserDao userDao; 

	
	//예약 폼
	@RequestMapping("reservation")
	public String reservationForm(HttpSession session, Model model) {	
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			session.setAttribute("redirectAfterLogin", "/reservation"); // 돌아올 URL 저장
			return "redirect:/login"; // 비로그인 상태면 로그인 페이지로
		}

		int userNum = loginUser.getUserNum();
		UserDto updateUser = userDao.userInformationUpdate(userNum);
			
		model.addAttribute("korean", menudao.getMenusByCategory(1));
		model.addAttribute("western", menudao.getMenusByCategory(2));
		model.addAttribute("chinese", menudao.getMenusByCategory(3));
		model.addAttribute("japanese", menudao.getMenusByCategory(4));
		
		model.addAttribute("user", updateUser); // JSP에 넘길 사용자 정보
		return "Reservation/reservation";
	}
	
//	//예약 폼
//	@RequestMapping("reservation")
//	public String reservationForm(Model model) {	
//	    model.addAttribute("korean", menudao.getMenusByCategory(1));
//	    model.addAttribute("western", menudao.getMenusByCategory(2));
//	    model.addAttribute("chinese", menudao.getMenusByCategory(3));
//	    model.addAttribute("japanese", menudao.getMenusByCategory(4));
//		return "Reservation/reservation";
//	}


	//예약 임시 확인 페이지
	@PostMapping("reservationTemp")
	public String sessionInsert(HttpServletRequest request, HttpSession session){

	    String[] selected = request.getParameterValues("selectedMenus");

	    List<String> menuNameList = new ArrayList<>();
	    List<Integer> menuCountList = new ArrayList<>();
	    List<Integer> menuPriceList = new ArrayList<>();
	    List<Integer> menuNumList = new ArrayList<>();
	    List<Integer> menuTotalList = new ArrayList<>();

	    for (String menuNum : selected) {
	        String name = request.getParameter("menuName_" + menuNum);
	        String countStr = request.getParameter("menuCount_" + menuNum);
	        String priceStr = request.getParameter("menuPrice_" + menuNum);

	        if (name != null && countStr != null && priceStr != null) {
	        	int count = Integer.parseInt(countStr);
	            int price = Integer.parseInt(priceStr);
	        	
	            menuNameList.add(name);
	            menuCountList.add(Integer.parseInt(countStr));
	            menuPriceList.add(Integer.parseInt(priceStr));
	            menuNumList.add(Integer.parseInt(menuNum));
	            menuTotalList.add(count * price);
	            
	        }
	    }

	    //DTO 직접 생성
	    ReservationDto reservationDto = new ReservationDto();

	    //메뉴 정보 넣기
	    reservationDto.setMenuName(menuNameList);
	    reservationDto.setMenuCount(menuCountList);
	    reservationDto.setMenuPrice(menuPriceList);
	    reservationDto.setMenuNum(menuNumList);
	    reservationDto.setMenuTotal(menuTotalList);


	    //추가로 날짜, 인원, 요청사항 등도 수동으로 꺼내서 세팅
	    reservationDto.setReservationDate(request.getParameter("reservationDate"));
	    reservationDto.setReservationNumber(Integer.parseInt(request.getParameter("reservationNumber")));
	    reservationDto.setReservationRequest  (request.getParameter("reservationRequest"));

	    //세션에 저장
	    session.setAttribute("tempReservation", reservationDto);

	    return "Reservation/reservationConfirmation";
	}
	
	
	//결제 완료 후 장바구니에 insert -> 메인페이지로 이동
	@PostMapping("/reservation/complete")
	public String reservationComplete(HttpServletRequest request) {

	    //String userId = request.getParameter("userId");
	    //int userNum = 1; // ⚠️ 지금은 로그인 구현 안 되었으므로 임시 userNum
		String userId = request.getParameter("userId");
		int userNum = userDao.findByUserId(userId).getUserNum(); // ← 이게 실제 사용


	    // 예약 정보
	    String reservationDate = request.getParameter("reservationDate");
	    int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
	    String reservationRequest = request.getParameter("reservationRequest");
	    // DTO 생성
	    ReservationDto reservationDto = new ReservationDto();
	    reservationDto.setReservationDate(reservationDate);
	    reservationDto.setReservationNumber(reservationNumber);
	    reservationDto.setReservationRequest(reservationRequest);
	    reservationDto.setUserNum(userNum);

	    // 예약 저장
	    reservationDao.reservationInsert(reservationDto);
	    int reservationNum = reservationDto.getReservationNum();

	    // 메뉴 정보 처리
	    String[] menuNums = request.getParameter("menuNums").replaceAll("[\\[\\] ]", "").split(",");
	    String[] menuCounts = request.getParameter("menuCounts").replaceAll("[\\[\\] ]", "").split(",");
	    String[] menuTotals = request.getParameter("menuTotals").replaceAll("[\\[\\] ]", "").split(",");

	    for (int i = 0; i < menuNums.length; i++) {
	        com.catchfood.dto.BasketDto basketDto = new com.catchfood.dto.BasketDto();
	        basketDto.setReservationNum(reservationNum);
	        basketDto.setUserNum(userNum);
	        basketDto.setMenuNum(Integer.parseInt(menuNums[i]));
	        basketDto.setBasketCount(Integer.parseInt(menuCounts[i]));
	        basketDto.setBasketPTotal(Integer.parseInt(menuTotals[i]));

	        basketDao.BasketInsert(basketDto);
	    }

	    return "redirect:/";
	}

	
	
	//★★관리자는 여기서 부터★★
	//예약 리스트(관리자용)
	@RequestMapping("reservationList")
	public String list(@RequestParam(name = "page", defaultValue = "1") int page,Model model) {
	    
		int pageSize = 10;                         
	    int offset = (page - 1) * pageSize;  
	    int totalCount = reservationDao.reservationCount();
	    
		model.addAttribute("lists", reservationDao.reservationpage(offset, pageSize));
	    model.addAttribute("currentPage", page);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalCount", totalCount);
		return "Reservation/reservationList";
	}
	
	
	
	//예약 상세보기
	@RequestMapping("reservationDetail")
	public String detail(@RequestParam("reservationNum") int reservationNum, Model model) {
		List<BasketViewDto> detailList = reservationDao.reservationDetail(reservationNum);
		model.addAttribute("detailList", detailList);
		return "Reservation/reservationDetail";
	}
	
	//예약 삭제
	@RequestMapping("reservationDelete")
	public String delete(ReservationDto reservationDto) {
		reservationDao.reservationDelete(reservationDto.getReservationNum());
		return "redirect:reservationList";
	}
	
	
}
