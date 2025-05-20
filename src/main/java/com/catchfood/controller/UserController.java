package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchfood.dao.UserDao;
import com.catchfood.dto.UserDto;
import com.catchfood.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
		@Autowired
		UserDao userDao;
		
		@Autowired
		UserService userService;
		
		//회원가입 form
	    @RequestMapping("register")
	    public String register() {
	        return "User/register";
	    }
	    
	    
	    //회원가입 처리메소드
	    @RequestMapping("registerProcess")
	    public String registerProcess(HttpServletRequest request, @ModelAttribute UserDto user, Model model) {
	        String emailFront = request.getParameter("userEmail");
	        String emailDomain = request.getParameter("email");
	        String fullEmail = emailFront + "@" + emailDomain;

	        user.setUserEmail(fullEmail);

	        userService.register(user);

	        return "redirect:login";
	    }

	    //아이디 중복검사
	    @RequestMapping("/checkUserId")
	    @ResponseBody
	    public String checkUserId(@RequestParam("userId") String userId) {
	    	boolean isAvailable = userService.isUserIdAvailable(userId);
	        return isAvailable ? "available" : "duplicate";
	    }
	    
		//로그인 폼으로 가기
	    @RequestMapping("login")
	    public String loginForm() {
	    	return "User/login";
	    }
	    
	    
	    //로그인 성공시 -> main
	    @RequestMapping("loginSuccess")
	    public String loginSuccess( @RequestParam("userId") String userId, 
	    							@RequestParam("userPasswd") String userPasswd,
	    							HttpSession session,
	    							Model model) {
	    	UserDto loginUser = userService.login(userId, userPasswd);
	    	if (loginUser != null) {
	    		session.setAttribute("loginUser", loginUser); // 세션유지 
	    		
	    		//저장된 리다이렉트 경로
	            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
	            if (redirectUrl != null) {
	                session.removeAttribute("redirectAfterLogin"); // 사용 후 삭제
	                return "redirect:" + redirectUrl;
	            }
	    		
	    		return "redirect:/"; // 메인 페이지
	    	}else {
	    		model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
	            return "User/login"; //login폼
	    	}
	    }
	    
	    
	    //로그아웃 -> main
	    @RequestMapping("logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 세션 종료
	        return "redirect:/";  // 메인 페이지
	    }
	    
	    
	    //주소창 검색 jsp로 이동
	    @RequestMapping("popup")
		public String popup() {
			return "User/jusoPopup";
	    }

	    //회원 정보 수정 폼으로 이동
	    @RequestMapping("informationUpdate")
	    public String informationUpdateForm(HttpSession session,
	    									Model model) {
	    	UserDto loginUser = (UserDto) session.getAttribute("loginUser");
	    	if (loginUser == null) {
	            return "redirect:/login"; // 비로그인 상태면 로그인 페이지로
	        }

	        int userNum = loginUser.getUserNum();
	        UserDto updateUser = userDao.userInformationUpdate(userNum);

	        model.addAttribute("user", updateUser); // JSP에 넘길 사용자 정보
	        return "User/informationUpdate"; // 정보 수정 JSP
	    }
	    
	    //비밀번호 변경 폼으로 이동
	    @RequestMapping("passwordChange")
	    public String passwordChangeForm() {
	    	return "User/passwordChange"; //비밀번호 수정 jsp
	    }
	    
	    
	    //비밀번호 변경 후 -> main으로 
	    @RequestMapping("informationChange")
	    public String informationChangeForm(@RequestParam("newPassword") String newPassword,
	                                        @RequestParam("newPasswordCheck") String newPasswordCheck,
	                                        HttpSession session,
	                                        Model model) {

	        if (!newPassword.equals(newPasswordCheck)) {
	            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
	            return "User/passwordChange";
	        }

	        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
	        userService.updatePassword(loginUser.getUserNum(), newPassword);

	        return "redirect:/";
	    }

	   //회원 리스트
	   @RequestMapping("userList")
	   public String userlist(Model model) {
		   model.addAttribute("lists", userDao.userList());
		   return "User/userList";
	   }
	   
	   //아이디 찾기 폼
	   @RequestMapping("findIdForm")
	   public String findIdForm() {
		   return "User/findUserId";
	   }
	   
	   //아이디 찾기 실행
	   @RequestMapping("findUserId")
	   public String findUserId(@RequestParam("userEmail") String userEmail, Model model) {
		   String userId = userService.findUserIdByEmail(userEmail);
		    if (userId != null) {
		        model.addAttribute("userId", userId);
		    } else {
		        model.addAttribute("error", "일치하는 아이디가 없습니다.");
		    }
		    return "User/findIdResult";
	   }
	   
	   //비밀번호 찾기 폼
	   @RequestMapping("findPasswordForm")
	   public String findPwForm() {
		   return "User/findUserPassword";
	   }
	   
	   //비밀번호 찾기 실행
	   @RequestMapping("findUserPassword")
	   public String findUserPw(@RequestParam("userId") String userId, Model model) {
		   String userPasswd = userService.findUserIdByEmail(userId);
		    if (userPasswd != null) {
		        model.addAttribute("userPasswd", userPasswd);
		    } else {
		        model.addAttribute("error", "일치하는 아이디가 없습니다.");
		    }
		   return "User/findPasswordResult";
	   }
	   
	   
}