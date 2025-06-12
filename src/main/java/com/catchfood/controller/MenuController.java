package com.catchfood.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.catchfood.dao.MenuDao;
import com.catchfood.dto.MenuDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MenuController {
	@Autowired
	MenuDao menudao;
	
	@RequestMapping("/menulist")
	public String getMenusByCategory(Model model) {
	    model.addAttribute("korean", menudao.getMenusByCategory(1));
	    model.addAttribute("western", menudao.getMenusByCategory(2));
	    model.addAttribute("chinese", menudao.getMenusByCategory(3));
	    model.addAttribute("japanese", menudao.getMenusByCategory(4)); 
	    return "Menu/menulist";
	} 
	
	@RequestMapping("/menuselect")
	public String showMenuSelect(@RequestParam("reservationNum") int reservationNum,
	                                @RequestParam("userNum") int userNum,
	                                 Model model) {
	    model.addAttribute("korean", menudao.getMenusByCategory(1));
	    model.addAttribute("western", menudao.getMenusByCategory(2));
	    model.addAttribute("chinese", menudao.getMenusByCategory(3));
	    model.addAttribute("japanese", menudao.getMenusByCategory(4));

	    model.addAttribute("reservationNum", reservationNum);
	    model.addAttribute("userNum", userNum);

	    return "Menu/menuselect";
	}
	
	@RequestMapping("menuinsert")
	public String insert(HttpSession session) {
//	    String role = (String) session.getAttribute("role");
//	    if (!"admin".equals(role)) {
//	        return "redirect:/";
//	    }
		return "Menu/menuinsert";
	}

	@RequestMapping("menuwrite")
	public String menuinsert(@ModelAttribute MenuDto menudto,
	                         @RequestParam("menuImagePath") MultipartFile file,
	                         HttpServletRequest request) throws Exception {

	    String webPath = "/images/";
	    String realPath = request.getServletContext().getRealPath(webPath);  

	    if (!file.isEmpty()) {
	        String fileName = file.getOriginalFilename();  // ✅ 변경: 타임스탬프 제거

	        // 중복 방지를 위한 추가 로직 (선택)
	        File saveFile = new File(realPath, fileName);
	        int count = 1;
	        while (saveFile.exists()) {
	            String name = fileName.substring(0, fileName.lastIndexOf("."));
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            saveFile = new File(realPath, name + "_" + count + ext);
	            fileName = name + "_" + count + ext;
	            count++;
	        }

	        File dir = new File(realPath);
	        if (!dir.exists()) dir.mkdirs();

	        file.transferTo(saveFile);

	        menudto.setMenuImage(webPath + fileName);  
	    }

	    if (menudto.getMenuRecommend() == null) menudto.setMenuRecommend(0);
	    menudto.setMenuCount(0);
	    menudto.setMenuPTotal(0);

	    menudao.insertmenu(menudto);
	    return "redirect:menulist";
	}
	
	@RequestMapping("menudetail")
	public String menudetail(@RequestParam("menuNum") int menuNum, Model model) throws Exception {
	    MenuDto menudto = menudao.menudetail(menuNum);
	    model.addAttribute("menuDetail", menudto);
	    return "Menu/updatemenu";
	}

	@RequestMapping("menuupdate")
	public String menuUpdate(@ModelAttribute MenuDto menudto,
	                         @RequestParam("menuImagePath") MultipartFile file,
	                         HttpServletRequest request) throws Exception {

	    if (menudto.getMenuRecommend() == null) {
	        menudto.setMenuRecommend(0);
	    }

	    MenuDto original = menudao.menudetail(menudto.getMenuNum());

	    if (!file.isEmpty()) {
	        String webPath = "/images/";
	        String realPath = request.getServletContext().getRealPath(webPath);
	        String fileName = file.getOriginalFilename(); // ✅ 타임스탬프 제거

	        File saveFile = new File(realPath, fileName);
	        int count = 1;
	        while (saveFile.exists()) {
	            String name = fileName.substring(0, fileName.lastIndexOf("."));
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            saveFile = new File(realPath, name + "_" + count + ext);
	            fileName = name + "_" + count + ext;
	            count++;
	        }

	        File dir = new File(realPath);
	        if (!dir.exists()) dir.mkdirs();

	        file.transferTo(saveFile);
	        menudto.setMenuImage(webPath + fileName);
		    } else {
		        menudto.setMenuImage(original.getMenuImage());
		    }

	    menudao.updatemenu(menudto);
	    return "redirect:menulist";
	}

	@RequestMapping("menudelete")
	public String deletemenu(@RequestParam("menuNum") int menuNum) {
	    menudao.deletemenu(menuNum);
	    return "redirect:menulist";
	}
	
	@RequestMapping("recommendmenu")
	public String recommendmenu(Model model) {
		List<MenuDto> recommendedMenu = menudao.recommendmenu();
	    model.addAttribute("rec",recommendedMenu) ;
	    return "Menu/recommendmenu";
	}

}