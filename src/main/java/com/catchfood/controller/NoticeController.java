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
    public String noticeInsert() {

        return "Notice/noticeinsert";  // 작성 JSP로 이동
    }
	
	@RequestMapping("noticewrite")
	    public String noticeWrite(@ModelAttribute NoticeDto noticeDto) {//HttpSession session

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
	    return "redirect:/noticedetail?noticeNum=" + noticeDto.getNoticeNum();
	}
	
	@RequestMapping("noticedelete")
	public String noticedelete(@RequestParam("noticeNum") int noticeNum) {
	    noticedao.noticeDelete(noticeNum);
	    return "redirect:/noticelist";
	}
}
