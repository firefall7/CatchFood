package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dto.ReviewDto;

@Mapper
public interface ReviewDao {
    List<ReviewDto> ReviewListPage(@Param("startRow") int startRow, 
                                   @Param("pageSize") int pageSize);

    public int ReviewInsert(ReviewDto dto);

    public int getTotalCount();
    
    public void ReviewDelete(@RequestParam("reviewNum") int reviewNum);
    
  
}
