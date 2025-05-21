package com.catchfood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchfood.dao.MenuDao;
import com.catchfood.dao.NoticeDao;

@Controller
public class MainController {
	@Autowired
	MenuDao menudao;
	
	@Autowired
	NoticeDao noticedao;
	@RequestMapping("/")
	public String root(Model model) {
		 model.addAttribute("rec", menudao.recommendmenu());
		 model.addAttribute("mainNotices", noticedao.getRecentNotices());
		return "main";
	}
	
	
}
