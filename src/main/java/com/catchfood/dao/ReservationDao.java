package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.BasketViewDto;
import com.catchfood.dto.ReservationDto;

@Mapper
public interface ReservationDao {
	//예약 리스트 전체 보기(관리자)
	public List<ReservationDto> reservationList();
	
	//예약 상세보기(관리자)
	public List<BasketViewDto> reservationDetail(int reservationNum);
	
	//예약 삭제하기(관리자)
	public int reservationDelete(int reservationNum);
			
			
	//고객이 결제 하고난뒤 -> DB로 insert
	public int reservationInsert(ReservationDto reservationDto);
		
	//page
	public List<ReservationDto> reservationpage(@Param("offset") int offset, @Param("pageSize") int pageSize);
	
	int reservationCount();
}	
	
