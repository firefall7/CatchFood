package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.NoticeDto;
@Mapper
public interface NoticeDao {
	List<NoticeDto> noticeList();
	
	public int noticeInsert(NoticeDto noticeDto);
	
	NoticeDto noticeDetail(int noticeNum);
	
	void noticeViewCount(int noticeNum);
	
	void noticeUpdate(NoticeDto dto);
	
	void noticeDelete(int noticeNum);
	
	List<NoticeDto> noticePage(@Param("offset") int offset, @Param("pageSize") int pageSize);
	
	int noticeCount();
	
	List<NoticeDto> getRecentNotices();
}
