package com.catchfood.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.catchfood.dao.ReviewDao;
import com.catchfood.dto.ReviewDto;
import com.catchfood.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Autowired
    private ReviewDao reviewdao;

    @RequestMapping("insert")
    public String insert(HttpSession session) {
    	UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        return "Review/reviewinsert";
    }

    @RequestMapping("writer")
    public String reviewInsert(@ModelAttribute ReviewDto dto,
                               @RequestParam("imageFile") MultipartFile[] files,
                               HttpSession session,
                               HttpServletRequest request,
                               Model model) {

        String webPath = "/images/";
        String realPath = request.getServletContext().getRealPath(webPath);
        StringBuilder imagePaths = new StringBuilder();

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    String originalName = file.getOriginalFilename();
                    String cleanName = originalName.replaceAll("[^가-힣a-zA-Z0-9._-]", "_");

                    File saveFile = new File(dir, cleanName);
                    int count = 1;
                    while (saveFile.exists()) {
                        String name = cleanName.substring(0, cleanName.lastIndexOf('.'));
                        String ext = cleanName.substring(cleanName.lastIndexOf('.'));
                        String newName = name + "_" + count + ext;
                        saveFile = new File(dir, newName);
                        cleanName = newName;
                        count++;
                    }

                    file.transferTo(saveFile);
                    imagePaths.append(webPath).append(cleanName).append(",");

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        if (!imagePaths.isEmpty()) {
            imagePaths.setLength(imagePaths.length() - 1); // 마지막 쉼표 제거
            dto.setReviewImage(imagePaths.toString());
        }

        dto.setReviewDay(LocalDateTime.now());
        reviewdao.ReviewInsert(dto);

        return "redirect:/review";
    }

    @RequestMapping("review")
    public String ReviewListPage(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        int startRow = (page - 1) * pageSize;
        int totalCount = reviewdao.getTotalCount();
        int totalPage = (int) Math.ceil(totalCount / (double) pageSize);

        List<ReviewDto> reviewList = reviewdao.ReviewListPage(startRow, pageSize);

        model.addAttribute("review", reviewList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("totalCount", totalCount);
        return "Review/reviewlist";
    }
    
    @RequestMapping("reviewdelete")
    public String ReviewDelete(@RequestParam("reviewNum")int reviewNum) {
    	reviewdao.ReviewDelete(reviewNum);
    	return"redirect:review";
    }
}