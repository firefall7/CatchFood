package com.catchfood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchfood.dao.BasketDao;
import com.catchfood.dto.BasketViewDto;
import com.catchfood.dto.UserDto;

import jakarta.servlet.http.HttpSession;
@Controller
public class BasketController {
	@Autowired
	BasketDao basketdao;
	
	//예약 현황 폼
	@RequestMapping("mybasket")
	public String mybasket(HttpSession session, Model model) {
		UserDto loginUser = (UserDto)session.getAttribute("loginUser"); 
		 if (loginUser == null) {
			 session.setAttribute("redirectAfterLogin", "/mybasket"); // 돌아올 URL 저장
	         return "redirect:/login";
	       }
		 
		 int userNum = loginUser.getUserNum();
	     List<BasketViewDto> myreservation = basketdao.MyBasket(userNum);
	     model.addAttribute("myreservation", myreservation);
	     return "Basket/mybasket";

	} 
}
