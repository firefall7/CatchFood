package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dao.NoticeDao;
import com.catchfood.dto.NoticeDto;

@Controller
public class NoticeController {

	@Autowired
	NoticeDao noticedao;
	
	@RequestMapping("noticelist")
	public String noticeList(
	        @RequestParam(name = "page", defaultValue = "1") int page,
	        Model model) {

	    int pageSize = 10;                         
	    int offset = (page - 1) * pageSize;       

	    model.addAttribute("noticeList", noticedao.noticePage(offset, pageSize));
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalCount", noticedao.noticeCount());
	    model.addAttribute("pageSize", pageSize);

	    return "Notice/noticelist";
	}
	
	@RequestMapping("noticeinsert")
    public String noticeInsert() {//HttpSession session
//        String role = (String) session.getAttribute("role");
//
//        if (role == null || !"admin".equals(role)) {
//            return "redirect:/access-denied";  // 권한 없으면 접근 차단
//        }
        return "Notice/noticeinsert";  // 작성 JSP로 이동
    }
	
	@RequestMapping("noticewrite")
	    public String noticeWrite(@ModelAttribute NoticeDto noticeDto) {//HttpSession session
	        //String adminId = (String) session.getAttribute("userId");

//	        String role = (String) session.getAttribute("role");
//	        if (adminId == null || !"admin".equals(role)) {
//	            return "redirect:/access-denied";
//	        }
//
//	        noticeDto.setNoticeAdminId(adminId);
//	        if (noticeDto.getNoticePinned() == null) {
//	            noticeDto.setNoticePinned(false);  // 체크 안하면 null로 들어오는 걸 방지
//	        }
//	        if (noticeDto.getNoticeActive() == null) {
//	            noticeDto.setNoticeActive(true);   // 기본 활성화
//	        }
			noticeDto.setNoticeAdminId("admin01");
	        noticedao.noticeInsert(noticeDto);

	        return "redirect:noticelist"; 
	    }
	@RequestMapping("noticedetail")
	public String noticeDetail(@RequestParam("noticeNum") int noticeNum, Model model) {

		
	    noticedao.noticeViewCount(noticeNum);

	    NoticeDto notice = noticedao.noticeDetail(noticeNum);
	    model.addAttribute("notice", notice);

	    return "Notice/noticedetail";  
	}
	
	@RequestMapping("/noticeupdate")
	public String noticeupdate(@RequestParam("noticeNum") int noticeNum, Model model) {
	    NoticeDto notice = noticedao.noticeDetail(noticeNum);
	    model.addAttribute("notice", notice);
	    return "Notice/noticeupdate"; 
	}
	
	@RequestMapping("/noticeupdateok")
	public String updateNotice(@ModelAttribute NoticeDto noticeDto) {

	    if (noticeDto.getNoticePinned() == null) {
	        noticeDto.setNoticePinned(0);
	    }
	    if (noticeDto.getNoticeActive() == null) {
	        noticeDto.setNoticeActive(1);
	    }

	    noticedao.noticeUpdate(noticeDto);
	    return "redirect:/notice/detail?noticeNum=" + noticeDto.getNoticeNum();
	}
	
	@RequestMapping("noticedelete")
	public String noticedelete(@RequestParam("noticeNum") int noticeNum) {
	    noticedao.noticeDelete(noticeNum);
	    return "redirect:/noticelist";
	}
}
